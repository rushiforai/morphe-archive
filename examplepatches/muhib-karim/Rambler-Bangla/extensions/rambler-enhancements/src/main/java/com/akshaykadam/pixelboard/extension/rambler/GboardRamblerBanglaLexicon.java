package com.akshaykadam.pixelboard.extension.rambler;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.zip.GZIPInputStream;

/**
 * Full-language offline Bengali orthography &amp; phonetic-skeleton spell-correction engine.
 *
 * <p>Backed by 190,405 authoritative Bengali words from OpenBangla Keyboard (GPL-3.0) and
 * LibreOffice {@code bn_BD} Hunspell (GPL-2.0+/LGPL/MPL), ranked by spoken Bengali usage
 * frequency from HermitDave FrequencyWords (MIT / CC-BY-SA).</p>
 *
 * <p>Design invariants:
 * <ul>
 *   <li><b>Zero false positives on valid Bengali words:</b> All 190,405 valid words are stored in
 *       a compact sorted UTF-8 byte blob (~4.5 MB, zero per-word String GC overhead) and checked
 *       via binary search in ~5 microseconds.</li>
 *   <li><b>Level-1 Strict Homophone Skeleton:</b> Collapses Bengali characters pronounced
 *       identically in spoken Bangla ({@code শ/স/ষ}, {@code ণ/ন}, {@code ি/ী}, {@code ু/ূ},
 *       {@code য/জ}, {@code ড়/ঢ়/র}, {@code ৎ/ত}, {@code ং/ঙ}, {@code ঁ}) and snaps any OOV
 *       word to the highest-frequency valid Bengali word with the exact same sound skeleton.</li>
 *   <li><b>Level-2 Aspiration, Jofola &amp; Geminate Skeleton:</b> Over the top 20,000 spoken
 *       words (guarded by edit distance &le; 2), repairs common ASR/LLM mistakes such as
 *       {@code বুযে} &rarr; {@code বুঝে}, {@code খাছি} &rarr; {@code খাচ্ছি},
 *       {@code বেবহার} &rarr; {@code ব্যবহার}, and {@code উপস্তিত} &rarr; {@code উপস্থিত}.</li>
 *   <li><b>Agglutinative Suffix Fallback:</b> Strips common Bengali suffixes ({@code গুলো},
 *       {@code দের}, {@code টা}, {@code টি}, {@code কে}, {@code তে}, {@code এর}, {@code ই},
 *       {@code ও}, etc.), repairs the stem, and re-attaches the suffix.</li>
 * </ul>
 */
public final class GboardRamblerBanglaLexicon {

    private static final String[] SUFFIXES = {
        "গুলোতে", "গুলোই", "গুলোর", "গুলোকে", "গুলাতে", "গুলাই", "গুলার",
        "গুলো", "গুলা", "টুকু", "তুকু", "দেরকে", "দেরই", "দের", "টাকে", "টাতে", "টার", "টাও", "টাই",
        "টিকে", "টিতে", "টির", "টিও", "টিই", "টা", "টি", "কেও", "কেই", "তেও", "তেই",
        "কে", "তে", "এর", "ই", "ও"
    };

    private static final String[][] COLLOQUIAL_VERB_ENDINGS = {
        {"তেসিলাম", "তেছিলাম"},
        {"তেশিলাম", "তেছিলাম"},
        {"তেসিলা", "তেছিলা"},
        {"তেশিলা", "তেছিলা"},
        {"তেসিলো", "তেছিলো"},
        {"তেশিলো", "তেছিলো"},
        {"তেসিল", "তেছিল"},
        {"তেশিল", "তেছিল"},
        {"তেসেন", "তেছেন"},
        {"তেশেন", "তেছেন"},
        {"তেসি", "তেছি"},
        {"তেশি", "তেছি"},
        {"তেসে", "তেছে"},
        {"তেশে", "তেছে"},
        {"তেসো", "তেছো"},
        {"তেশো", "তেছো"},
    };

