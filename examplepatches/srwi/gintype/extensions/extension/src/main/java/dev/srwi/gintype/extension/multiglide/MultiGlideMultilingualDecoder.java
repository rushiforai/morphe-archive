package dev.srwi.gintype.extension.multiglide;

import dev.srwi.gintype.extension.multiglide.GboardMultiGlideDictionaryManager.LanguagePack;
import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Pure-JVM multilingual decoding coordinator that runs {@link KineticaDtwDecoder} across all active
 * {@link LanguagePack}s, applies a lightweight sentence-context language prior to break ties on
 * ambiguous/shared words, deduplicates merged candidates, and attributes commits to the matching
 * language pack.
 */
final class MultiGlideMultilingualDecoder {

    /** Mild boost for the inferred sentence language (breaks ties without blocking switches). */
    static final float CONTEXT_LANG_BOOST = 1.06f;

    /** Subtle tie-breaker for the primary language when there is no prior sentence context. */
    static final float PRIMARY_NEUTRAL_BOOST = 1.02f;

    private static final int MAX_CONTEXT_WORDS = 3;
    private static final float[] CONTEXT_WORD_WEIGHTS = new float[] {1.0f, 0.65f, 0.4f};
    private static final float CONTEXT_LEAD_RATIO = 1.15f;
    private static final float MIN_CONTEXT_SCORE = 0.25f;

    private MultiGlideMultilingualDecoder() {}

    static List<WordCandidate> decodeAcrossPacks(
            KineticaDtwDecoder decoder,
            List<MultiGlideInputToken> tokens,
            List<LanguagePack> packs,
            MultiGlideGeometry geometry,
            String prevWord,
            String textBeforeCursor
    ) {
        if (decoder == null || tokens == null || tokens.isEmpty()
                || packs == null || packs.isEmpty()
                || geometry == null || !geometry.isValid()) {
            return Collections.emptyList();
        }
        if (packs.size() == 1) {
            LanguagePack single = packs.get(0);
            if (single == null || single.trie == null) {
                return Collections.emptyList();
            }
            single.rwLock.readLock().lock();
            try {
                return decoder.decode(tokens, single.trie, single.bigrams, geometry, prevWord);
            } finally {
                single.rwLock.readLock().unlock();
            }
        }

        String contextLang = inferContextLanguage(textBeforeCursor, packs);
        Map<String, WordCandidate> mergedByLower = new HashMap<>(KineticaConstants.TOP_K * 2);

        for (int p = 0; p < packs.size(); p++) {
            LanguagePack pack = packs.get(p);
            if (pack == null || pack.trie == null) continue;

            List<WordCandidate> langCandidates;
            pack.rwLock.readLock().lock();
            try {
                langCandidates = decoder.decode(tokens, pack.trie, pack.bigrams, geometry, prevWord);
            } finally {
                pack.rwLock.readLock().unlock();
            }
            if (langCandidates == null || langCandidates.isEmpty()) continue;

            float boost = 1.0f;
            if (contextLang != null) {
                if (contextLang.equals(pack.lang)) {
                    boost = CONTEXT_LANG_BOOST;
                }
            } else if (p == 0) {
                boost = PRIMARY_NEUTRAL_BOOST;
            }

            for (int i = 0; i < langCandidates.size(); i++) {
                WordCandidate c = langCandidates.get(i);
                if (c == null || c.word == null || c.word.isEmpty()) continue;
                WordCandidate adjusted = (boost == 1.0f)
                        ? c
                        : new WordCandidate(
                                c.word,
                                c.totalScore * boost,
                                c.spatialScore,
                                c.frequencyScore,
                                c.bigramScore);
                String dedupeKey = c.word.toLowerCase(Locale.ROOT);
                WordCandidate existing = mergedByLower.get(dedupeKey);
                if (existing == null || adjusted.totalScore > existing.totalScore) {
                    mergedByLower.put(dedupeKey, adjusted);
                }
            }
        }

        if (mergedByLower.isEmpty()) {
            return Collections.emptyList();
        }
        List<WordCandidate> merged = new ArrayList<>(mergedByLower.values());
        merged.sort((a, b) -> Float.compare(b.totalScore, a.totalScore));
        if (merged.size() > KineticaConstants.TOP_K) {
            return new ArrayList<>(merged.subList(0, KineticaConstants.TOP_K));
        }
        return merged;
    }

