package dev.srwi.gintype.extension.multiglide;

import dev.srwi.gintype.extension.multiglide.MultiGlideInputToken.WordCandidate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Evaluates whether a pure-tap prefix (1–6 letters) followed by a swipe should split at a word
 * boundary {@code k} (1–4 letters) instead of being combined into a single word.
 */
final class SmartTapSwipeSplitJudge {

    static final int MIN_PREFIX_LEN = 1;
    static final int MAX_SPLIT_LEFT_LEN = 4;
    static final int MAX_BUFFER_PREFIX_LEN = 6;
    static final int MIN_PREFIX_FREQ_2_3 = 8;
    static final int MIN_PREFIX_FREQ_4 = 30;
    static final float MIN_SPLIT_SWIPE_SCORE = 0.08f;

    static final float ONE_LETTER_RATIO = 1.40f;
    static final float ONE_LETTER_MARGIN = 0.25f;
    static final float MULTI_LETTER_RATIO = 1.25f;
    static final float MULTI_LETTER_MARGIN = 0.08f;
    static final float BIGRAM_BONUS = 0.04f;
    static final float FULL_PREFIX_BONUS = 0.06f;
    static final float FREQ_RANK_BONUS = 0.03f;

    private static final Map<String, Set<String>> ONE_LETTER_WORDS_BY_LANG = buildOneLetterMap();

    static final class Evaluation {
        final int splitIndex;
        final List<WordCandidate> combinedCandidates;
        final List<WordCandidate> splitCandidates;

        Evaluation(
                int splitIndex,
                List<WordCandidate> combinedCandidates,
                List<WordCandidate> splitCandidates
        ) {
            this.splitIndex = splitIndex;
            this.combinedCandidates = combinedCandidates;
            this.splitCandidates = splitCandidates;
        }

        boolean isSplit() {
            return splitIndex > 0;
        }
    }

    private SmartTapSwipeSplitJudge() {}

    private static Map<String, Set<String>> buildOneLetterMap() {
        Map<String, Set<String>> map = new HashMap<>();
        map.put("en", wordSet("a", "i"));
        map.put("es", wordSet("y", "a", "o", "e", "u"));
        map.put("it", wordSet("e", "a", "o", "i", "è"));
        map.put("pt", wordSet("a", "o", "e", "é"));
        map.put("fr", wordSet("a", "à", "y"));
        map.put("pl", wordSet("w", "z", "i", "o", "a", "u"));
        Set<String> csSk = wordSet("v", "z", "s", "k", "u", "o", "a", "i");
        map.put("cs", csSk);
        map.put("sk", csSk);
        map.put("hu", wordSet("a"));
        Set<String> nordic = wordSet("i", "å");
        map.put("da", nordic);
        map.put("nb", nordic);
        map.put("nn", nordic);
        map.put("no", nordic);
        map.put("sv", wordSet("i"));
        map.put("ca", wordSet("i", "a", "o"));
        map.put("ro", wordSet("o", "e", "a"));
        map.put("nl", wordSet("u"));
        return Collections.unmodifiableMap(map);
    }