    private static final class Snapshot {
        final byte[] validBlob;
        final int[] validOffsets; // length = count + 1
        final int validCount;
        final HashMap<String, String> l1Index;
        final HashMap<String, String> l2Index;
        final HashMap<String, String> l3Index;
        final HashMap<String, String> l4Index;

        Snapshot(byte[] validBlob, int[] validOffsets, int validCount,
                HashMap<String, String> l1Index, HashMap<String, String> l2Index,
                HashMap<String, String> l3Index, HashMap<String, String> l4Index) {
            this.validBlob = validBlob;
            this.validOffsets = validOffsets;
            this.validCount = validCount;
            this.l1Index = l1Index;
            this.l2Index = l2Index;
            this.l3Index = l3Index;
            this.l4Index = l4Index;
        }
    }

    private static volatile Snapshot snapshot;
    private static volatile boolean loading;
    private static final CountDownLatch READY = new CountDownLatch(1);
    private static volatile long loadMs = -1L;

    private GboardRamblerBanglaLexicon() {
    }

    /** Starts one-time background decompression &amp; indexing; never throws. */
    public static void preload() {
        if (snapshot != null || loading) {
            return;
        }
        synchronized (GboardRamblerBanglaLexicon.class) {
            if (snapshot != null || loading) {
                return;
            }
            loading = true;
        }
        try {
            Thread t = new Thread(GboardRamblerBanglaLexicon::loadNow, "rambler-bn-lexicon");
            t.setDaemon(true);
            t.setPriority(Thread.MIN_PRIORITY);
            t.start();
        } catch (Throwable ignored) {
            synchronized (GboardRamblerBanglaLexicon.class) {
                loading = false;
            }
            READY.countDown();
        }
    }

    /**
     * Returns the loaded snapshot immediately with 0 ms blocking on the voice commit thread.
     * If background preload is still warming on cold boot, kicks off async preload and returns
     * {@code null} so dictation commits are never delayed.
     */
    static Snapshot ensureSnapshotNonBlocking() {
        Snapshot s = snapshot;
        if (s != null) {
            return s;
        }
        preload();
        return null;
    }

    /** Deterministic blocking loader for JVM unit tests only (never called on voice commit thread). */
    public static int loadBlockingForTesting() {
        loadNow();
        Snapshot s = snapshot;
        return s == null ? 0 : s.validCount;
    }

    public static int validWordCount() {
        Snapshot s = snapshot;
        if (s == null) {
            loadNow();
            s = snapshot;
        }
        return s == null ? 0 : s.validCount;
    }

    public static long getLoadMs() {
        return loadMs;
    }

    public static boolean isValid(String word) {
        if (word == null || word.length() < 2) {
            return false;
        }
        Snapshot s = ensureSnapshotNonBlocking();
        if (s == null || s.validCount == 0) {
            return false;
        }
        return containsUtf8(s, word.getBytes(StandardCharsets.UTF_8));
    }

    /**
     * Repairs an out-of-vocabulary Bengali word using the lean spoken+core lexicon, phonetic-skeleton
     * snap (Level 1 + Level 2), and agglutinative suffix stripping. Never blocks voice commits.
     */
    public static String correctWord(String word) {
        if (word == null || word.length() < 2) {
            return word;
        }
        Snapshot s = ensureSnapshotNonBlocking();
        if (s == null || s.validCount == 0) {
            return word;
        }
        String direct = correctNoSuffix(s, word);
        if (!direct.equals(word)) {
            return direct;
        }
        if (containsUtf8(s, word.getBytes(StandardCharsets.UTF_8))) {
            return word;
        }
        // Agglutinative suffix stripping fallback (e.g. শবকিছুই -> সবকিছু + ই, আনশতুকু -> অংশ + টুকু)
        for (String suf : SUFFIXES) {
            if (word.length() > suf.length() + 1 && word.endsWith(suf)) {
                String stem = word.substring(0, word.length() - suf.length());
                String fixedStem = correctNoSuffix(s, stem);
                String outSuf = "তুকু".equals(suf) ? "টুকু" : suf;
                if (!fixedStem.equals(stem) || !outSuf.equals(suf)) {
                    return fixedStem + outSuf;
                }
            }
        }
        return word;
    }