    /**
     * Infers the active sentence language from up to the last {@link #MAX_CONTEXT_WORDS} words
     * before the cursor by checking unigram membership across all active {@link LanguagePack}s.
     * Returns {@code null} when context is empty or ambiguous across languages.
     */
    static String inferContextLanguage(String textBeforeCursor, List<LanguagePack> packs) {
        if (textBeforeCursor == null || textBeforeCursor.isEmpty()
                || packs == null || packs.size() < 2) {
            return null;
        }
        List<String> recentWords = extractRecentWords(textBeforeCursor, MAX_CONTEXT_WORDS);
        if (recentWords.isEmpty()) {
            return null;
        }

        int nPacks = packs.size();
        float[] scores = new float[nPacks];

        for (int wIdx = 0; wIdx < recentWords.size(); wIdx++) {
            String word = recentWords.get(wIdx);
            float weight = CONTEXT_WORD_WEIGHTS[Math.min(wIdx, CONTEXT_WORD_WEIGHTS.length - 1)];
            int[] freqs = new int[nPacks];
            int matchCount = 0;

            for (int p = 0; p < nPacks; p++) {
                LanguagePack pack = packs.get(p);
                if (pack == null || pack.trie == null) continue;
                pack.rwLock.readLock().lock();
                try {
                    freqs[p] = pack.trie.lookupFrequency(word);
                } finally {
                    pack.rwLock.readLock().unlock();
                }
                if (freqs[p] > 0) {
                    matchCount++;
                }
            }
            if (matchCount == 0) continue;

            // Words exclusive to a single active language carry stronger language signal.
            float exclusivity = (matchCount == 1) ? 1.5f : 1.0f;
            for (int p = 0; p < nPacks; p++) {
                if (freqs[p] > 0) {
                    float normFreq = 0.35f + 0.65f * (Math.min(255, freqs[p]) / 255.0f);
                    scores[p] += weight * exclusivity * normFreq;
                }
            }
        }

        int bestIdx = -1;
        float bestScore = 0f;
        float secondScore = 0f;
        for (int p = 0; p < nPacks; p++) {
            if (scores[p] > bestScore) {
                secondScore = bestScore;
                bestScore = scores[p];
                bestIdx = p;
            } else if (scores[p] > secondScore) {
                secondScore = scores[p];
            }
        }
        if (bestIdx < 0 || bestScore < MIN_CONTEXT_SCORE) {
            return null;
        }
        if (secondScore > 0f && bestScore < secondScore * CONTEXT_LEAD_RATIO) {
            return null;
        }
        return packs.get(bestIdx).lang;
    }

    /**
     * Resolves which active {@link LanguagePack} should record a committed word and its bigram.
     * Prefers the pack that recognizes the word (and ideally the {@code prevWord -> committedWord}
     * bigram), falling back to {@code fallbackLang} for out-of-vocabulary words.
     */
    static String resolveCommitLanguage(
            String committedWord,
            String prevWord,
            List<LanguagePack> packs,
            String fallbackLang
    ) {
        if (committedWord == null || committedWord.isEmpty() || packs == null || packs.isEmpty()) {
            return fallbackLang;
        }
        if (packs.size() == 1) {
            return packs.get(0) != null ? packs.get(0).lang : fallbackLang;
        }

        String bestLang = null;
        float bestScore = 0f;
        for (int p = 0; p < packs.size(); p++) {
            LanguagePack pack = packs.get(p);
            if (pack == null || pack.trie == null) continue;
            int freq;
            float bigram = 0f;
            pack.rwLock.readLock().lock();
            try {
                freq = pack.trie.lookupFrequency(committedWord);
                if (prevWord != null && !prevWord.isEmpty() && pack.bigrams != null) {
                    bigram = pack.bigrams.score(prevWord, committedWord);
                }
            } finally {
                pack.rwLock.readLock().unlock();
            }
            if (freq <= 0 && bigram <= 0f) continue;
            float score = (Math.min(255, freq) / 255.0f) + bigram * 0.5f + (p == 0 ? 0.01f : 0f);
            if (score > bestScore) {
                bestScore = score;
                bestLang = pack.lang;
            }
        }
        return bestLang != null ? bestLang : fallbackLang;
    }

    static List<String> extractRecentWords(String text, int maxWords) {
        if (text == null || text.isEmpty() || maxWords <= 0) {
            return Collections.emptyList();
        }
        List<String> words = new ArrayList<>(maxWords);
        int i = text.length() - 1;
        while (i >= 0 && words.size() < maxWords) {
            while (i >= 0 && !Character.isLetter(text.charAt(i))) {
                char ch = text.charAt(i);
                // Stop scanning across hard sentence/newline boundaries if we already have >= 1 word.
                if (!words.isEmpty() && (ch == '\n' || ch == '.' || ch == '!' || ch == '?')) {
                    return words;
                }
                i--;
            }
            if (i < 0) break;
            int end = i + 1;
            while (i >= 0 && Character.isLetter(text.charAt(i))) {
                i--;
            }
            String word = text.substring(i + 1, end);
            if (word.length() >= 2) {
                words.add(word);
            }
        }
        return words;
    }
}
