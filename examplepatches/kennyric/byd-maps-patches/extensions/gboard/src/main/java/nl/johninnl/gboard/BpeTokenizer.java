package nl.johninnl.gboard;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Parakeet's own word splitting: NVIDIA's byte-pair merges from {@code tokenizer.json}, applied to
 * one word the way the model was trained (a leading {@code ▁}, then the lowest-ranked merge first).
 * The model emits these pieces, so boosted words have to use them too.
 */
final class BpeTokenizer {
    static final String SPACE = "▁";

    /** Pieces in id order; ids match the model's tokens.txt. */
    final List<String> pieces;
    private final Map<String, Integer> ids;
    private final Map<String, Integer> ranks;

    BpeTokenizer(List<String> pieces, List<String[]> merges) {
        this.pieces = Collections.unmodifiableList(new ArrayList<>(pieces));
        ids = new HashMap<>(pieces.size() * 2);
        for (int i = 0; i < pieces.size(); i++) ids.put(pieces.get(i), i);
        ranks = new HashMap<>(merges.size() * 2);
        for (int i = 0; i < merges.size(); i++) ranks.putIfAbsent(key(merges.get(i)[0], merges.get(i)[1]), i);
    }

    /** Reads a Hugging Face BPE tokenizer; rejects anything else. */
    @SuppressWarnings("unchecked")
    static BpeTokenizer fromJson(String json) {
        Map<String, Object> root = (Map<String, Object>) MiniJson.parse(json);
        Map<String, Object> model = (Map<String, Object>) root.get("model");
        if (model == null || !"BPE".equals(model.get("type"))) throw new IllegalArgumentException("not a BPE tokenizer");
        Map<String, Object> vocab = (Map<String, Object>) model.get("vocab");
        String[] byId = new String[vocab.size()];
        for (Map.Entry<String, Object> entry : vocab.entrySet()) {
            int id = ((Double) entry.getValue()).intValue();
            if (id < 0 || id >= byId.length || byId[id] != null) throw new IllegalArgumentException("vocab ids are not dense");
            byId[id] = entry.getKey();
        }
        List<String[]> merges = new ArrayList<>();
        for (Object merge : (List<Object>) model.get("merges")) {
            if (merge instanceof List) {
                List<Object> pair = (List<Object>) merge;
                merges.add(new String[]{(String) pair.get(0), (String) pair.get(1)});
            } else {
                String[] pair = ((String) merge).split(" ", 2);
                if (pair.length != 2) throw new IllegalArgumentException("bad merge");
                merges.add(pair);
            }
        }
        List<String> pieces = new ArrayList<>(byId.length);
        Collections.addAll(pieces, byId);
        return new BpeTokenizer(pieces, merges);
    }

    boolean contains(String piece) {
        return ids.containsKey(piece);
    }

    /** NFKC, as the tokenizer's normalizer does for the text Parakeet is trained on. */
    static String normalize(String text) {
        return Normalizer.normalize(text, Normalizer.Form.NFKC);
    }

    /**
     * The pieces Parakeet uses for one space-free word, or null when a character is not in its
     * vocabulary (the tokenizer has no byte pieces, so such a word cannot be boosted).
     */
    List<String> encodeWord(String word) {
        String text = SPACE + normalize(word);
        List<String> symbols = new ArrayList<>();
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            int next = i + Character.charCount(cp);
            symbols.add(text.substring(i, next));
            i = next;
        }
        while (symbols.size() > 1) {
            int best = -1;
            int bestRank = Integer.MAX_VALUE;
            for (int i = 0; i + 1 < symbols.size(); i++) {
                Integer rank = ranks.get(key(symbols.get(i), symbols.get(i + 1)));
                if (rank != null && rank < bestRank) {
                    bestRank = rank;
                    best = i;
                }
            }
            if (best < 0) break;
            symbols.set(best, symbols.get(best) + symbols.get(best + 1));
            symbols.remove(best + 1);
        }
        for (String symbol : symbols) if (!ids.containsKey(symbol)) return null;
        return symbols;
    }

    private static String key(String left, String right) {
        return left + '\u0000' + right;
    }
}