    private static String correctNoSuffix(Snapshot s, String word) {
        if (word.length() < 2) {
            return word;
        }
        // Normalize illegal jofola (\u09CD\u09DF / \u09CD\u09AF\u09BC -> \u09CD\u09AF, e.g. ব্য়াপার -> ব্যাপার)
        String clean = fixIllegalJofola(word);
        if (containsUtf8(s, clean.getBytes(StandardCharsets.UTF_8))) {
            return clean;
        }
        // Exact missing-hasanta geminate conjunct repair (চছ -> চ্ছ, চচ -> চ্চ, e.g. যাচছে -> যাচ্ছে, খাচছে -> খাচ্ছে, হচছে -> হচ্ছে)
        if (clean.contains("চছ")) {
            String cand = clean.replace("চছ", "চ্ছ");
            if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                return cand;
            }
            clean = cand;
        } else if (clean.contains("চচ")) {
            String cand = clean.replace("চচ", "চ্চ");
            if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                return cand;
            }
        }
        // Colloquial Bengali verb endings (-তেসি -> -তেছি, -তেসে -> -তেছে, etc.) on OOV verbs
        for (String[] pair : COLLOQUIAL_VERB_ENDINGS) {
            if (clean.length() > pair[0].length() + 1 && clean.endsWith(pair[0])) {
                String cand = clean.substring(0, clean.length() - pair[0].length()) + pair[1];
                if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                    return cand;
                }
                clean = cand;
                break;
            }
        }
        // OOV word-final ৈ -> ই (Avro 'oi' diphthong artifact: সবৈ -> সবই, একৈ -> একই)
        if (clean.length() >= 3 && clean.charAt(clean.length() - 1) == '\u09c8') {
            String cand = clean.substring(0, clean.length() - 1) + '\u0987';
            if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                return cand;
            }
        }
        // Generalized OOV trailing-ো (-o) strip across all 190,405 valid Bengali words
        // Repairs ASR phonetic vowel-ending drift (e.g. চৈত্রো -> চৈত্র, মাত্রো -> মাত্র) while
        // preserving all valid -ো words (ভালো, করো, বড়ো, etc., already matched above).
        if (clean.length() >= 3 && clean.charAt(clean.length() - 1) == '\u09cb') {
            String stripped = clean.substring(0, clean.length() - 1);
            if (containsUtf8(s, stripped.getBytes(StandardCharsets.UTF_8))) {
                return stripped;
            }
            String strippedL1 = s.l1Index.get(skeleton1(stripped));
            if (strippedL1 != null) {
                return strippedL1;
            }
        }
        // Level 1: strict homophone skeleton (শ/স/ষ, ন/ণ, ি/ী, ু/ূ, য/জ, ড়/ঢ়/র, ৎ/ত, ং/ঙ, ঁ)
        String k1 = skeleton1(clean);
        String cand1 = s.l1Index.get(k1);
        if (cand1 != null) {
            return cand1;
        }
        // Full 190,405-word single-char homophone repair (covers formal & literary words absent
        // from top-29K spoken index, e.g. পৌশ -> পৌষ, শ্রাবন -> শ্রাবণ, আশ্বীন -> আশ্বিন)
        String fullHomophone = repairSingleHomophoneInValid(s, clean);
        if (fullHomophone != null) {
            return fullHomophone;
        }
        // Full 190,405-word single missing-hasanta conjunct repair (e.g. ফালগুন -> ফাল্গুন,
        // কারতিক -> কার্তিক, চৈতর -> চৈত্র, কিনতু -> কিন্তু, পর্যনত -> পর্যন্ত)
        if (clean.length() >= 3) {
            String conjunct = repairMissingHasantaInValid(s, clean);
            if (conjunct != null) {
                return conjunct;
            }
            // Level 2: aspiration + ব্য/বে jofola + geminate skeleton (top 22K spoken words)
            String k2 = skeleton2(clean);
            String cand2 = s.l2Index.get(k2);
            if (cand2 != null
                    && Math.abs(cand2.length() - clean.length()) <= 2
                    && editDistanceAtMost(k1, skeleton1(cand2), 2)) {
                return cand2;
            }
            // Level 3: Romanized Banglish dental<->retroflex (ট/ঠ/ত/থ, ড/ঢ/দ/ধ), initial আ<->অ, ৈ/ৌ
            // Fixes থিকমতো->ঠিকমতো, ফাতাফাতি->ফাটাফাটি, আবস্থা->অবস্থা, মোটামুতি->মোটামুটি, তারাতারি->তাড়াতাড়ি, কথিন->কঠিন, etc.
            String k3 = skeleton3(clean);
            String cand3 = s.l3Index.get(k3);
            if (cand3 != null
                    && Math.abs(cand3.length() - clean.length()) <= 2
                    && editDistanceAtMost(k1, skeleton1(cand3), 2)) {
                return cand3;
            }
            // Level 4: vowel-tolerant dental<->retroflex (drops া/ো/ু ambiguity, guarded by sk3 dist <= 1)
            // Fixes একদাম->একদম, ফতাফাতি->ফাটাফাটি, পরাতা->পুরাটা across top 10K everyday spoken words.
            String k4 = skeleton4(clean);
            String cand4 = s.l4Index.get(k4);
            if (cand4 != null
                    && Math.abs(cand4.length() - clean.length()) <= 2
                    && editDistanceAtMost(k3, skeleton3(cand4), 1)) {
                return cand4;
            }
        }
        return clean;
    }

    private static String repairSingleHomophoneInValid(Snapshot s, String word) {
        int n = word.length();
        char[] buf = word.toCharArray();
        for (int i = 0; i < n; i++) {
            char orig = buf[i];
            char[] alts = homophoneAlternatives(orig);
            if (alts == null) {
                continue;
            }
            for (char alt : alts) {
                buf[i] = alt;
                String cand = new String(buf);
                if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                    return cand;
                }
            }
            buf[i] = orig;
        }
        return null;
    }

    private static char[] homophoneAlternatives(char c) {
        switch (c) {
            case '\u09b6': return new char[] {'\u09b8', '\u09b7'}; // শ -> স, ষ
            case '\u09b8': return new char[] {'\u09b6', '\u09b7'}; // স -> শ, ষ
            case '\u09b7': return new char[] {'\u09b6', '\u09b8'}; // ষ -> শ, স
            case '\u09a8': return new char[] {'\u09a3'};           // ন -> ণ
            case '\u09a3': return new char[] {'\u09a8'};           // ণ -> ন
            case '\u09bf': return new char[] {'\u09c0'};           // ি -> ী
            case '\u09c0': return new char[] {'\u09bf'};           // ী -> ি
            case '\u09c1': return new char[] {'\u09c2'};           // ু -> ূ
            case '\u09c2': return new char[] {'\u09c1'};           // ূ -> ু
            case '\u099c': return new char[] {'\u09af'};           // জ -> য
            case '\u09af': return new char[] {'\u099c'};           // য -> জ
            case '\u09b0': return new char[] {'\u09dc', '\u09dd'}; // র -> ড়, ঢ়
            case '\u09dc': return new char[] {'\u09b0', '\u09dd'}; // ড় -> র, ঢ়
            case '\u09dd': return new char[] {'\u09b0', '\u09dc'}; // ঢ় -> র, ড়
            case '\u09a4': return new char[] {'\u09ce'};           // ত -> ৎ
            case '\u09ce': return new char[] {'\u09a4'};           // ৎ -> ত
            default: return null;
        }
    }

    private static String repairMissingHasantaInValid(Snapshot s, String word) {
        int n = word.length();
        for (int i = 0; i + 1 < n; i++) {
            char c1 = word.charAt(i);
            char c2 = word.charAt(i + 1);
            if (isBengaliConsonant(c1) && isBengaliConsonant(c2)) {
                String cand = word.substring(0, i + 1) + '\u09cd' + word.substring(i + 1);
                if (containsUtf8(s, cand.getBytes(StandardCharsets.UTF_8))) {
                    return cand;
                }
            }
        }
        return null;
    }

    private static boolean isBengaliConsonant(char c) {
        return (c >= '\u0995' && c <= '\u09b9') || (c >= '\u09dc' && c <= '\u09df');
    }

    static String fixIllegalJofola(String text) {
        if (text == null || text.indexOf('\u09cd') < 0) {
            return text;
        }
        String out = text;
        if (out.indexOf("\u09cd\u09df") >= 0) {
            out = out.replace("\u09cd\u09df", "\u09cd\u09af");
        }
        if (out.indexOf("\u09cd\u09af\u09bc") >= 0) {
            out = out.replace("\u09cd\u09af\u09bc", "\u09cd\u09af");
        }
        return out;
    }

    static void loadNow() {
        if (snapshot != null) {
            READY.countDown();
            return;
        }
        synchronized (GboardRamblerBanglaLexicon.class) {
            if (snapshot != null) {
                READY.countDown();
                return;
            }
            long t0 = System.nanoTime();
            try {
                HashMap<String, String> l1 = new HashMap<String, String>(65536);
                HashMap<String, String> l2 = new HashMap<String, String>(24576);
                HashMap<String, String> l3 = new HashMap<String, String>(32768);
                HashMap<String, String> l4 = new HashMap<String, String>(16384);

                // 1. Load frequency-ranked spoken authoritative Bengali words first so the highest-
                //    frequency everyday spoken word ALWAYS wins every phonetic-skeleton collision.
                byte[] spokenGz = decodeBase64Chunks(GboardRamblerBanglaLexiconData.spokenGzipBase64Chunks());
                int spokenIdx = 0;
                try (BufferedReader br = new BufferedReader(
                        new InputStreamReader(new GZIPInputStream(new ByteArrayInputStream(spokenGz)), StandardCharsets.UTF_8))) {
                    String w;
                    while ((w = br.readLine()) != null) {
                        if (w.length() < 2) {
                            continue;
                        }
                        String k1 = skeleton1(w);
                        if (!l1.containsKey(k1)) {
                            l1.put(k1, w);
                        }
                        if (spokenIdx < 22000) {
                            String k2 = skeleton2(w);
                            if (!l2.containsKey(k2)) {
                                l2.put(k2, w);
                            }
                        }
                        if (spokenIdx < 25000) {
                            String k3 = skeleton3(w);
                            if (!l3.containsKey(k3)) {
                                l3.put(k3, w);
                            }
                        }
                        if (spokenIdx < 10000) {
                            String k4 = skeleton4(w);
                            if (!l4.containsKey(k4)) {
                                l4.put(k4, w);
                            }
                        }
                        spokenIdx++;
                    }
                }

                // 2. Load ALL 190,405 sorted authoritative Bengali words into a flat UTF-8 byte blob
                //    + int[] offset table (zero 190K String heap bloat) and backfill formal L1 entries.
                byte[] validGz = decodeBase64Chunks(GboardRamblerBanglaLexiconData.validDeltaGzipBase64Chunks());
                ByteArrayOutputStream blobOut = new ByteArrayOutputStream(2_200_000);
                int maxCount = GboardRamblerBanglaLexiconData.VALID_COUNT + 16;
                int[] offsets = new int[maxCount + 1];
                int count = 0;
                String prev = "";
                try (BufferedReader br = new BufferedReader(
                        new InputStreamReader(new GZIPInputStream(new ByteArrayInputStream(validGz)), StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = br.readLine()) != null) {
                        if (line.isEmpty()) {
                            continue;
                        }
                        int lcp = line.charAt(0) - 33;
                        if (lcp < 0 || lcp > prev.length()) {
                            lcp = 0;
                        }
                        String w = (lcp == 0 ? "" : prev.substring(0, lcp)) + line.substring(1);
                        prev = w;
                        if (count >= maxCount) {
                            int[] bigger = new int[offsets.length * 2];
                            System.arraycopy(offsets, 0, bigger, 0, offsets.length);
                            offsets = bigger;
                            maxCount = offsets.length - 1;
                        }
                        offsets[count] = blobOut.size();
                        byte[] utf8 = w.getBytes(StandardCharsets.UTF_8);
                        blobOut.write(utf8, 0, utf8.length);
                        count++;
                    }
                }
                offsets[count] = blobOut.size();

                snapshot = new Snapshot(blobOut.toByteArray(), offsets, count, l1, l2, l3, l4);
                loadMs = (System.nanoTime() - t0) / 1_000_000L;
            } catch (Throwable err) {
                snapshot = new Snapshot(new byte[0], new int[] { 0 }, 0,
                        new HashMap<String, String>(), new HashMap<String, String>(),
                        new HashMap<String, String>(), new HashMap<String, String>());
            } finally {
                READY.countDown();
            }
        }
    }

    /** Binary search on UTF-8 sorted byte blob (UTF-8 preserves BMP Unicode code-point order). */
    private static boolean containsUtf8(Snapshot s, byte[] key) {
        int lo = 0;
        int hi = s.validCount - 1;
        byte[] blob = s.validBlob;
        int[] offsets = s.validOffsets;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            int start = offsets[mid];
            int len = offsets[mid + 1] - start;
            int cmp = compareUnsigned(blob, start, len, key);
            if (cmp < 0) {
                lo = mid + 1;
            } else if (cmp > 0) {
                hi = mid - 1;
            } else {
                return true;
            }
        }
        return false;
    }

    private static int compareUnsigned(byte[] a, int aOff, int aLen, byte[] b) {
        int min = Math.min(aLen, b.length);
        for (int i = 0; i < min; i++) {
            int va = a[aOff + i] & 0xFF;
            int vb = b[i] & 0xFF;
            if (va != vb) {
                return va - vb;
            }
        }
        return aLen - b.length;
    }

    /**
     * Level-1 Strict Homophone Skeleton: collapses Bengali characters that sound identical in
     * modern spoken Bangla (শ/স/ষ, ন/ণ, ি/ী, ু/ূ, য/জ, ড়/ঢ়/র, ৎ/ত, ং/ঙ, ঁ).
     */
    static String skeleton1(String w) {
        int n = w.length();
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            char c = w.charAt(i);
            // Handle decomposed nukta sequences (ড+়, ঢ+় -> র; য+় -> য়)
            if (i + 1 < n && w.charAt(i + 1) == '\u09bc') {
                if (c == '\u09a1' || c == '\u09a2') {
                    sb.append('\u09b0'); // র
                    i++;
                    continue;
                }
                if (c == '\u09af') {
                    sb.append('\u09df'); // য়
                    i++;
                    continue;
                }
            }
            switch (c) {
                case '\u09b6': // শ
                case '\u09b7': // ষ
                    sb.append('\u09b8'); // স
                    break;
                case '\u09a3': // ণ
                    sb.append('\u09a8'); // ন
                    break;
                case '\u09c0': // ী
                    sb.append('\u09bf'); // ি
                    break;
                case '\u0988': // ঈ
                    sb.append('\u0987'); // ই
                    break;
                case '\u09c2': // ূ
                    sb.append('\u09c1'); // ু
                    break;
                case '\u098a': // ঊ
                    sb.append('\u0989'); // উ
                    break;
                case '\u09af': // য
                    sb.append('\u099c'); // জ
                    break;
                case '\u09dc': // ড়
                case '\u09dd': // ঢ়
                    sb.append('\u09b0'); // র
                    break;
                case '\u09ce': // ৎ
                    sb.append('\u09a4'); // ত
                    break;
                case '\u0999': // ঙ
                    sb.append('\u0982'); // ং
                    break;
                case '\u0981': // ঁ
                    break;
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }

    /**
     * Level-2 Aspiration, Jofola (ব্য↔বে) &amp; Geminate Skeleton: catches missing/extra aspiration
     * (বুযে->বুঝে, উপস্তিত->উপস্থিত), geminates (খাছি->খাচ্ছি), and initial jofola vowel shifts
     * (বেবহার->ব্যবহার, বেক্তি->ব্যক্তি, বেস্ত->ব্যস্ত).
     */
    static String skeleton2(String w) {
        String s1 = skeleton1(w);
        int n = s1.length();
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            char c = s1.charAt(i);
            // Collapse consonant + virama + য (jofola, e.g. ব্য -> বে) when not followed by া
            if (i + 2 < n && s1.charAt(i + 1) == '\u09cd' && s1.charAt(i + 2) == '\u099c') {
                sb.append(foldAspiration(c));
                if (i + 3 >= n || s1.charAt(i + 3) != '\u09be') {
                    sb.append('\u09c7'); // ে
                }
                i += 2;
                continue;
            }
            // Collapse doubled/aspirated geminate consonants (e.g. চ্ছ -> চ, ক্ক -> ক, ত্ত -> ত)
            if (i + 2 < n && s1.charAt(i + 1) == '\u09cd'
                    && foldAspiration(c) == foldAspiration(s1.charAt(i + 2))) {
                sb.append(foldAspiration(c));
                i += 2;
                continue;
            }
            if (c == '\u09df') { // য়
                sb.append('\u099c'); // জ
            } else {
                sb.append(foldAspiration(c));
            }
        }
        return sb.toString();
    }

    private static char foldAspiration(char c) {
        switch (c) {
            case '\u099d': return '\u099c'; // ঝ -> জ
            case '\u09ad': return '\u09ac'; // ভ -> ব
            case '\u0996': return '\u0995'; // খ -> ক
            case '\u0998': return '\u0997'; // ঘ -> গ
            case '\u09a5': return '\u09a4'; // থ -> ত
            case '\u09a7': return '\u09a6'; // ধ -> দ
            case '\u099b': return '\u099a'; // ছ -> চ
            case '\u09ab': return '\u09aa'; // ফ -> প
            case '\u09a0': return '\u099f'; // ঠ -> ট
            case '\u09a2': return '\u09a1'; // ঢ -> ড
            default: return c;
        }
    }

    /**
     * Level-3 Romanized-Banglish Repair Skeleton: collapses dental vs retroflex ambiguity
     * (ট/ঠ/ত/থ -> ত, ড/ঢ/দ/ধ -> দ), initial আ <-> অ, Avro diphthongs (ৈ -> ই, ৌ -> উ),
     * missing conjunct hasanta (্: হচছে -> হচ্ছে, কিনতু -> কিন্তু), and nasal+sibilant (নস -> ংস: আনশ -> অংশ).
     */
    static String skeleton3(String w) {
        String s2 = skeleton2(w);
        int n = s2.length();
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            char c = s2.charAt(i);
            if (c == '\u09cd') { // ignore missing/extra hasanta in OOV conjunct repair (হচছে -> হচ্ছে)
                continue;
            }
            char mapped;
            if (i == 0 && c == '\u0986') { // initial আ -> অ
                mapped = '\u0985';
            } else if (c == '\u09a8' && i + 1 < n && s2.charAt(i + 1) == '\u09b8') {
                // nasal + sibilant (নশ/নস -> ংস, e.g. আনশ -> অংশ, সংসা -> শংসা)
                mapped = '\u0982';
            } else if (c == '\u099f' || c == '\u09a0' || c == '\u09a5') { // ট, ঠ, থ -> ত
                mapped = '\u09a4';
            } else if (c == '\u09a1' || c == '\u09a2' || c == '\u09a7') { // ড, ঢ, ধ -> দ
                mapped = '\u09a6';
            } else if (c == '\u09c8') { // ৈ -> ই
                mapped = '\u0987';
            } else if (c == '\u09cc') { // ৌ -> উ
                mapped = '\u0989';
            } else {
                mapped = c;
            }
            // Collapse adjacent identical consonants exposed after stripping hasanta (চ+্+ছ -> চচ -> চ)
            if (sb.length() > 0 && sb.charAt(sb.length() - 1) == mapped && mapped >= '\u0995' && mapped <= '\u09b9') {
                continue;
            }
            sb.append(mapped);
        }
        return sb.toString();
    }

    /**
     * Level-4 Vowel-Tolerant Skeleton: strips Romanized a/o/u vowel-sign ambiguity (া, ো, ু) on top
     * of skeleton3 to rescue OOV words like একদাম->একদম, ফতাফাতি->ফাটাফাটি, পরাতা->পুরাটা.
     */
    static String skeleton4(String w) {
        String s3 = skeleton3(w);
        int n = s3.length();
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            char c = s3.charAt(i);
            if (c != '\u09be' && c != '\u09cb' && c != '\u09c1') { // skip া, ো, ু
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /** Fast banded Levenshtein check returning true iff edit distance(a, b) <= maxDist. */
    private static boolean editDistanceAtMost(String a, String b, int maxDist) {
        int la = a.length();
        int lb = b.length();
        if (Math.abs(la - lb) > maxDist) {
            return false;
        }
        int[] prev = new int[lb + 1];
        int[] curr = new int[lb + 1];
        for (int j = 0; j <= lb; j++) {
            prev[j] = j;
        }
        for (int i = 1; i <= la; i++) {
            curr[0] = i;
            int rowMin = curr[0];
            char ca = a.charAt(i - 1);
            for (int j = 1; j <= lb; j++) {
                int cost = (ca == b.charAt(j - 1)) ? 0 : 1;
                int v = Math.min(Math.min(curr[j - 1] + 1, prev[j] + 1), prev[j - 1] + cost);
                curr[j] = v;
                if (v < rowMin) {
                    rowMin = v;
                }
            }
            if (rowMin > maxDist) {
                return false;
            }
            int[] tmp = prev;
            prev = curr;
            curr = tmp;
        }
        return prev[lb] <= maxDist;
    }

    /** Pure-Java Base64 decoder (zero Android API-level / Lint dependencies). */
    static byte[] decodeBase64Chunks(String[] chunks) {
        int totalLen = 0;
        for (String c : chunks) {
            totalLen += c.length();
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream((totalLen * 3) / 4);
        int buf = 0;
        int bits = 0;
        for (String chunk : chunks) {
            for (int i = 0; i < chunk.length(); i++) {
                char ch = chunk.charAt(i);
                int v;
                if (ch >= 'A' && ch <= 'Z') {
                    v = ch - 'A';
                } else if (ch >= 'a' && ch <= 'z') {
                    v = ch - 'a' + 26;
                } else if (ch >= '0' && ch <= '9') {
                    v = ch - '0' + 52;
                } else if (ch == '+') {
                    v = 62;
                } else if (ch == '/') {
                    v = 63;
                } else {
                    continue;
                }
                buf = (buf << 6) | v;
                bits += 6;
                if (bits >= 8) {
                    bits -= 8;
                    out.write((buf >>> bits) & 0xFF);
                }
            }
        }
        return out.toByteArray();
    }
}
