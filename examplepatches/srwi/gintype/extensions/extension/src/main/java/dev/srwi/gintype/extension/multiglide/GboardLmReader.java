package dev.srwi.gintype.extension.multiglide;

import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Locale;

/**
 * Pure-Java parser for Gboard Delight5 {@code .lm} binary language model files.
 *
 * <p>Reads only the chunks required for swipe decoding:
 * <ul>
 *   <li>Chunk {@code 0x20} ({@code MarisaSymbolTable}): nested LOUDS Marisa trie and
 *       relabeled word symbol ID table.</li>
 *   <li>Chunk {@code 0x2} ({@code CompactLmFst} / {@code NGramFst}): quantized unigram
 *       and bigram negative log probabilities mapped into {@link MultiGlideTrie} and
 *       {@link MultiGlideBigramTable}.</li>
 * </ul>
 */
public final class GboardLmReader {

    public static final int LM_MAGIC = 0x07506F06;
    private static final long CHUNK_COMPACT_LM = 0x2L;
    private static final long CHUNK_MARISA_SYMBOLS = 0x20L;
    private static final byte[] MARISA_MAGIC = "We love Marisa.\0".getBytes(StandardCharsets.US_ASCII);

    /** Cap bigrams kept in memory to the strongest continuations to bound heap and load latency. */
    static final int DEFAULT_MAX_BIGRAMS = 200_000;

    /** Cap synthesized 2-part compounds ({@code X_ -> _Y}); 120k admits 100% of Gboard 2-part compounds. */
    static final int DEFAULT_MAX_COMPOUNDS = 120_000;

    /** Cap synthesized 3-part compounds (explicit Level-2 trigrams + top chained {@code X_ -> _Y_ -> _Z}). */
    static final int DEFAULT_MAX_TRIPLE_COMPOUNDS = 50_000;

    /** Maximum individual bigram step weight {@code q} allowed when chaining 3-part compounds. */
    static final int MAX_CHAINED_TRIPLE_EDGE_Q = 96;

    private static final int MAX_JOINT_COMPOUND_Q = 510;
    private static final int MAX_TRIPLE_COMPOUND_Q = 765;
    private static final int DEFAULT_BIGRAM_SCALE_COUNT = 100_000;

    private GboardLmReader() {}

    public static final class LmDictionaries {
        public final MultiGlideTrie trie;
        public final MultiGlideBigramTable bigrams;
        public final int cleanWordCount;
        public final int bigramCount;
        public final int compoundWordCount;

        LmDictionaries(MultiGlideTrie trie, MultiGlideBigramTable bigrams, int cleanWordCount, int bigramCount) {
            this(trie, bigrams, cleanWordCount, bigramCount, 0);
        }

        LmDictionaries(
                MultiGlideTrie trie,
                MultiGlideBigramTable bigrams,
                int cleanWordCount,
                int bigramCount,
                int compoundWordCount
        ) {
            this.trie = trie;
            this.bigrams = bigrams;
            this.cleanWordCount = cleanWordCount;
            this.bigramCount = bigramCount;
            this.compoundWordCount = compoundWordCount;
        }
    }

    /**
     * Checks quickly whether {@code file} starts with the uncompressed Gboard {@code .lm} magic.
     */
    public static boolean isLmFile(File file) {
        if (file == null || !file.isFile() || file.length() < 32L) {
            return false;
        }
        try (RandomAccessFile raf = new RandomAccessFile(file, "r")) {
            byte[] hdr = new byte[4];
            raf.readFully(hdr);
            int magic = (hdr[0] & 0xFF)
                    | ((hdr[1] & 0xFF) << 8)
                    | ((hdr[2] & 0xFF) << 16)
                    | ((hdr[3] & 0xFF) << 24);
            return magic == LM_MAGIC;
        } catch (IOException e) {
            return false;
        }
    }

    public static LmDictionaries read(
            File lmFile,
            String lang,
            boolean hasDedicatedUmlautKeys
    ) throws IOException {
        return read(lmFile, lang, hasDedicatedUmlautKeys, DEFAULT_MAX_BIGRAMS);
    }

    public static LmDictionaries read(
            File lmFile,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams
    ) throws IOException {
        return read(lmFile, lang, hasDedicatedUmlautKeys, maxBigrams, DEFAULT_MAX_COMPOUNDS);
    }

    public static LmDictionaries read(
            File lmFile,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds
    ) throws IOException {
        return read(lmFile, lang, hasDedicatedUmlautKeys, maxBigrams, maxCompounds, DEFAULT_MAX_TRIPLE_COMPOUNDS);
    }

