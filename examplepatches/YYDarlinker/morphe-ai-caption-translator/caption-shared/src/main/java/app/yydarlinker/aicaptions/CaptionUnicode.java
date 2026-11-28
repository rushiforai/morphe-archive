package app.yydarlinker.aicaptions;

import android.icu.lang.UCharacter;
import android.icu.lang.UProperty;
import android.icu.lang.UScript;
import android.icu.text.BreakIterator;
import android.icu.util.VersionInfo;
import android.os.Build;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

/** Platform ICU boundaries in UTF-16 offsets. Input is never normalized or reordered. */
final class CaptionUnicode {
    static final String COUNTER_VERSION = "caption-visible-counters-v4-r1";
    static final String BOUNDARY_VERSION = "android-icu+indic-virama-v2";

    private CaptionUnicode() {}

    static String backend() {
        return "android.icu;icu="
                + VersionInfo.ICU_VERSION
                + ";unicode="
                + UCharacter.getUnicodeVersion()
                + ";sdk="
                + Build.VERSION.SDK_INT
                + ";boundaries="
                + BOUNDARY_VERSION
                + ";counter="
                + COUNTER_VERSION;
    }

    static int[] characterBoundaries(String text, Locale locale) {
        Objects.requireNonNull(text);
        Objects.requireNonNull(locale);
        // Mutable iterators are isolated per call, with an explicit representative profile locale.
        BreakIterator iterator = BreakIterator.getCharacterInstance(locale);
        iterator.setText(text);
        List<Integer> out = new ArrayList<>();
        for (int n = iterator.first(); n != BreakIterator.DONE; n = iterator.next()) {
            if (n == 0 || n == text.length() || !insideIndicConjunct(text, n)) out.add(n);
        }
        return integers(out);
    }

    /**
     * API28 lacks newer Indic-conjunct rules. Exclude a virama-linked consonant cut for every Indic
     * script that uses a visible virama (Devanagari, Bengali, Gurmukhi, Gujarati, Oriya, Tamil,
     * Telugu, Kannada, Malayalam, Sinhala, Myanmar, Khmer). ZWNJ deliberately ends the link; no
     * arbitrary script/ZWJ concatenation is performed.
     */
    private static boolean insideIndicConjunct(String text, int boundary) {
        int right = text.codePointAt(boundary);
        if (!indicConsonant(right)) return false;
        for (int at = boundary; at > 0; ) {
            int cp = text.codePointBefore(at);
            at -= Character.charCount(cp);
            if (indicVirama(cp)) {
                // The virama must follow a consonant of the same script (possibly with marks).
                while (at > 0) {
                    int base = text.codePointBefore(at);
                    at -= Character.charCount(base);
                    if (mark(base)) continue;
                    return indicConsonant(base);
                }
                return false;
            }
            if (cp == 0x200d || mark(cp)) continue;
            return false;
        }
        return false;
    }

    private static boolean indicVirama(int cp) {
        switch (cp) {
            case 0x094D: // Devanagari
            case 0x09CD: // Bengali
            case 0x0A4D: // Gurmukhi
            case 0x0ACD: // Gujarati
            case 0x0B4D: // Oriya
            case 0x0BCD: // Tamil
            case 0x0C4D: // Telugu
            case 0x0CCD: // Kannada
            case 0x0D4D: // Malayalam
            case 0x0DCA: // Sinhala
            case 0x1039: // Myanmar
            case 0x17D2: // Khmer coeng
                return true;
            default:
                return false;
        }
    }

    private static boolean indicConsonant(int cp) {
        return (cp >= 0x0915 && cp <= 0x0939) // Devanagari
                || (cp >= 0x0958 && cp <= 0x095f)
                || (cp >= 0x0978 && cp <= 0x097f)
                || (cp >= 0x0995 && cp <= 0x09b9) // Bengali
                || (cp >= 0x0a15 && cp <= 0x0a39) // Gurmukhi
                || (cp >= 0x0a95 && cp <= 0x0ab9) // Gujarati
                || (cp >= 0x0b15 && cp <= 0x0b39) // Oriya
                || (cp >= 0x0b95 && cp <= 0x0bb9) // Tamil
                || (cp >= 0x0c15 && cp <= 0x0c39) // Telugu
                || (cp >= 0x0c95 && cp <= 0x0cb9) // Kannada
                || (cp >= 0x0d15 && cp <= 0x0d39) // Malayalam
                || (cp >= 0x0d9a && cp <= 0x0dc6) // Sinhala
                || (cp >= 0x1000 && cp <= 0x102a) // Myanmar
                || (cp >= 0x1780 && cp <= 0x17b3); // Khmer
    }

    static int[] lineBoundaries(String text, Locale locale) {
        int[] characters = characterBoundaries(text, locale);
        BreakIterator iterator = BreakIterator.getLineInstance(locale);
        iterator.setText(text);
        List<Integer> out = new ArrayList<>();
        for (int n = iterator.first(); n != BreakIterator.DONE; n = iterator.next())
            if (Arrays.binarySearch(characters, n) >= 0) out.add(n);
        return integers(out);
    }

    private static final class SemanticIterators {
        Locale locale;
        BreakIterator word, sentence;

        void locale(Locale value) {
            if (value.equals(locale)) return;
            locale = value;
            word = BreakIterator.getWordInstance(value);
            sentence = BreakIterator.getSentenceInstance(value);
        }
    }

