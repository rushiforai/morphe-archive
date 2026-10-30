package app.yydarlinker.deepseekcaptions;

import java.util.*;
import java.util.regex.*;

/** Limited contradiction checks, NOT a multilingual semantic equivalence judge. */
final class RebuildSemantics {
    /**
     * Literal hyphenated ASCII identifiers only; no translated aliases or space-to-hyphen
     * inference.
     */
    private static final Pattern LITERAL_MODEL =
            Pattern.compile("(?<![\\p{L}\\p{N}])([A-Za-z]{1,4}-[0-9]{1,3})(?![\\p{L}\\p{N}])");

    static Set<String> literalModels(String text) {
        Set<String> out = new HashSet<>();
        Matcher m = LITERAL_MODEL.matcher(text);
        while (m.find()) out.add(m.group(1));
        return out;
    }

    static boolean has(String pattern, String value) {
        return Pattern.compile(pattern, Pattern.CASE_INSENSITIVE).matcher(value).find();
    }

    static boolean chinese(String text) {
        return text.codePoints()
                        .anyMatch(c -> Character.UnicodeScript.of(c) == Character.UnicodeScript.HAN)
                && !text.codePoints()
                        .anyMatch(
                                c ->
                                        Character.UnicodeScript.of(c)
                                                        == Character.UnicodeScript.HIRAGANA
                                                || Character.UnicodeScript.of(c)
                                                        == Character.UnicodeScript.KATAKANA);
    }

    /**
     * Reject only positively observed cross-event transfers; omissions/synonyms are not proved
     * locally.
     */
    static void validatePlan(
            RebuildSource source, RebuildPlanner.Block block, List<RebuildProtocol.Event> events)
            throws RebuildProtocol.Invalid {
        Set<String> allModels = literalModels(source.text(block.from, block.to));
        for (RebuildProtocol.Event e : events) {
            Set<String> ownModels = literalModels(source.text(e.from, e.to));
            for (String id : literalModels(e.text))
                if (allModels.contains(id) && !ownModels.contains(id))
                    throw new RebuildProtocol.Invalid(
                            "semantic_anchor_leak",
                            "range="
                                    + e.from
                                    + "-"
                                    + e.to
                                    + "; model="
                                    + id
                                    + " belongs elsewhere in this block; translate only the quoted"
                                    + " source");
        }
    }

    /**
     * Target-script guard for every language pair, not only English to Chinese.
     *
     * <p>A provider may echo the source or answer in the wrong script. That is a deterministic
     * failure even when a full semantic judge is unavailable. Keep the rule conservative: reject
     * kana/hangul where the target cannot use them, an alphabetic echo where the target is CJK, and
     * an exact source echo across different language families. Short names and numbers stay legal.
     */
    static void validateTarget(
            String sourceText, String targetText, CaptionLanguageContext context)
            throws RebuildProtocol.Invalid {
        if (targetText == null || targetText.trim().isEmpty()) return;
        String target = Locale.forLanguageTag(context.targetCode).getLanguage();
        String source = Locale.forLanguageTag(context.sourceCode).getLanguage();
        int kana = countScript(targetText, Character.UnicodeScript.HIRAGANA)
                + countScript(targetText, Character.UnicodeScript.KATAKANA);
        int hangul = countScript(targetText, Character.UnicodeScript.HANGUL);
        int han = countScript(targetText, Character.UnicodeScript.HAN);
        int letters = countLetters(targetText);
        int sourceWords = sourceText == null ? 0 : sourceText.trim().split("\\s+").length;
        if ("zh".equals(target)) {
            if (kana > 0 || hangul > 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch",
                        "target=zh; found kana=" + kana + "; hangul=" + hangul);
            if (sourceWords > 1 && letters > 4 && han == 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch", "target=zh; no Han characters in translation");
        } else if ("ja".equals(target)) {
            if (hangul > 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch", "target=ja; found hangul=" + hangul);
            if (sourceWords > 1 && letters > 4 && han == 0 && kana == 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch", "target=ja; no Japanese script in translation");
        } else if ("ko".equals(target)) {
            if (kana > 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch", "target=ko; found kana=" + kana);
            if (sourceWords > 1 && letters > 4 && han == 0 && hangul == 0)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch", "target=ko; no Hangul in translation");
        } else {
            // Script guard for every other target. It is conservative: a translation that is
            // clearly written in a different script from the selected target is rejected, while
            // names, numbers and short replies stay legal. Latin-target languages cannot be told
            // apart by script alone; they keep the universal source-echo check below.
            int expected = CaptionScript.primary(context.targetCode);
            int sourceScript = CaptionScript.primary(context.sourceCode);
            int targetHits = expected < 0 ? 0 : countScript(targetText, expected);
            int sourceHits =
                    sourceScript < 0 ? 0 : countScript(targetText, sourceScript);
            if (expected >= 0
                    && expected != android.icu.lang.UScript.LATIN
                    && letters > 8
                    && targetHits == 0
                    && sourceHits > 0
                    && sourceScript != expected)
                throw new RebuildProtocol.Invalid(
                        "target_language_mismatch",
                        "target="
                                + target
                                + "; no "
                                + scriptName(expected)
                                + " script in translation");
        }
        String visibleSource = compactVisible(sourceText);
        String visibleTarget = compactVisible(targetText);
        if (visibleSource.length() > 12
                && !source.equals(target)
                && visibleSource.equalsIgnoreCase(visibleTarget))
            throw new RebuildProtocol.Invalid(
                    "untranslated_source", "translation repeats the source across languages");
    }

    private static int countScript(String text, Character.UnicodeScript script) {
        int count = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (Character.UnicodeScript.of(cp) == script) count++;
        }
        return count;
    }

    private static int countScript(String text, int script) {
        int count = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (android.icu.lang.UScript.getScript(cp) == script) count++;
        }
        return count;
    }

    private static String scriptName(int script) {
        String name = android.icu.lang.UScript.getShortName(script);
        return name == null ? Integer.toString(script) : name;
    }

    private static int countLetters(String text) {
        int count = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (Character.isLetter(cp)) count++;
        }
        return count;
    }

    private static String compactVisible(String text) {
        if (text == null) return "";
        StringBuilder out = new StringBuilder(text.length());
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (!Character.isWhitespace(cp)) out.appendCodePoint(cp);
        }
        return out.toString();
    }

}