    public static LmDictionaries read(
            File lmFile,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds,
            int maxTripleCompounds
    ) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(lmFile, "r");
             FileChannel ch = raf.getChannel()) {
            long fileLen = ch.size();
            if (fileLen < 16L) {
                throw new IOException("LM file too small: " + lmFile);
            }
            ByteBuffer fileHdr = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
            readFully(ch, fileHdr, 0L);
            fileHdr.flip();
            int magic = fileHdr.getInt();
            if (magic != LM_MAGIC) {
                throw new IOException("Unsupported LM magic 0x" + Integer.toHexString(magic) + " in " + lmFile);
            }

            long symOff = -1L;
            int symSize = 0;
            long fstOff = -1L;
            int fstSize = 0;

            ByteBuffer chunkHdr = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
            long pos = 16L;
            while (pos + 16L <= fileLen) {
                chunkHdr.clear();
                readFully(ch, chunkHdr, pos);
                chunkHdr.flip();
                long chunkType = chunkHdr.getLong();
                long chunkSize = chunkHdr.getLong();
                long dataOff = pos + 16L;
                if (chunkSize < 0 || dataOff + chunkSize > fileLen) {
                    throw new IOException("Corrupt LM chunk header at " + pos + " (size=" + chunkSize + ")");
                }
                if (chunkType == CHUNK_MARISA_SYMBOLS) {
                    symOff = dataOff;
                    symSize = checkChunkSize(chunkSize, "MarisaSymbolTable");
                } else if (chunkType == CHUNK_COMPACT_LM) {
                    fstOff = dataOff;
                    fstSize = checkChunkSize(chunkSize, "CompactLmFst");
                }
                pos = dataOff + chunkSize;
                if (symOff >= 0 && fstOff >= 0) {
                    break;
                }
            }

            if (symOff < 0 || fstOff < 0) {
                throw new IOException("Missing required LM chunks (0x20=" + (symOff >= 0)
                        + ", 0x2=" + (fstOff >= 0) + ") in " + lmFile);
            }

            byte[] symData = readChunkBytes(ch, symOff, symSize);
            SymbolTable symbols = parseMarisaSymbolTable(symData, symOff);
            symData = null; // Release symbol chunk before reading FST chunk to reduce peak heap
            byte[] fstData = readChunkBytes(ch, fstOff, fstSize);
            return parseCompactLm(
                    symbols, fstData, fstOff,
                    lang, hasDedicatedUmlautKeys, maxBigrams, maxCompounds, maxTripleCompounds);
        }
    }

    /**
     * Parses an entire in-memory {@code .lm} stream (convenient for tests).
     */
    public static LmDictionaries read(
            InputStream stream,
            String lang,
            boolean hasDedicatedUmlautKeys
    ) throws IOException {
        return readFromBytes(
                readAllBytes(stream), lang, hasDedicatedUmlautKeys,
                DEFAULT_MAX_BIGRAMS, DEFAULT_MAX_COMPOUNDS, DEFAULT_MAX_TRIPLE_COMPOUNDS);
    }

    public static LmDictionaries readFromBytes(
            byte[] lmBytes,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams
    ) throws IOException {
        return readFromBytes(
                lmBytes, lang, hasDedicatedUmlautKeys,
                maxBigrams, DEFAULT_MAX_COMPOUNDS, DEFAULT_MAX_TRIPLE_COMPOUNDS);
    }

    public static LmDictionaries readFromBytes(
            byte[] lmBytes,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds
    ) throws IOException {
        return readFromBytes(
                lmBytes, lang, hasDedicatedUmlautKeys,
                maxBigrams, maxCompounds, DEFAULT_MAX_TRIPLE_COMPOUNDS);
    }

    public static LmDictionaries readFromBytes(
            byte[] lmBytes,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds,
            int maxTripleCompounds
    ) throws IOException {
        if (lmBytes.length < 16) {
            throw new IOException("LM buffer too small");
        }
        ByteBuffer buf = ByteBuffer.wrap(lmBytes).order(ByteOrder.LITTLE_ENDIAN);
        int magic = buf.getInt(0);
        if (magic != LM_MAGIC) {
            throw new IOException("Unsupported LM magic 0x" + Integer.toHexString(magic));
        }

        long symOff = -1L;
        byte[] symData = null;
        long fstOff = -1L;
        byte[] fstData = null;

        int pos = 16;
        while (pos + 16 <= lmBytes.length) {
            long chunkType = buf.getLong(pos);
            long chunkSize = buf.getLong(pos + 8);
            int dataOff = pos + 16;
            if (chunkSize < 0 || dataOff + chunkSize > lmBytes.length) {
                throw new IOException("Corrupt LM chunk at " + pos);
            }
            int len = (int) chunkSize;
            if (chunkType == CHUNK_MARISA_SYMBOLS) {
                symOff = dataOff;
                symData = Arrays.copyOfRange(lmBytes, dataOff, dataOff + len);
            } else if (chunkType == CHUNK_COMPACT_LM) {
                fstOff = dataOff;
                fstData = Arrays.copyOfRange(lmBytes, dataOff, dataOff + len);
            }
            pos = dataOff + len;
        }

        if (symData == null || fstData == null) {
            throw new IOException("Missing required LM chunks (0x20=" + (symData != null)
                    + ", 0x2=" + (fstData != null) + ")");
        }
        return parseChunks(
                symData, symOff, fstData, fstOff,
                lang, hasDedicatedUmlautKeys, maxBigrams, maxCompounds, maxTripleCompounds);
    }

    private static final class SymbolTable {
        final String[] cleanWords;
        final String[] compoundPrefixes;
        final String[] compoundInfixes;
        final String[] compoundSuffixes;

        SymbolTable(
                String[] cleanWords,
                String[] compoundPrefixes,
                String[] compoundInfixes,
                String[] compoundSuffixes
        ) {
            this.cleanWords = cleanWords;
            this.compoundPrefixes = compoundPrefixes;
            this.compoundInfixes = compoundInfixes;
            this.compoundSuffixes = compoundSuffixes;
        }
    }

    private static LmDictionaries parseChunks(
            byte[] symData,
            long symFileOffset,
            byte[] fstData,
            long fstFileOffset,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds,
            int maxTripleCompounds
    ) throws IOException {
        SymbolTable symbols = parseMarisaSymbolTable(symData, symFileOffset);
        return parseCompactLm(
                symbols, fstData, fstFileOffset,
                lang, hasDedicatedUmlautKeys, maxBigrams, maxCompounds, maxTripleCompounds);
    }

    // -------------------------------------------------------------------------
    // Chunk 0x20: MarisaSymbolTable + relabel map
    // -------------------------------------------------------------------------

    private static SymbolTable parseMarisaSymbolTable(byte[] data, long chunkFileOffset) throws IOException {
        if (data.length < 32) {
            throw new IOException("MarisaSymbolTable chunk too small");
        }
        ByteBuffer buf = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
        int nameLen = buf.getInt(4);
        if (nameLen < 0 || 8 + nameLen + 12 > data.length) {
            throw new IOException("Invalid MarisaSymbolTable nameLen=" + nameLen);
        }
        int digestLenPos = 8 + nameLen;
        int digestLen = buf.getInt(digestLenPos);
        int mszPos = digestLenPos + 4 + digestLen;
        if (digestLen < 0 || mszPos + 8 > data.length) {
            throw new IOException("Invalid MarisaSymbolTable digestLen=" + digestLen);
        }
        long marisaSizeLong = buf.getLong(mszPos);
        int headerEnd = mszPos + 8;
        int marisaOff = align16Relative(chunkFileOffset, headerEnd);
        if (!matchesAt(data, marisaOff, MARISA_MAGIC)) {
            int scanned = findBytes(data, MARISA_MAGIC, headerEnd, Math.min(data.length, headerEnd + 64));
            if (scanned < 0) {
                throw new IOException("Marisa magic not found in symbol table");
            }
            marisaOff = scanned;
        }
        int marisaSize = checkChunkSize(marisaSizeLong, "marisaTrie");
        if (marisaOff + marisaSize + 16 > data.length) {
            throw new IOException("Marisa trie exceeds symbol chunk bounds");
        }

        MarisaReader reader = new MarisaReader(data, marisaOff + 16, marisaOff + marisaSize);
        byte[][] keys = decodeLoudsLevel(reader, 0).termKeys;

        int afterMarisa = marisaOff + marisaSize;
        // u64 block size precedes 16-byte aligned (stride, byteLen, packed indices)
        int relOff = align16Relative(chunkFileOffset, afterMarisa + 8);
        if (relOff + 16 > data.length) {
            throw new IOException("Relabel header out of bounds");
        }
        long strideLong = buf.getLong(relOff);
        long byteLenLong = buf.getLong(relOff + 8);
        if (strideLong <= 0 || strideLong > 8 || byteLenLong < 0 || relOff + 16 + byteLenLong > data.length) {
            throw new IOException("Invalid relabel table stride=" + strideLong + ", len=" + byteLenLong);
        }
        int stride = (int) strideLong;
        int count = (int) (byteLenLong / stride);
        int tblStart = relOff + 16;

        String[] words = new String[count];
        String[] compoundPrefixes = new String[count];
        String[] compoundInfixes = new String[count];
        String[] compoundSuffixes = new String[count];
        CharsetDecoder utf8 = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT);

        for (int sym = 0; sym < count; sym++) {
            int val = readLittleEndianInt(data, tblStart + sym * stride, stride);
            int kid = val - 1;
            if (kid < 0 || kid >= keys.length) {
                continue;
            }
            byte[] raw = keys[kid];
            if (raw.length == 0 || hasControlBytePrefix(raw)) {
                continue;
            }
            try {
                String decoded = utf8.decode(ByteBuffer.wrap(raw)).toString();
                utf8.reset();
                if (isUsableVocabularyWord(decoded)) {
                    words[sym] = decoded;
                } else {
                    int dLen = decoded.length();
                    if (dLen > 2 && decoded.startsWith("_") && decoded.endsWith("_")) {
                        String stem = decoded.substring(1, dLen - 1);
                        if (isUsableCompoundPart(stem)) {
                            compoundInfixes[sym] = stem;
                        }
                    } else if (dLen > 1 && decoded.endsWith("_") && !decoded.startsWith("_")) {
                        String stem = decoded.substring(0, dLen - 1);
                        if (isUsableCompoundPart(stem)) {
                            compoundPrefixes[sym] = stem;
                        }
                    } else if (dLen > 1 && decoded.startsWith("_") && !decoded.endsWith("_")) {
                        String stem = decoded.substring(1);
                        if (isUsableCompoundPart(stem)) {
                            compoundSuffixes[sym] = stem;
                        }
                    }
                }
            } catch (CharacterCodingException ignored) {
                utf8.reset();
            }
        }
        return new SymbolTable(words, compoundPrefixes, compoundInfixes, compoundSuffixes);
    }

    private static boolean isUsableCompoundPart(String stem) {
        return !stem.isEmpty() && Character.isLetter(stem.charAt(0)) && isUsableVocabularyWord(stem);
    }

    private static boolean hasControlBytePrefix(byte[] raw) {
        int b0 = raw[0] & 0xFF;
        return b0 < 0x20 || (b0 >= 0x7F && b0 <= 0x9F);
    }

    static boolean isUsableVocabularyWord(String word) {
        int len = word.length();
        if (len == 0) return false;
        if ("<epsilon>".equals(word) || "<UNK>".equals(word)) return false;
        for (int i = 0; i < len; i++) {
            char c = word.charAt(i);
            if (c == '_' || Character.isDigit(c)) {
                return false;
            }
            if (c < 0x20 || (c >= 0x7F && c <= 0x9F)) {
                return false;
            }
            if (!Character.isLetter(c) && c != '\'' && c != '-') {
                return false;
            }
        }
        return true;
    }

    // -------------------------------------------------------------------------
    // Chunk 0x2: CompactLmFst / NGramFst unigrams + bigrams
    // -------------------------------------------------------------------------

    private static LmDictionaries parseCompactLm(
            SymbolTable symbols,
            byte[] data,
            long chunkFileOffset,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxBigrams,
            int maxCompounds,
            int maxTripleCompounds
    ) throws IOException {
        if (data.length < 120) {
            throw new IOException("CompactLmFst chunk too small");
        }
        ByteBuffer buf = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
        int numWords = buf.getInt(70);
        int numTail = buf.getInt(74);
        float scale = buf.getFloat(79);
        long ngramSize = buf.getLong(83);
        if (numWords <= 0 || numTail < 0 || numTail > numWords || ngramSize < 24 || !Float.isFinite(scale) || scale <= 0f) {
            throw new IOException("Invalid CompactLmFst header: numWords=" + numWords
                    + ", numTail=" + numTail + ", scale=" + scale + ", ngramSize=" + ngramSize);
        }

        int ngramOff = align16Relative(chunkFileOffset, 91);
        long bsOffLong = ngramOff + ((ngramSize + 7L) & ~7L);
        long bsBytesLong = ((numWords + 63L) / 64L) * 8L;
        if (bsOffLong < 0 || bsBytesLong < 0 || bsOffLong + bsBytesLong + numTail > data.length) {
            throw new IOException("CompactLmFst tail weights exceed chunk length");
        }
        int bsOff = (int) bsOffLong;
        int tailOff = (int) (bsOffLong + bsBytesLong);

        long numStates = buf.getLong(ngramOff);
        long numFutures = buf.getLong(ngramOff + 8);
        long numFinal = buf.getLong(ngramOff + 16);
        int sInt = checkChunkSize(numStates, "numStates");
        int fInt = checkChunkSize(numFutures, "numFutures");
        int nfinInt = checkChunkSize(numFinal, "numFinal");

        long b1Long = ((2L * sInt + 1L + 63L) / 64L) * 8L;
        long b2Long = ((fInt + (long) sInt + 1L + 63L) / 64L) * 8L;
        long b3Long = ((sInt + 63L) / 64L) * 8L;

        long oCtxBvLong = ngramOff + 24L;
        long oFutBvLong = oCtxBvLong + b1Long;
        long oCtxWordsLong = oFutBvLong + b2Long + b3Long;
        long oFutWordsLong = oCtxWordsLong + (sInt + 1L) * 2L;
        long oCtxWeightsLong = oFutWordsLong + fInt * 2L;
        long oFutWeightsLong = oCtxWeightsLong + (sInt + 1L) + nfinInt;
        if (oFutWeightsLong < 0 || oFutWeightsLong + fInt > data.length) {
            throw new IOException("NGramFst arrays exceed chunk bounds");
        }
        int oCtxBv = (int) oCtxBvLong;
        int oFutBv = (int) oFutBvLong;
        int oCtxWords = (int) oCtxWordsLong;
        int oFutWords = (int) oFutWordsLong;
        int oCtxWeights = (int) oCtxWeightsLong;
        int oFutWeights = (int) oFutWeightsLong;

        String[] symWords = symbols.cleanWords;
        int numComp = numWords - numTail;
        int[] compToSym = new int[numComp];
        int symCap = Math.max(numWords, symWords.length);
        int[] symToQ = new int[symCap];
        Arrays.fill(symToQ, 255);

        int compIdx = 0;
        int tailIdx = 0;
        for (int sym = 0; sym < numWords; sym++) {
            int wordOff = bsOff + ((sym >>> 6) << 3);
            long w = buf.getLong(wordOff);
            if (((w >>> (sym & 63)) & 1L) != 0L) {
                if (compIdx < numComp) {
                    compToSym[compIdx++] = sym;
                }
            } else if (tailIdx < numTail) {
                symToQ[sym] = data[tailOff + tailIdx++] & 0xFF;
            }
        }

        // State 0 futures in fut_bv_ hold unigram weights for compressed symbols.
        int futBits = fInt + sInt + 1;
        int firstOne = findFirstSetBit(buf, oFutBv, futBits);
        int uCount = 0;
        if (firstOne >= 0) {
            int bitPos = firstOne;
            while (bitPos < futBits && getBit(buf, oFutBv, bitPos)) {
                uCount++;
                bitPos++;
            }
        }
        int limitU = Math.min(uCount, fInt);
        for (int i = 0; i < limitU; i++) {
            int cid = buf.getShort(oFutWords + i * 2) & 0xFFFF;
            if (cid < compIdx) {
                symToQ[compToSym[cid]] = data[oFutWeights + i] & 0xFF;
            }
        }

        // Determine clean word count and [qMin, qMax] to calibrate Gboard -ln(P) to Kinetica [1..255].
        int usableLimit = Math.min(numWords, symWords.length);
        int cleanCount = 0;
        int qMin = 255;
        int qMax = 0;
        for (int sym = 0; sym < usableLimit; sym++) {
            if (symWords[sym] == null) continue;
            cleanCount++;
            int q = symToQ[sym];
            if (q < qMin) qMin = q;
            if (q > qMax) qMax = q;
        }
        if (qMin > qMax) {
            qMin = 0;
            qMax = 255;
        }
        float denomLn = Math.max(15.5f, (qMax - qMin) * scale * 1.1f);

        int initCap = Math.min(
                Math.max(4096, cleanCount * ((maxCompounds > 0 || maxTripleCompounds > 0) ? 4 : 2)),
                460_000);
        MultiGlideTrie trie = new MultiGlideTrie(initCap);
        for (int sym = 0; sym < usableLimit; sym++) {
            String word = symWords[sym];
            if (word == null) continue;
            int freqByte = quantizeFreqByte(symToQ[sym], qMin, scale, denomLn);
            boolean isProper = Character.isUpperCase(word.charAt(0));
            MultiGlideDictionaryLoader.insertWordIntoTrie(
                    trie, word, freqByte, isProper, lang, hasDedicatedUmlautKeys);
        }

        int l1States = countL1States(buf, oCtxBv, sInt);
        int compoundCount = extractCompounds(
                trie, symbols, usableLimit, compToSym, compIdx, symToQ,
                buf, sInt, l1States, oCtxBv, oFutBv, futBits, oCtxWords, oFutWords, oFutWeights,
                qMin, scale, denomLn, lang, hasDedicatedUmlautKeys, maxCompounds, maxTripleCompounds);
        trie.compact();

        // Extract Level-1 bigram transitions using ctx_bv_ + fut_bv_.
        MultiGlideBigramTable bigrams = new MultiGlideBigramTable();
        int bigramCount = extractBigrams(
                bigrams, symWords, usableLimit, compToSym, compIdx,
                buf, l1States, oFutBv, futBits,
                oCtxWords, oFutWords, oFutWeights,
                scale, maxBigrams);

        return new LmDictionaries(trie, bigrams, cleanCount, bigramCount, compoundCount);
    }

    private static int quantizeFreqByte(int q, int qMin, float scale, float denomLn) {
        float deltaLn = Math.max(0f, (q - qMin) * scale);
        return Math.max(1, Math.min(255, Math.round(255f * (1f - deltaLn / denomLn))));
    }

    private static int countL1States(ByteBuffer buf, int oCtxBv, int numStates) {
        if (numStates <= 1) return 0;
        // In ctx_bv_, bit 0=1, bit 1=0 (super-root), followed by consecutive 1s for Level-1 context states 1..l1States.
        int ctxBits = 2 * numStates + 1;
        int l1States = 0;
        int cPos = 2;
        while (cPos < ctxBits && getBit(buf, oCtxBv, cPos)) {
            l1States++;
            cPos++;
        }
        return l1States;
    }

    private interface Level1StateVisitor {
        void visitState(int prevSym, int rangeStart, int rangeEnd);
    }

    private static void visitLevel1StateFutures(
            int l1States,
            int[] compToSym,
            int compCount,
            ByteBuffer buf,
            int oFutBv,
            int futBits,
            int oCtxWords,
            Level1StateVisitor visitor
    ) {
        if (l1States <= 0) return;
        int zeros = 0;
        int ones = 0;
        int rangeStart = 0;
        int numWords64 = (futBits + 63) / 64;
        for (int wi = 0; wi < numWords64; wi++) {
            long word = buf.getLong(oFutBv + wi * 8);
            int baseBit = wi << 6;
            int validBits = Math.min(64, futBits - baseBit);
            for (int b = 0; b < validBits; b++) {
                if (((word >>> b) & 1L) != 0L) {
                    ones++;
                } else {
                    int stateIdx = zeros - 1;
                    if (stateIdx >= 1 && stateIdx <= l1States) {
                        int prevCid = buf.getShort(oCtxWords + stateIdx * 2) & 0xFFFF;
                        if (prevCid < compCount) {
                            visitor.visitState(compToSym[prevCid], rangeStart, ones);
                        }
                    }
                    zeros++;
                    rangeStart = ones;
                    if (zeros > l1States + 1) {
                        return;
                    }
                }
            }
        }
    }

    private static final class InfixEdgeList {
        final int[] head;
        int[] next;
        int[] sym;
        int[] weight;
        int count = 0;

        InfixEdgeList(int keySpace, int initialCapacity) {
            this.head = new int[keySpace];
            Arrays.fill(this.head, -1);
            this.next = new int[initialCapacity];
            this.sym = new int[initialCapacity];
            this.weight = new int[initialCapacity];
        }

        void add(int keySym, int targetSym, int qWeight) {
            if (count == next.length) {
                int newCap = next.length * 2;
                next = Arrays.copyOf(next, newCap);
                sym = Arrays.copyOf(sym, newCap);
                weight = Arrays.copyOf(weight, newCap);
            }
            int idx = count++;
            sym[idx] = targetSym;
            weight[idx] = qWeight;
            next[idx] = head[keySym];
            head[keySym] = idx;
        }
    }

    private static int findCompoundCutoff(int[] hist, int maxIdx, int totalEdges, int maxCount) {
        if (maxCount <= 0 || totalEdges == 0) {
            return -1;
        }
        if (totalEdges <= maxCount) {
            return maxIdx;
        }
        int acc = 0;
        int qCutoff = -1;
        for (int q = 0; q <= maxIdx; q++) {
            if (acc + hist[q] > maxCount) {
                break;
            }
            acc += hist[q];
            qCutoff = q;
        }
        return qCutoff;
    }

    private static int extractCompounds(
            MultiGlideTrie trie,
            SymbolTable symbols,
            int usableLimit,
            int[] compToSym,
            int compCount,
            int[] symToQ,
            ByteBuffer buf,
            int numStates,
            int l1States,
            int oCtxBv,
            int oFutBv,
            int futBits,
            int oCtxWords,
            int oFutWords,
            int oFutWeights,
            int qMin,
            float scale,
            float denomLn,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxCompounds,
            int maxTripleCompounds
    ) {
        if ((maxCompounds <= 0 && maxTripleCompounds <= 0) || l1States <= 0) {
            return 0;
        }
        String[] prefixes = symbols.compoundPrefixes;
        String[] infixes = symbols.compoundInfixes;
        String[] suffixes = symbols.compoundSuffixes;

        // Pass 1: histogram 2-part weights and (if enabled) collect prefix->infix & infix->suffix edges.
        int[] hist2 = new int[MAX_JOINT_COMPOUND_Q + 1];
        int[] totalEdges2 = new int[1];
        InfixEdgeList pToI = (maxTripleCompounds > 0) ? new InfixEdgeList(usableLimit, 2048) : null;
        InfixEdgeList iToS = (maxTripleCompounds > 0) ? new InfixEdgeList(usableLimit, 2048) : null;

        visitLevel1StateFutures(l1States, compToSym, compCount, buf, oFutBv, futBits, oCtxWords,
                (prevSym, rangeStart, rangeEnd) -> {
                    if (prevSym >= usableLimit) return;
                    boolean isPrefix = prefixes[prevSym] != null;
                    boolean isInfix = !isPrefix && pToI != null && infixes[prevSym] != null;
                    if (!isPrefix && !isInfix) return;

                    int pq = symToQ[prevSym];
                    for (int fi = rangeStart; fi < rangeEnd; fi++) {
                        int nextCid = buf.getShort(oFutWords + fi * 2) & 0xFFFF;
                        if (nextCid >= compCount) continue;
                        int nextSym = compToSym[nextCid];
                        if (nextSym >= usableLimit) continue;
                        int fq = buf.get(oFutWeights + fi) & 0xFF;

                        if (isPrefix) {
                            if (maxCompounds > 0 && suffixes[nextSym] != null) {
                                int jointQ = Math.min(MAX_JOINT_COMPOUND_Q, pq + fq);
                                hist2[jointQ]++;
                                totalEdges2[0]++;
                            } else if (pToI != null && infixes[nextSym] != null
                                    && fq <= MAX_CHAINED_TRIPLE_EDGE_Q) {
                                pToI.add(nextSym, prevSym, pq + fq);
                            }
                        } else if (suffixes[nextSym] != null && fq <= MAX_CHAINED_TRIPLE_EDGE_Q) {
                            iToS.add(prevSym, nextSym, fq);
                        }
                    }
                });

        int inserted2Count = 0;
        int qCutoff2 = findCompoundCutoff(hist2, MAX_JOINT_COMPOUND_Q, totalEdges2[0], maxCompounds);
        if (qCutoff2 >= 0) {
            final int[] c2 = new int[1];
            visitLevel1StateFutures(l1States, compToSym, compCount, buf, oFutBv, futBits, oCtxWords,
                    (prevSym, rangeStart, rangeEnd) -> {
                        if (prevSym >= usableLimit) return;
                        String prefix = prefixes[prevSym];
                        if (prefix == null) return;
                        int pq = symToQ[prevSym];
                        for (int fi = rangeStart; fi < rangeEnd; fi++) {
                            int nextCid = buf.getShort(oFutWords + fi * 2) & 0xFFFF;
                            if (nextCid >= compCount) continue;
                            int nextSym = compToSym[nextCid];
                            if (nextSym >= usableLimit) continue;
                            String suffix = suffixes[nextSym];
                            if (suffix == null) continue;
                            int fq = buf.get(oFutWeights + fi) & 0xFF;
                            int jointQ = Math.min(MAX_JOINT_COMPOUND_Q, pq + fq);
                            if (jointQ > qCutoff2) continue;

                            String joined = joinCompoundWords(prefix, suffix);
                            if (trie.containsWordIgnoreCase(joined)) continue;

                            int freqByte = quantizeFreqByte(jointQ, qMin, scale, denomLn);
                            boolean isProper = Character.isUpperCase(joined.charAt(0));
                            MultiGlideDictionaryLoader.insertWordIntoTrie(
                                    trie, joined, freqByte, isProper, lang, hasDedicatedUmlautKeys);
                            c2[0]++;
                        }
                    });
            inserted2Count = c2[0];
        }

        int explicitTripleCount = extractExplicitLevel2TripleCompounds(
                trie, prefixes, infixes, suffixes, usableLimit, compToSym, compCount, symToQ,
                buf, numStates, l1States, oCtxBv, oFutBv, futBits, oCtxWords, oFutWords, oFutWeights,
                qMin, scale, denomLn, lang, hasDedicatedUmlautKeys, maxTripleCompounds);

        int remainingTripleCap = Math.max(0, maxTripleCompounds - explicitTripleCount);
        int chainedTripleCount = extractTripleCompounds(
                trie, prefixes, infixes, suffixes,
                usableLimit, pToI, iToS, qMin, scale, denomLn,
                lang, hasDedicatedUmlautKeys, remainingTripleCap);
        return inserted2Count + explicitTripleCount + chainedTripleCount;
    }

    /**
     * Extracts explicit Level-2 (trigram) 3-part compound transitions stored directly in Gboard's
     * {@code NGramFst} (where context is stored in reverse order: {@code parentState = _Y_},
     * {@code childState = X_}, and {@code future = _Z}).
     */
    private static int extractExplicitLevel2TripleCompounds(
            MultiGlideTrie trie,
            String[] prefixes,
            String[] infixes,
            String[] suffixes,
            int usableLimit,
            int[] compToSym,
            int compCount,
            int[] symToQ,
            ByteBuffer buf,
            int numStates,
            int l1States,
            int oCtxBv,
            int oFutBv,
            int futBits,
            int oCtxWords,
            int oFutWords,
            int oFutWeights,
            int qMin,
            float scale,
            float denomLn,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxTripleCompounds
    ) {
        if (maxTripleCompounds <= 0 || numStates <= l1States + 1) {
            return 0;
        }
        // Decode LOUDS context state parents for Level-2 states (states l1States+1 .. numStates-1).
        int ctxBits = 2 * numStates + 1;
        int[] l2ParentInfixSym = new int[numStates];
        Arrays.fill(l2ParentInfixSym, -1);

        int nid = 0;
        int parentId = -1;
        int numCtxWords64 = (ctxBits + 63) / 64;
        boolean hasAnyL2InfixParent = false;
        outerCtx:
        for (int wi = 0; wi < numCtxWords64; wi++) {
            long word = buf.getLong(oCtxBv + wi * 8);
            int baseBit = wi << 6;
            int validBits = Math.min(64, ctxBits - baseBit);
            for (int b = 0; b < validBits; b++) {
                if (((word >>> b) & 1L) != 0L) {
                    if (nid > l1States && nid < numStates && parentId >= 1 && parentId <= l1States) {
                        int parentCid = buf.getShort(oCtxWords + parentId * 2) & 0xFFFF;
                        if (parentCid < compCount) {
                            int parentSym = compToSym[parentCid];
                            if (parentSym < usableLimit && infixes[parentSym] != null) {
                                l2ParentInfixSym[nid] = parentSym;
                                hasAnyL2InfixParent = true;
                            }
                        }
                    }
                    nid++;
                } else {
                    parentId++;
                    if (parentId > l1States) {
                        break outerCtx;
                    }
                }
            }
        }
        if (!hasAnyL2InfixParent) {
            return 0;
        }

        // Walk futures of Level-2 states whose L1 parent is an infix (_Y_) and whose own context is a prefix (X_).
        int[] hist = new int[MAX_TRIPLE_COMPOUND_Q + 1];
        int totalExplicit = 0;
        int zeros = 0;
        int ones = 0;
        int rangeStart = 0;
        int numFutWords64 = (futBits + 63) / 64;
        outerPass1:
        for (int wi = 0; wi < numFutWords64; wi++) {
            long word = buf.getLong(oFutBv + wi * 8);
            int baseBit = wi << 6;
            int validBits = Math.min(64, futBits - baseBit);
            for (int b = 0; b < validBits; b++) {
                if (((word >>> b) & 1L) != 0L) {
                    ones++;
                } else {
                    int stateIdx = zeros - 1;
                    if (stateIdx > l1States && stateIdx < numStates) {
                        int infixSym = l2ParentInfixSym[stateIdx];
                        if (infixSym >= 0) {
                            int prefixCid = buf.getShort(oCtxWords + stateIdx * 2) & 0xFFFF;
                            if (prefixCid < compCount) {
                                int prefixSym = compToSym[prefixCid];
                                if (prefixSym < usableLimit && prefixes[prefixSym] != null) {
                                    int baseQ = symToQ[prefixSym] + (symToQ[infixSym] >>> 2);
                                    for (int fi = rangeStart; fi < ones; fi++) {
                                        int nextCid = buf.getShort(oFutWords + fi * 2) & 0xFFFF;
                                        if (nextCid >= compCount) continue;
                                        int nextSym = compToSym[nextCid];
                                        if (nextSym < usableLimit && suffixes[nextSym] != null) {
                                            int fq = buf.get(oFutWeights + fi) & 0xFF;
                                            int jointQ = Math.min(MAX_TRIPLE_COMPOUND_Q, baseQ + fq);
                                            hist[jointQ]++;
                                            totalExplicit++;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    zeros++;
                    rangeStart = ones;
                    if (zeros > numStates) {
                        break outerPass1;
                    }
                }
            }
        }

        int qCutoff = findCompoundCutoff(hist, MAX_TRIPLE_COMPOUND_Q, totalExplicit, maxTripleCompounds);
        if (qCutoff < 0) {
            return 0;
        }

        int inserted = 0;
        zeros = 0;
        ones = 0;
        rangeStart = 0;
        outerPass2:
        for (int wi = 0; wi < numFutWords64; wi++) {
            long word = buf.getLong(oFutBv + wi * 8);
            int baseBit = wi << 6;
            int validBits = Math.min(64, futBits - baseBit);
            for (int b = 0; b < validBits; b++) {
                if (((word >>> b) & 1L) != 0L) {
                    ones++;
                } else {
                    int stateIdx = zeros - 1;
                    if (stateIdx > l1States && stateIdx < numStates) {
                        int infixSym = l2ParentInfixSym[stateIdx];
                        if (infixSym >= 0) {
                            int prefixCid = buf.getShort(oCtxWords + stateIdx * 2) & 0xFFFF;
                            if (prefixCid < compCount) {
                                int prefixSym = compToSym[prefixCid];
                                if (prefixSym < usableLimit && prefixes[prefixSym] != null) {
                                    String prefix = prefixes[prefixSym];
                                    String infix = infixes[infixSym];
                                    int baseQ = symToQ[prefixSym] + (symToQ[infixSym] >>> 2);
                                    for (int fi = rangeStart; fi < ones; fi++) {
                                        int nextCid = buf.getShort(oFutWords + fi * 2) & 0xFFFF;
                                        if (nextCid >= compCount) continue;
                                        int nextSym = compToSym[nextCid];
                                        if (nextSym >= usableLimit) continue;
                                        String suffix = suffixes[nextSym];
                                        if (suffix == null) continue;
                                        int fq = buf.get(oFutWeights + fi) & 0xFF;
                                        int jointQ = Math.min(MAX_TRIPLE_COMPOUND_Q, baseQ + fq);
                                        if (jointQ > qCutoff) continue;

                                        String joined = joinCompoundWords(prefix, infix, suffix);
                                        if (trie.containsWordIgnoreCase(joined)) continue;

                                        int freqByte = quantizeFreqByte(jointQ, qMin, scale, denomLn);
                                        boolean isProper = Character.isUpperCase(joined.charAt(0));
                                        MultiGlideDictionaryLoader.insertWordIntoTrie(
                                                trie, joined, freqByte, isProper, lang, hasDedicatedUmlautKeys);
                                        inserted++;
                                    }
                                }
                            }
                        }
                    }
                    zeros++;
                    rangeStart = ones;
                    if (zeros > numStates) {
                        break outerPass2;
                    }
                }
            }
        }
        return inserted;
    }

    private static int extractTripleCompounds(
            MultiGlideTrie trie,
            String[] prefixes,
            String[] infixes,
            String[] suffixes,
            int usableLimit,
            InfixEdgeList pToI,
            InfixEdgeList iToS,
            int qMin,
            float scale,
            float denomLn,
            String lang,
            boolean hasDedicatedUmlautKeys,
            int maxTripleCompounds
    ) {
        if (maxTripleCompounds <= 0 || pToI == null || iToS == null || pToI.count == 0 || iToS.count == 0) {
            return 0;
        }
        int[] hist3 = new int[MAX_TRIPLE_COMPOUND_Q + 1];
        int totalTriples = 0;
        for (int isym = 0; isym < usableLimit; isym++) {
            int pIdx = pToI.head[isym];
            int sHead = iToS.head[isym];
            if (pIdx == -1 || sHead == -1) continue;
            while (pIdx != -1) {
                int qPrefixInfix = pToI.weight[pIdx];
                for (int sIdx = sHead; sIdx != -1; sIdx = iToS.next[sIdx]) {
                    int jointQ = Math.min(MAX_TRIPLE_COMPOUND_Q, qPrefixInfix + iToS.weight[sIdx]);
                    hist3[jointQ]++;
                    totalTriples++;
                }
                pIdx = pToI.next[pIdx];
            }
        }

        int qCutoff3 = findCompoundCutoff(hist3, MAX_TRIPLE_COMPOUND_Q, totalTriples, maxTripleCompounds);
        if (qCutoff3 < 0) {
            return 0;
        }

        int inserted3Count = 0;
        for (int isym = 0; isym < usableLimit; isym++) {
            int pIdx = pToI.head[isym];
            int sHead = iToS.head[isym];
            if (pIdx == -1 || sHead == -1) continue;
            String infix = infixes[isym];
            while (pIdx != -1) {
                int qPrefixInfix = pToI.weight[pIdx];
                String prefix = prefixes[pToI.sym[pIdx]];
                for (int sIdx = sHead; sIdx != -1; sIdx = iToS.next[sIdx]) {
                    int jointQ = Math.min(MAX_TRIPLE_COMPOUND_Q, qPrefixInfix + iToS.weight[sIdx]);
                    if (jointQ > qCutoff3) continue;

                    String joined = joinCompoundWords(prefix, infix, suffixes[iToS.sym[sIdx]]);
                    if (trie.containsWordIgnoreCase(joined)) continue;

                    int freqByte = quantizeFreqByte(jointQ, qMin, scale, denomLn);
                    boolean isProper = Character.isUpperCase(joined.charAt(0));
                    MultiGlideDictionaryLoader.insertWordIntoTrie(
                            trie, joined, freqByte, isProper, lang, hasDedicatedUmlautKeys);
                    inserted3Count++;
                }
                pIdx = pToI.next[pIdx];
            }
        }
        return inserted3Count;
    }

    static String joinCompoundWord(String prefix, String suffix) {
        return joinCompoundWords(prefix, suffix);
    }

    static String joinCompoundWords(String... parts) {
        boolean capitalizeStart = Character.isUpperCase(parts[parts.length - 1].charAt(0));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < parts.length; i++) {
            String part = parts[i];
            if (i == 0) {
                if (part.endsWith("-")) {
                    sb.append(part);
                } else if (capitalizeStart) {
                    sb.append(Character.toUpperCase(part.charAt(0)))
                            .append(part.substring(1).toLowerCase(Locale.ROOT));
                } else {
                    sb.append(part.toLowerCase(Locale.ROOT));
                }
            } else if (parts[i - 1].endsWith("-")) {
                sb.append(part);
            } else {
                sb.append(part.toLowerCase(Locale.ROOT));
            }
        }
        return sb.toString();
    }

    private static int extractBigrams(
            MultiGlideBigramTable table,
            String[] symWords,
            int usableLimit,
            int[] compToSym,
            int compCount,
            ByteBuffer buf,
            int l1States,
            int oFutBv,
            int futBits,
            int oCtxWords,
            int oFutWords,
            int oFutWeights,
            float scale,
            int maxBigrams
    ) {
        if (maxBigrams <= 0 || l1States <= 0) {
            table.freeze();
            return 0;
        }

        // Pass 1: build 256-bin histogram of quantized bigram weights for clean word pairs.
        int[] hist = new int[256];
        int totalCleanBigrams = walkLevel1Futures(
                symWords, usableLimit, compToSym, compCount,
                buf, l1States, oFutBv, futBits,
                oCtxWords, oFutWords, oFutWeights,
                255, hist, null, 0f);

        int qCutoff = 255;
        if (totalCleanBigrams > maxBigrams) {
            int acc = 0;
            qCutoff = 0;
            for (int q = 0; q < 256; q++) {
                if (acc + hist[q] > maxBigrams) {
                    break;
                }
                acc += hist[q];
                qCutoff = q;
            }
            if (acc == 0) {
                qCutoff = 0;
            }
        }

        // Pass 2: insert all clean bigrams up to qCutoff into MultiGlideBigramTable.
        int inserted = walkLevel1Futures(
                symWords, usableLimit, compToSym, compCount,
                buf, l1States, oFutBv, futBits,
                oCtxWords, oFutWords, oFutWeights,
                qCutoff, null, table, scale);

        table.freeze();
        return inserted;
    }

    private static int walkLevel1Futures(
            String[] symWords,
            int usableLimit,
            int[] compToSym,
            int compCount,
            ByteBuffer buf,
            int l1States,
            int oFutBv,
            int futBits,
            int oCtxWords,
            int oFutWords,
            int oFutWeights,
            int qCutoff,
            int[] outHist,
            MultiGlideBigramTable outTable,
            float scale
    ) {
        int[] total = new int[1];
        visitLevel1StateFutures(l1States, compToSym, compCount, buf, oFutBv, futBits, oCtxWords,
                (prevSym, rangeStart, rangeEnd) -> {
                    String prevWord = (prevSym < usableLimit) ? symWords[prevSym] : null;
                    if (prevWord == null) return;
                    for (int fi = rangeStart; fi < rangeEnd; fi++) {
                        int nextCid = buf.getShort(oFutWords + fi * 2) & 0xFFFF;
                        if (nextCid >= compCount) continue;
                        int nextSym = compToSym[nextCid];
                        String nextWord = (nextSym < usableLimit) ? symWords[nextSym] : null;
                        if (nextWord == null) continue;

                        int q = buf.get(oFutWeights + fi) & 0xFF;
                        if (q <= qCutoff) {
                            total[0]++;
                            if (outHist != null) {
                                outHist[q]++;
                            }
                            if (outTable != null) {
                                int count = Math.max(1, (int) Math.round(
                                        DEFAULT_BIGRAM_SCALE_COUNT * Math.exp(-q * scale)));
                                outTable.put(prevWord, nextWord, count);
                            }
                        }
                    }
                });
        return total[0];
    }

    // -------------------------------------------------------------------------
    // MARISA LOUDS Trie O(N) BFS decoder
    // -------------------------------------------------------------------------

    private static final class MarisaBitVector {
        final ByteBuffer wordBuf;
        final int wordOffset;
        final int size;
        final int num1s;

        MarisaBitVector(ByteBuffer wordBuf, int wordOffset, int size, int num1s) {
            this.wordBuf = wordBuf;
            this.wordOffset = wordOffset;
            this.size = size;
            this.num1s = num1s;
        }

        boolean get(int bitIndex) {
            long word = wordBuf.getLong(wordOffset + ((bitIndex >>> 6) << 3));
            return ((word >>> (bitIndex & 63)) & 1L) != 0L;
        }
    }

    private static final class MarisaFlatVector {
        final byte[] units;
        final int valSize;
        final int mask;

        MarisaFlatVector(byte[] units, int valSize, int mask) {
            this.units = units;
            this.valSize = valSize;
            this.mask = mask;
        }

        int get(int idx) {
            if (valSize == 0) return 0;
            long bitPos = (long) idx * valSize;
            int bytePos = (int) (bitPos >>> 3);
            long chunk = 0L;
            int avail = Math.min(8, units.length - bytePos);
            for (int i = 0; i < avail; i++) {
                chunk |= (long) (units[bytePos + i] & 0xFF) << (i * 8);
            }
            return (int) ((chunk >>> (bitPos & 7)) & (mask & 0xFFFFFFFFL));
        }
    }

    private static final class MarisaReader {
        final byte[] data;
        final ByteBuffer buf;
        final int end;
        int pos;

        MarisaReader(byte[] data, int pos, int end) {
            this.data = data;
            this.buf = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
            this.pos = pos;
            this.end = end;
        }

        byte[] readVecBytes() throws IOException {
            int n = readVecLen();
            byte[] out = Arrays.copyOfRange(data, pos, pos + n);
            pos += (n + 7) & ~7;
            return out;
        }

        int readVecLen() throws IOException {
            if (pos + 8 > end) {
                throw new IOException("MARISA vector header out of bounds");
            }
            long nLong = buf.getLong(pos);
            pos += 8;
            int n = checkChunkSize(nLong, "marisaVector");
            int aligned = (n + 7) & ~7;
            if (pos + aligned > end) {
                throw new IOException("MARISA vector body out of bounds: " + n);
            }
            return n;
        }

        void skipVec() throws IOException {
            int n = readVecLen();
            pos += (n + 7) & ~7;
        }

        MarisaBitVector readBitVector() throws IOException {
            int vecByteLen = readVecLen();
            int unitsStart = pos;
            pos += (vecByteLen + 7) & ~7;
            if (pos + 8 > end) {
                throw new IOException("MARISA bitvector metadata out of bounds");
            }
            int size = buf.getInt(pos);
            int num1s = buf.getInt(pos + 4);
            pos += 8;
            // Skip select0, select1, rank1s accelerator tables
            skipVec();
            skipVec();
            skipVec();

            int needWordsBytes = ((size + 63) / 64) * 8;
            ByteBuffer bvBuf;
            int bvOff;
            if (unitsStart + needWordsBytes <= end && vecByteLen >= needWordsBytes) {
                bvBuf = buf;
                bvOff = unitsStart;
            } else {
                byte[] padded = new byte[Math.max(8, needWordsBytes)];
                System.arraycopy(data, unitsStart, padded, 0, Math.min(vecByteLen, padded.length));
                bvBuf = ByteBuffer.wrap(padded).order(ByteOrder.LITTLE_ENDIAN);
                bvOff = 0;
            }
            return new MarisaBitVector(bvBuf, bvOff, size, num1s);
        }

        MarisaFlatVector readFlatVector() throws IOException {
            byte[] units = readVecBytes();
            if (pos + 16 > end) {
                throw new IOException("MARISA flatvector metadata out of bounds");
            }
            int valSize = buf.getInt(pos);
            int mask = buf.getInt(pos + 4);
            pos += 16;
            return new MarisaFlatVector(units, valSize, mask);
        }
    }

    private static final class DecodedLouds {
        final byte[][] nodeStrings;
        final byte[][] termKeys;

        DecodedLouds(byte[][] nodeStrings, byte[][] termKeys) {
            this.nodeStrings = nodeStrings;
            this.termKeys = termKeys;
        }
    }

    private static DecodedLouds decodeLoudsLevel(MarisaReader r, int depth) throws IOException {
        MarisaBitVector louds = r.readBitVector();
        MarisaBitVector term = r.readBitVector();
        MarisaBitVector links = r.readBitVector();
        byte[] bases = r.readVecBytes();
        MarisaFlatVector extras = r.readFlatVector();
        byte[] tailBuf = r.readVecBytes();
        MarisaBitVector tailEnd = r.readBitVector();

        byte[][] childStrings = null;
        if (links.num1s > 0 && tailBuf.length == 0) {
            childStrings = decodeLoudsLevel(r, depth + 1).nodeStrings;
        }

        // Skip cache vector + num_l1_nodes + config_flags
        r.skipVec();
        if (r.pos + 8 > r.end) {
            throw new IOException("MARISA trailing fields out of bounds");
        }
        r.pos += 8;

        int numNodes = bases.length;
        byte[][] nodeStrings = new byte[numNodes][];
        if (numNodes > 0) {
            nodeStrings[0] = new byte[0];
        }

        int nid = 0;
        int parentId = -1;
        int linkIdx = 0;
        for (int bIdx = 0; bIdx < louds.size; bIdx++) {
            if (louds.get(bIdx)) {
                if (nid > 0 && nid < numNodes) {
                    byte[] parent = (parentId >= 0 && parentId < numNodes) ? nodeStrings[parentId] : new byte[0];
                    byte[] edge;
                    if (links.get(nid)) {
                        int linkId = (bases[nid] & 0xFF) | (extras.get(linkIdx++) << 8);
                        if (childStrings != null) {
                            edge = (linkId >= 0 && linkId < childStrings.length) ? childStrings[linkId] : new byte[0];
                        } else {
                            edge = sliceTail(tailBuf, tailEnd, linkId);
                        }
                        byte[] combined = new byte[parent.length + edge.length];
                        if (depth == 0) {
                            System.arraycopy(parent, 0, combined, 0, parent.length);
                            System.arraycopy(edge, 0, combined, parent.length, edge.length);
                        } else {
                            // Marisa stores nested tail tries in reversed suffix order.
                            System.arraycopy(edge, 0, combined, 0, edge.length);
                            System.arraycopy(parent, 0, combined, edge.length, parent.length);
                        }
                        nodeStrings[nid] = combined;
                    } else {
                        byte[] combined = new byte[parent.length + 1];
                        if (depth == 0) {
                            System.arraycopy(parent, 0, combined, 0, parent.length);
                            combined[parent.length] = bases[nid];
                        } else {
                            combined[0] = bases[nid];
                            System.arraycopy(parent, 0, combined, 1, parent.length);
                        }
                        nodeStrings[nid] = combined;
                    }
                }
                nid++;
            } else {
                parentId++;
            }
        }

        byte[][] termKeys = new byte[Math.max(0, term.num1s)][];
        if (term.num1s > 0) {
            int ti = 0;
            for (int i = 0; i < numNodes && ti < termKeys.length; i++) {
                if (term.get(i)) {
                    termKeys[ti++] = nodeStrings[i];
                }
            }
            if (ti < termKeys.length) {
                termKeys = Arrays.copyOf(termKeys, ti);
            }
        }
        return new DecodedLouds(nodeStrings, termKeys);
    }

    private static byte[] sliceTail(byte[] tailBuf, MarisaBitVector tailEnd, int start) {
        if (start < 0 || start >= tailBuf.length) {
            return new byte[0];
        }
        if (tailEnd.size > 0) {
            int p = start;
            while (p < tailBuf.length && p < tailEnd.size && !tailEnd.get(p)) {
                p++;
            }
            int end = Math.min(tailBuf.length, p + 1);
            return Arrays.copyOfRange(tailBuf, start, end);
        }
        int end = start;
        while (end < tailBuf.length && tailBuf[end] != 0) {
            end++;
        }
        return Arrays.copyOfRange(tailBuf, start, end);
    }

    // -------------------------------------------------------------------------
    // Low-level IO & alignment helpers
    // -------------------------------------------------------------------------

    private static int align16Relative(long chunkFileOffset, int relOffset) {
        long abs = chunkFileOffset + relOffset;
        long aligned = (abs + 15L) & ~15L;
        return relOffset + (int) (aligned - abs);
    }

    private static boolean getBit(ByteBuffer buf, int baseOffset, int bitIndex) {
        long word = buf.getLong(baseOffset + ((bitIndex >>> 6) << 3));
        return ((word >>> (bitIndex & 63)) & 1L) != 0L;
    }

    private static int findFirstSetBit(ByteBuffer buf, int baseOffset, int totalBits) {
        int words = (totalBits + 63) / 64;
        for (int wi = 0; wi < words; wi++) {
            long w = buf.getLong(baseOffset + wi * 8);
            if (w != 0L) {
                int bit = (wi << 6) + Long.numberOfTrailingZeros(w);
                return bit < totalBits ? bit : -1;
            }
        }
        return -1;
    }

    private static int readLittleEndianInt(byte[] data, int offset, int stride) {
        int val = 0;
        for (int i = 0; i < stride; i++) {
            val |= (data[offset + i] & 0xFF) << (i * 8);
        }
        return val;
    }

    private static boolean matchesAt(byte[] buf, int offset, byte[] needle) {
        if (offset < 0 || offset + needle.length > buf.length) return false;
        for (int i = 0; i < needle.length; i++) {
            if (buf[offset + i] != needle[i]) return false;
        }
        return true;
    }

    private static int findBytes(byte[] buf, byte[] needle, int start, int end) {
        int max = Math.min(end, buf.length) - needle.length;
        for (int i = Math.max(0, start); i <= max; i++) {
            if (matchesAt(buf, i, needle)) return i;
        }
        return -1;
    }

    private static int checkChunkSize(long size, String label) throws IOException {
        if (size < 0 || size > Integer.MAX_VALUE - 16) {
            throw new IOException(label + " too large: " + size);
        }
        return (int) size;
    }

    private static byte[] readChunkBytes(FileChannel ch, long offset, int size) throws IOException {
        byte[] out = new byte[size];
        ByteBuffer dst = ByteBuffer.wrap(out);
        readFully(ch, dst, offset);
        return out;
    }

    private static void readFully(FileChannel ch, ByteBuffer dst, long offset) throws IOException {
        long pos = offset;
        while (dst.hasRemaining()) {
            int n = ch.read(dst, pos);
            if (n < 0) {
                throw new EOFException("Unexpected EOF at offset " + pos);
            }
            pos += n;
        }
    }

    private static byte[] readAllBytes(InputStream in) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] tmp = new byte[16_384];
        int n;
        while ((n = in.read(tmp)) >= 0) {
            if (n > 0) {
                baos.write(tmp, 0, n);
            }
        }
        return baos.toByteArray();
    }
}
