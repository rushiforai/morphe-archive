package nl.johninnl.gboard;

import java.util.ArrayList;
import java.util.List;

/**
 * Final transcription with the voice correction list, in three steps:
 *
 * <ol>
 *   <li>Decode with every boosted entry as a hotword, so Parakeet favours them while listening.</li>
 *   <li>Look for words that sound like an entry but were still written differently.</li>
 *   <li>Decode the same audio again with only that entry boosted; the correction is kept only
 *       when Parakeet then writes the entry where it did not before.</li>
 * </ol>
 */
final class DictionaryDecoder {
    static final int MAX_CHECKS = 3;

    /** Decodes the retained utterance with the given hotword text ("" for none). */
    interface Decoder {
        String decode(String hotwords);
    }

    /** What happened, for logging and tests. */
    static final class Result {
        final String text;
        final String firstPass;
        final List<SoundAlike.Proposal> proposed;
        final List<SoundAlike.Proposal> accepted;

        Result(String text, String firstPass, List<SoundAlike.Proposal> proposed, List<SoundAlike.Proposal> accepted) {
            this.text = text;
            this.firstPass = firstPass;
            this.proposed = proposed;
            this.accepted = accepted;
        }
    }

    private DictionaryDecoder() {}

    static Result transcribe(Decoder decoder, CorrectionDictionary dictionary) {
        String first = dictionary.restoreOrdinaryCase(decoder.decode(dictionary.hotwords));
        List<SoundAlike.Proposal> proposed = dictionary.matcher.propose(first);
        List<SoundAlike.Proposal> accepted = new ArrayList<>();
        for (int i = 0; i < proposed.size() && i < MAX_CHECKS; i++) {
            SoundAlike.Proposal proposal = proposed.get(i);
            String check = decoder.decode(CorrectionDictionary.hotwords(
                    java.util.Collections.singletonList(proposal.entry), CorrectionDictionary.VERIFY_BOOST));
            if (occurrences(check, proposal.entry) > occurrences(first, proposal.entry)) accepted.add(proposal);
        }
        StringBuilder text = new StringBuilder(first);
        for (int i = accepted.size() - 1; i >= 0; i--) {
            SoundAlike.Proposal p = accepted.get(i);
            text.replace(p.start, p.end, p.entry);
        }
        return new Result(text.toString(), first, proposed, accepted);
    }

    /** True when {@code phrase} occurs in {@code text} as whole words, with the same spelling. */
    static boolean containsWord(String text, String phrase) {
        return occurrences(text, phrase) > 0;
    }

    /** How often {@code phrase} occurs in {@code text} as whole words, with the same spelling. */
    static int occurrences(String text, String phrase) {
        if (text == null || phrase.isEmpty()) return 0;
        int count = 0;
        for (int from = 0; ; ) {
            int at = text.indexOf(phrase, from);
            if (at < 0) return count;
            int end = at + phrase.length();
            boolean before = at == 0 || !Character.isLetterOrDigit(text.charAt(at - 1));
            boolean after = end == text.length() || !Character.isLetterOrDigit(text.charAt(end));
            if (before && after) count++;
            from = at + 1;
        }
    }
}