    private static Set<String> wordSet(String... words) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(words)));
    }

    static String normalizeLang(String lang) {
        if (lang == null) return "";
        String trimmed = lang.trim().toLowerCase(Locale.ROOT);
        if (trimmed.isEmpty()) return "";
        int sep = trimmed.indexOf('-');
        int under = trimmed.indexOf('_');
        int cut = (sep >= 0 && under >= 0) ? Math.min(sep, under) : Math.max(sep, under);
        return (cut >= 0) ? trimmed.substring(0, cut) : trimmed;
    }

    static boolean isEligibleTapPrefix(String rawPrefix) {
        if (rawPrefix == null) return false;
        int len = rawPrefix.length();
        if (len < MIN_PREFIX_LEN || len > MAX_BUFFER_PREFIX_LEN) return false;
        for (int i = 0; i < len; i++) {
            if (!Character.isLetter(rawPrefix.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    static boolean canStandAlone(String word, String lang, int freq) {
        return canStandAlone(word, Collections.singletonList(lang), freq);
    }

    static boolean canStandAlone(String word, List<String> langs, int freq) {
        if (word == null) return false;
        int len = word.length();
        if (len < MIN_PREFIX_LEN || len > MAX_SPLIT_LEFT_LEN) return false;
        for (int i = 0; i < len; i++) {
            if (!Character.isLetter(word.charAt(i))) {
                return false;
            }
        }
        String lower = word.toLowerCase(Locale.ROOT);
        if (len == 1) {
            if (langs == null || langs.isEmpty()) return false;
            for (int i = 0; i < langs.size(); i++) {
                Set<String> allowed = ONE_LETTER_WORDS_BY_LANG.get(normalizeLang(langs.get(i)));
                if (allowed != null && allowed.contains(lower)) {
                    return true;
                }
            }
            return false;
        }
        if (len == MAX_SPLIT_LEFT_LEN) {
            return freq >= MIN_PREFIX_FREQ_4;
        }
        return freq >= MIN_PREFIX_FREQ_2_3;
    }

    static String contextForm(String rawPrefix, String lang) {
        return contextForm(rawPrefix, Collections.singletonList(lang));
    }

    static String contextForm(String rawPrefix, List<String> langs) {
        if (rawPrefix == null) return null;
        if ("i".equalsIgnoreCase(rawPrefix) && langs != null) {
            for (int i = 0; i < langs.size(); i++) {
                if ("en".equals(normalizeLang(langs.get(i)))) {
                    return "I";
                }
            }
        }
        return rawPrefix;
    }

    static boolean shouldSplit(
            String leftWord,
            String lang,
            int leftFreq,
            float leftBigramScore,
            List<WordCandidate> combinedCandidates,
            List<WordCandidate> splitCandidates
    ) {
        return shouldSplit(
                leftWord,
                Collections.singletonList(lang),
                leftFreq,
                leftBigramScore,
                combinedCandidates,
                splitCandidates);
    }

    static boolean shouldSplit(
            String leftWord,
            List<String> langs,
            int leftFreq,
            float leftBigramScore,
            List<WordCandidate> combinedCandidates,
            List<WordCandidate> splitCandidates
    ) {
        if (!canStandAlone(leftWord, langs, leftFreq)) {
            return false;
        }
        if (splitCandidates == null || splitCandidates.isEmpty()) {
            return false;
        }
        WordCandidate splitTop = splitCandidates.get(0);
        if (splitTop == null
                || splitTop.word == null
                || splitTop.word.isEmpty()
                || splitTop.totalScore < MIN_SPLIT_SWIPE_SCORE) {
            return false;
        }
        WordCandidate combinedTop = (combinedCandidates != null && !combinedCandidates.isEmpty())
                ? combinedCandidates.get(0) : null;
        if (combinedTop == null || combinedTop.word == null || combinedTop.word.isEmpty()) {
            return true;
        }
        float effectiveSplit = splitTop.totalScore + Math.max(0f, leftBigramScore) * BIGRAM_BONUS;
        if (leftWord.length() == 1) {
            return effectiveSplit >= combinedTop.totalScore * ONE_LETTER_RATIO + ONE_LETTER_MARGIN;
        }
        return effectiveSplit >= combinedTop.totalScore * MULTI_LETTER_RATIO + MULTI_LETTER_MARGIN;
    }

    static Evaluation evaluateBestSplit(
            String rawPrefix,
            List<MultiGlideInputToken> tapTokens,
            List<MultiGlideInputToken> swipeTokens,
            String prevWordBeforePrefix,
            MultiGlideWordSession.DecodePort decoder
    ) {
        if (!isEligibleTapPrefix(rawPrefix)
                || tapTokens == null
                || tapTokens.isEmpty()
                || swipeTokens == null
                || swipeTokens.isEmpty()
                || decoder == null) {
            return new Evaluation(0, null, null);
        }

        List<MultiGlideInputToken> combinedTokens =
                new ArrayList<>(tapTokens.size() + swipeTokens.size());
        combinedTokens.addAll(tapTokens);
        combinedTokens.addAll(swipeTokens);
        List<WordCandidate> combinedCandidates =
                decoder.decode(combinedTokens, prevWordBeforePrefix);

        List<String> langs = decoder.activeLanguages();
        if (langs == null || langs.isEmpty()) {
            langs = Collections.singletonList(decoder.activeLanguage());
        }
        int prefixLen = rawPrefix.length();
        boolean alignedTokens = (prefixLen == tapTokens.size());
        int maxCut = Math.min(MAX_SPLIT_LEFT_LEN, prefixLen);

        int bestCut = 0;
        float bestRankScore = Float.NEGATIVE_INFINITY;
        List<WordCandidate> bestSplitCandidates = null;

        for (int k = 1; k <= maxCut; k++) {
            boolean isFullPrefix = (k == prefixLen);
            if (!isFullPrefix && !alignedTokens) {
                continue;
            }
            String leftWord = rawPrefix.substring(0, k);
            int leftFreq = decoder.lookupWordFrequency(leftWord);
            if (!canStandAlone(leftWord, langs, leftFreq)) {
                continue;
            }

            List<MultiGlideInputToken> rightTokens;
            if (isFullPrefix) {
                rightTokens = swipeTokens;
            } else {
                rightTokens = new ArrayList<>((tapTokens.size() - k) + swipeTokens.size());
                for (int i = k; i < tapTokens.size(); i++) {
                    rightTokens.add(tapTokens.get(i));
                }
                rightTokens.addAll(swipeTokens);
            }

            List<WordCandidate> rightCandidates =
                    decoder.decode(rightTokens, contextForm(leftWord, langs));
            float leftBigram = decoder.lookupBigramScore(prevWordBeforePrefix, leftWord);
            if (!shouldSplit(
                    leftWord,
                    langs,
                    leftFreq,
                    leftBigram,
                    combinedCandidates,
                    rightCandidates)) {
                continue;
            }

            float rightTopScore = rightCandidates.get(0).totalScore;
            float freqNorm = Math.min(255, Math.max(0, leftFreq)) / 255.0f;
            float rankScore = rightTopScore
                    + freqNorm * FREQ_RANK_BONUS
                    + Math.max(0f, leftBigram) * BIGRAM_BONUS
                    + (isFullPrefix ? FULL_PREFIX_BONUS : 0f);
            if (rankScore > bestRankScore) {
                bestRankScore = rankScore;
                bestCut = k;
                bestSplitCandidates = rightCandidates;
            }
        }

        return new Evaluation(bestCut, combinedCandidates, bestSplitCandidates);
    }
}