    private static final ThreadLocal<SemanticIterators> SEMANTIC =
            ThreadLocal.withInitial(SemanticIterators::new);

    static int[] wordBoundaries(String text, Locale locale) {
        return semanticBoundaries(text, locale, false);
    }

    static int[] sentenceBoundaries(String text, Locale locale) {
        return semanticBoundaries(text, locale, true);
    }

    private static int[] semanticBoundaries(String text, Locale locale, boolean sentences) {
        Objects.requireNonNull(text);
        Objects.requireNonNull(locale);
        SemanticIterators local = SEMANTIC.get();
        local.locale(locale);
        BreakIterator iterator = sentences ? local.sentence : local.word;
        iterator.setText(text);
        int[] graphemes = characterBoundaries(text, locale);
        List<Integer> out = new ArrayList<>();
        for (int n = iterator.first(); n != BreakIterator.DONE; n = iterator.next())
            if (Arrays.binarySearch(graphemes, n) >= 0) out.add(n);
        return integers(out);
    }

    private static int[] integers(List<Integer> values) {
        int[] out = new int[values.size()];
        for (int i = 0; i < out.length; i++) out[i] = values.get(i);
        return out;
    }

    private static boolean mark(int cp) {
        int t = UCharacter.getType(cp);
        return t == Character.NON_SPACING_MARK
                || t == Character.COMBINING_SPACING_MARK
                || t == Character.ENCLOSING_MARK;
    }

    private static boolean invisible(int cp) {
        int t = UCharacter.getType(cp);
        return mark(cp)
                || t == Character.FORMAT
                || t == Character.CONTROL
                || t == Character.LINE_SEPARATOR
                || t == Character.PARAGRAPH_SEPARATOR;
    }

    /** First visible base in the complete ICU cluster; attached marks never get extra weight. */
    private static int base(String text, int from, int to) {
        for (int at = from; at < to; ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (!invisible(cp)) return cp;
        }
        return -1;
    }

    private static boolean emojiCluster(String text, int from, int to) {
        for (int at = from; at < to; ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (cp == 0xfe0f
                    || cp == 0x20e3
                    || (cp >= 0x1f1e6 && cp <= 0x1f1ff)
                    || UCharacter.hasBinaryProperty(cp, UProperty.EMOJI_PRESENTATION)) return true;
        }
        return false;
    }

    static int readingUnits(String text, CaptionLanguageProfile profile) {
        return readingUnits(text, profile, profile.locale);
    }

    static int readingUnits(String text, CaptionLanguageProfile profile, Locale locale) {
        Objects.requireNonNull(text);
        Objects.requireNonNull(profile);
        int[] boundaries = characterBoundaries(text, locale);
        int count = 0;
        for (int i = 1; i < boundaries.length; i++)
            if (base(text, boundaries[i - 1], boundaries[i]) >= 0) count++;
        return count;
    }

    /** Integer half units: 1 whole CPL unit = 2 halfUnits. Not Paint width, not CPS. */
    static int lineHalfUnits(String text, CaptionLanguageProfile profile) {
        return lineHalfUnits(text, profile, profile.locale);
    }

    static int lineHalfUnits(String text, CaptionLanguageProfile profile, Locale locale) {
        Objects.requireNonNull(text);
        Objects.requireNonNull(profile);
        int[] boundaries = characterBoundaries(text, locale),
                prefix = lineHalfPrefix(text, profile, boundaries);
        return prefix[prefix.length - 1];
    }

    /**
     * Prefixes share the already computed graphemes; layout can compare many candidate lines in
     * O(log n).
     */
    static int[] lineHalfPrefix(String text, CaptionLanguageProfile profile, int[] boundaries) {
        int[] prefix = new int[boundaries.length];
        for (int i = 1; i < boundaries.length; i++) {
            int cp = base(text, boundaries[i - 1], boundaries[i]), weight = cp < 0 ? 0 : 2;
            if (cp >= 0 && !emojiCluster(text, boundaries[i - 1], boundaries[i])) {
                if (profile.lineCounter == CaptionLanguageProfile.LineCounter.JAPANESE_WIDTH) {
                    int width = UCharacter.getIntPropertyValue(cp, UProperty.EAST_ASIAN_WIDTH);
                    if (width == UCharacter.EastAsianWidth.HALFWIDTH
                            || width == UCharacter.EastAsianWidth.NARROW) weight = 1;
                } else if (profile.lineCounter == CaptionLanguageProfile.LineCounter.KOREAN_WIDTH) {
                    int type = UCharacter.getType(cp);
                    boolean punctuation =
                            type == Character.CONNECTOR_PUNCTUATION
                                    || type == Character.DASH_PUNCTUATION
                                    || type == Character.START_PUNCTUATION
                                    || type == Character.END_PUNCTUATION
                                    || type == Character.INITIAL_QUOTE_PUNCTUATION
                                    || type == Character.FINAL_QUOTE_PUNCTUATION
                                    || type == Character.OTHER_PUNCTUATION;
                    if (UCharacter.getIntPropertyValue(cp, UProperty.SCRIPT) == UScript.LATIN
                            || UCharacter.isUWhiteSpace(cp)
                            || punctuation) weight = 1;
                }
            }
            prefix[i] = prefix[i - 1] + weight;
        }
        return prefix;
    }
}
