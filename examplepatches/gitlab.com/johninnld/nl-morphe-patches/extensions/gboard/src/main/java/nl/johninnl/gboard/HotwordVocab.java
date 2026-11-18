package nl.johninnl.gboard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The {@code bpe.vocab} sherpa-onnx needs to turn boosted words into Parakeet pieces.
 *
 * <p>sherpa-onnx splits hotwords with simple-sentencepiece, which picks the split with the
 * highest summed piece score instead of applying Parakeet's merges. With plain scores it splits
 * many words differently from the model (for example {@code ▁M or p he} instead of
 * {@code ▁Mor p he}), and the boost then follows a path the model hardly ever takes. This class
 * repeats simple-sentencepiece's choice exactly (UTF-8 bytes, float sums, later match wins a tie)
 * and nudges piece scores until every dictionary word gets Parakeet's own split.
 */
final class HotwordVocab {
    static final int MAX_EPOCHS = 60;
    private static final float STEP = 0.1f;

    private final BpeTokenizer tokenizer;
    private final float[] scores;
    private final Map<String, Integer> byBytes;
    private final int maxBytes;

    HotwordVocab(BpeTokenizer tokenizer) {
        this.tokenizer = tokenizer;
        int n = tokenizer.pieces.size();
        scores = new float[n];
        byBytes = new HashMap<>(n * 2);
        int longest = 1;
        for (int i = 0; i < n; i++) {
            scores[i] = -i / 1000f;
            String bytes = latin1(tokenizer.pieces.get(i));
            byBytes.put(bytes, i);
            longest = Math.max(longest, bytes.length());
        }
        maxBytes = longest;
    }

    /** Result of fitting the dictionary's words. */
    static final class Fit {
        final Set<String> exact;
        final Set<String> unsupported;

        Fit(Set<String> exact, Set<String> unsupported) {
            this.exact = exact;
            this.unsupported = unsupported;
        }
    }

    /**
     * Adjusts scores so simple-sentencepiece splits each word like Parakeet. Words with characters
     * outside the vocabulary are reported as unsupported and must not be boosted.
     */
    Fit fit(Collection<String> words) {
        List<String> distinct = new ArrayList<>(new LinkedHashSet<>(words));
        Map<String, List<String>> canonical = new HashMap<>();
        Set<String> unsupported = new LinkedHashSet<>();
        for (String word : distinct) {
            List<String> pieces = tokenizer.encodeWord(word);
            if (pieces == null || sherpaSplit(word) == null) {
                unsupported.add(word);
            } else {
                canonical.put(word, pieces);
            }
        }
        for (int epoch = 0; epoch < MAX_EPOCHS; epoch++) {
            int wrong = 0;
            for (Map.Entry<String, List<String>> entry : canonical.entrySet()) {
                List<String> got = sherpaSplit(entry.getKey());
                if (entry.getValue().equals(got)) continue;
                wrong++;
                for (String piece : entry.getValue()) scores[index(piece)] += STEP;
                if (got != null) for (String piece : got) scores[index(piece)] -= STEP;
            }
            if (wrong == 0) break;
        }
        Set<String> exact = new LinkedHashSet<>();
        for (Map.Entry<String, List<String>> entry : canonical.entrySet()) {
            if (entry.getValue().equals(sherpaSplit(entry.getKey()))) exact.add(entry.getKey());
        }
        return new Fit(exact, unsupported);
    }

    /**
     * The pieces simple-sentencepiece produces for one word with the current scores, or null
     * when part of it matches no piece (sherpa would then drop that part of the hotword).
     */
    List<String> sherpaSplit(String word) {
        String s = latin1(BpeTokenizer.SPACE + word);
        int n = s.length();
        float[] best = new float[n + 1];
        int[] next = new int[n + 1];
        int[] piece = new int[n + 1];
        for (int i = n - 1; i >= 0; i--) {
            float max = Float.NEGATIVE_INFINITY;
            int maxNext = -1;
            int maxPiece = 0;
            int limit = Math.min(n, i + maxBytes);
            for (int j = i + 1; j <= limit; j++) {
                Integer id = byBytes.get(s.substring(i, j));
                if (id == null) continue;
                float score = scores[id] + best[j];
                if (score >= max) {
                    max = score;
                    maxNext = j;
                    maxPiece = id;
                }
            }
            best[i] = max == Float.NEGATIVE_INFINITY ? 0f : max;
            next[i] = maxNext;
            piece[i] = maxPiece;
        }
        List<String> out = new ArrayList<>();
        for (int i = 0; i < n; ) {
            if (next[i] < 0) return null;
            out.add(tokenizer.pieces.get(piece[i]));
            i = next[i];
        }
        return out;
    }

    /** Writes the vocabulary in simple-sentencepiece's "piece score" format, in id order. */
    void write(File target) throws IOException {
        File partial = new File(target.getPath() + ".part");
        try (FileOutputStream stream = new FileOutputStream(partial);
             Writer out = new OutputStreamWriter(stream, StandardCharsets.UTF_8)) {
            StringBuilder line = new StringBuilder();
            for (int i = 0; i < scores.length; i++) {
                line.setLength(0);
                line.append(tokenizer.pieces.get(i)).append(' ').append(Float.toString(scores[i])).append('\n');
                out.write(line.toString());
            }
            out.flush();
            stream.getFD().sync();
        }
        if (target.exists() && !target.delete()) throw new IOException("Cannot replace " + target.getName());
        if (!partial.renameTo(target)) throw new IOException("Cannot store " + target.getName());
    }

    private int index(String piece) {
        Integer id = byBytes.get(latin1(piece));
        if (id == null) throw new IllegalStateException(piece);
        return id;
    }

    /** UTF-8 bytes as one char each, so substrings match simple-sentencepiece's byte matching. */
    private static String latin1(String text) {
        return new String(text.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
    }
}
