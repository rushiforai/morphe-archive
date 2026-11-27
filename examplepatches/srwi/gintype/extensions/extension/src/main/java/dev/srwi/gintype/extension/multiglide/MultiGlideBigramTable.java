package dev.srwi.gintype.extension.multiglide;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Bigram conditional probability table P(word_i | word_{i-1}) for MultiGlide scoring.
 * Ported from Kinetica's BigramTable.kt.
 */
public final class MultiGlideBigramTable {

    public static final class NextWord implements Comparable<NextWord> {
        public final String word;
        public final int count;

        public NextWord(String word, int count) {
            this.word = word;
            this.count = count;
        }

        @Override
        public int compareTo(NextWord other) {
            return Integer.compare(other.count, this.count);
        }
    }

    private final Map<String, List<NextWord>> table = new HashMap<>(4096);
    private final Map<String, Integer> maxCount = new HashMap<>(4096);

    public int entryCount = 0;
    private boolean frozen = false;

    public void put(String prev, String next, int count) {
        String key = prev.toLowerCase(java.util.Locale.ROOT);
        String nw = next.toLowerCase(java.util.Locale.ROOT);

        List<NextWord> list = table.get(key);
        if (list == null) {
            list = new ArrayList<>(4);
            table.put(key, list);
        }

        int idx = -1;
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).word.equals(nw)) {
                idx = i;
                break;
            }
        }
        int effectiveCount = count;
        if (idx >= 0) {
            effectiveCount = list.get(idx).count + count;
            list.set(idx, new NextWord(nw, effectiveCount));
        } else {
            list.add(new NextWord(nw, count));
            entryCount++;
        }
        if (frozen && list.size() > 1) {
            Collections.sort(list);
        }

        Integer curMax = maxCount.get(key);
        if (curMax == null || effectiveCount > curMax) {
            maxCount.put(key, effectiveCount);
        }
    }

    public void freeze() {
        for (List<NextWord> list : table.values()) {
            Collections.sort(list);
        }
        frozen = true;
    }

    public float score(String prevWord, String candidate) {
        if (prevWord == null || prevWord.isEmpty()) return 0f;
        String key = prevWord.toLowerCase(java.util.Locale.ROOT);
        List<NextWord> list = table.get(key);
        if (list == null || list.isEmpty()) return 0f;

        String cand = candidate.toLowerCase(java.util.Locale.ROOT);
        NextWord entry = null;
        for (int i = 0; i < list.size(); i++) {
            NextWord nw = list.get(i);
            if (nw.word.equals(cand)) {
                entry = nw;
                break;
            }
        }
        if (entry == null) return 0f;

        Integer mxObj = maxCount.get(key);
        float mx = (mxObj != null ? mxObj : 1);
        float s = (float) (Math.log(entry.count + 1.0) / Math.log(mx + 1.0));
        if (s < 0f) return 0f;
        if (s > 1f) return 1f;
        return s;
    }

    public List<NextWord> topContinuations(String prevWord, int limit) {
        String key = prevWord.toLowerCase(java.util.Locale.ROOT);
        List<NextWord> list = table.get(key);
        if (list == null || list.isEmpty()) return Collections.emptyList();
        if (list.size() <= limit) return list;
        return list.subList(0, limit);
    }
}
