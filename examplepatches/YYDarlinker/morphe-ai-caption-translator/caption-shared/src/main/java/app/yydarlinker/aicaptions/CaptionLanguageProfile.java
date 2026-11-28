package app.yydarlinker.aicaptions;

import android.icu.lang.UScript;
import android.net.Uri;

import java.util.Collections;
import java.util.IllformedLocaleException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.HashMap;

/** Immutable locale, direction and advisory reading references for complete-unit presentation. */
public final class CaptionLanguageProfile {
    static final String POLICY_VERSION = "caption-reading-v4-r1";

    enum Direction {
        LTR,
        RTL,
        FIRST_STRONG
    }

    enum LineCounter {
        CJK,
        GRAPHEME,
        JAPANESE_WIDTH,
        KOREAN_WIDTH
    }

    final String id;
    final String policyVersion = POLICY_VERSION;
    final Locale locale;
    final Direction direction;
    final LineCounter lineCounter;
    public final int referenceCps, referenceCpl;
    public final long softPageDurationMs = 7000;
    public final long minimumPageMs;

    private CaptionLanguageProfile(
            String id, Direction direction, LineCounter line, int cps, int cpl) {
        this.id = id;
        locale = Locale.forLanguageTag(id.equals("generic") ? "und" : id);
        this.direction = direction;
        lineCounter = line;
        referenceCps = cps;
        referenceCpl = cpl;
        minimumPageMs = id.equals("ja") ? 500 : 833;
    }

    private static final Map<String, CaptionLanguageProfile> PROFILES = new LinkedHashMap<>();
    static final CaptionLanguageProfile GENERIC =
            new CaptionLanguageProfile(
                    "generic", Direction.FIRST_STRONG, LineCounter.GRAPHEME, 17, 42);

    /** Synthesized profile for an RTL script that has no named row yet. */
    static final CaptionLanguageProfile RTL_GENERIC =
            new CaptionLanguageProfile("generic-rtl", Direction.RTL, LineCounter.GRAPHEME, 17, 42);

    /** Synthesized profiles for scripts whose named rows do not cover every code of that script. */
    static final CaptionLanguageProfile CJK_GENERIC =
            new CaptionLanguageProfile("generic-cjk", Direction.LTR, LineCounter.CJK, 9, 16);

    static final CaptionLanguageProfile HANGUL_GENERIC =
            new CaptionLanguageProfile(
                    "generic-hangul", Direction.LTR, LineCounter.KOREAN_WIDTH, 12, 16);

    static final CaptionLanguageProfile DEVANAGARI_GENERIC =
            new CaptionLanguageProfile(
                    "generic-devanagari", Direction.LTR, LineCounter.GRAPHEME, 22, 42);

    static {
        add("zh-Hans", Direction.LTR, LineCounter.CJK, 9, 16);
        add("zh-Hant", Direction.LTR, LineCounter.CJK, 9, 16);
        add("ja", Direction.LTR, LineCounter.JAPANESE_WIDTH, 4, 13);
        add("ko", Direction.LTR, LineCounter.KOREAN_WIDTH, 12, 16);
        add("en", Direction.LTR, LineCounter.GRAPHEME, 20, 42);
        add("th", Direction.LTR, LineCounter.GRAPHEME, 17, 35);
        for (String id : new String[] {"es", "fr", "de", "pt", "ru", "vi", "id"})
            add(id, Direction.LTR, LineCounter.GRAPHEME, 17, 42);
        add("ar", Direction.RTL, LineCounter.GRAPHEME, 20, 42);
        add("hi", Direction.LTR, LineCounter.GRAPHEME, 22, 42);
    }

    private static void add(String id, Direction direction, LineCounter line, int cps, int cpl) {
        PROFILES.put(id, new CaptionLanguageProfile(id, direction, line, cps, cpl));
    }

    static Map<String, CaptionLanguageProfile> profiles() {
        return Collections.unmodifiableMap(PROFILES);
    }

    /**
     * Normalizes metadata, never a Session target/URL/cache key. UNKNOWN is not a language guess.
     */
    static String normalizeCode(String code) {
        if (code == null) return "UNKNOWN";
        String tag = code.trim().replace('_', '-').replaceAll("\\s*-\\s*", "-");
        if (tag.isEmpty()
                || tag.length() > 128
                || !tag.matches("[A-Za-z]{2,8}(?:-[A-Za-z0-9]{1,8})*")) return "UNKNOWN";
        try {
            Locale parsed = new Locale.Builder().setLanguageTag(tag).build();
            String primary = parsed.getLanguage();
            if (primary.isEmpty()
                    || primary.equals("und")
                    || primary.equals("unknown")
                    || primary.equals("zxx")
                    || primary.equals("mul")) return "UNKNOWN";
            return parsed.toLanguageTag();
        } catch (IllformedLocaleException e) {
            return "UNKNOWN";
        }
    }

    public static CaptionLanguageProfile fromCode(String code) {
        String tag = normalizeCode(code);
        if (tag.equals("UNKNOWN")) return GENERIC;
        Locale parsed = Locale.forLanguageTag(tag);
        if (parsed.getLanguage().equals("zh")) {
            String script = parsed.getScript(), region = parsed.getCountry();
            if (script.equals("Hans")) return PROFILES.get("zh-Hans");
            if (script.equals("Hant")) return PROFILES.get("zh-Hant");
            if (!script.isEmpty()) return GENERIC;
            if (region.equals("CN") || region.equals("SG")) return PROFILES.get("zh-Hans");
            if (region.equals("TW") || region.equals("HK") || region.equals("MO"))
                return PROFILES.get("zh-Hant");
            // A bare `zh` from YouTube's auto-translate menu is Simplified in practice; it must
            // keep the CJK metrics and line counter instead of falling to GENERIC.
            return PROFILES.get("zh-Hans");
        }
        CaptionLanguageProfile p = PROFILES.get(parsed.getLanguage());
        if (p != null) return p;
        return scriptFallback(tag);
    }

    /**
     * A code that is not in the named table still gets the typography of its script instead of a
     * single generic row: CJK metrics for Han/Kana, Korean width for Hangul, Devanagari reading
     * metrics, RTL direction for Arabic/Hebrew/Syriac scripts. The visual result is not worse than
     * GENERIC and is much closer for the scripts that differ most.
     */
    private static CaptionLanguageProfile scriptFallback(String tag) {
        int script = CaptionScript.primary(tag);
        switch (script) {
            case android.icu.lang.UScript.HAN:
            case android.icu.lang.UScript.HIRAGANA:
            case android.icu.lang.UScript.KATAKANA:
                return CJK_GENERIC;
            case android.icu.lang.UScript.HANGUL:
                return HANGUL_GENERIC;
            case android.icu.lang.UScript.DEVANAGARI:
                return DEVANAGARI_GENERIC;
            default:
                return rtl(Locale.forLanguageTag(tag)) ? RTL_GENERIC : GENERIC;
        }
    }

    /** Direction from the script, so Hebrew/Persian/Urdu and other RTL codes get a contract. */
    private static boolean rtl(Locale locale) {
        int[] scripts = android.icu.lang.UScript.getCode(locale);
        if (scripts == null) return false;
        for (int script : scripts)
            switch (script) {
                case android.icu.lang.UScript.ARABIC:
                case android.icu.lang.UScript.HEBREW:
                case android.icu.lang.UScript.THAANA:
                case android.icu.lang.UScript.SYRIAC:
                case android.icu.lang.UScript.NKO:
                case android.icu.lang.UScript.ADLAM:
                    return true;
                default:
                    break;
            }
        return false;
    }

    String readingCounterId() {
        return "visible_grapheme";
    }

    String lineCounterId() {
        return lineCounter.name().toLowerCase(Locale.ROOT);
    }
}

/**
 * Script-level typography facts, not language policy. It answers two questions that used to be
 * hard-coded as "is the target Chinese?":
 *
 * <ul>
 *   <li>does this script set words together without an inter-word space (Han, Kana, Thai, Lao,
 *       Khmer, Myanmar)? Korean is written WITH spaces between eojeol and is deliberately not in
 *       this set;
 *   <li>must a visible space separate two adjacent runs of this script?
 * </ul>
 *
 * <p>The answer is derived from ICU script properties so a target language that was never listed
 * in a profile still gets correct spacing and line-break behaviour.
 */
final class CaptionScript {
    private CaptionScript() {}

    /** True when the locale's dominant script is written without spaces between words. */
    static boolean compact(Locale locale) {
        int[] codes = UScript.getCode(locale);
        if (codes == null || codes.length == 0) return false;
        return compact(codes[0]);
    }

    static boolean compact(int script) {
        switch (script) {
            case UScript.HAN:
            case UScript.HIRAGANA:
            case UScript.KATAKANA:
            case UScript.THAI:
            case UScript.LAO:
            case UScript.KHMER:
            case UScript.MYANMAR:
                return true;
            default:
                return false;
        }
    }

    /**
     * A joining space is needed only between two word characters whose scripts both use spaces.
     * Punctuation already carries the separation; a compact-script side sets tight.
     */
    static boolean requiresSpace(int left, int right) {
        if (left < 0 || right < 0) return false;
        if (Character.isWhitespace(left) || Character.isWhitespace(right)) return false;
        if (!Character.isLetterOrDigit(left) || !Character.isLetterOrDigit(right)) return false;
        int leftScript = scriptOf(left);
        int rightScript = scriptOf(right);
        // Chinese + Apple, Japanese + YouTube: a compact script next to a spaced one keeps the
        // visible word space. Only two compact-script sides set tight.
        return !(compact(leftScript) && compact(rightScript));
    }

    private static int scriptOf(int cp) {
        int script = UScript.getScript(cp);
        return script < 0 ? UScript.COMMON : script;
    }

    /** The primary ICU script of a language tag, or -1 when it cannot be determined. */
    static int primary(String languageTag) {
        if (languageTag == null || languageTag.isEmpty()) return -1;
        try {
            int[] codes = UScript.getCode(new Locale.Builder().setLanguageTag(languageTag).build());
            return codes == null || codes.length == 0 ? -1 : codes[0];
        } catch (RuntimeException unavailable) {
            return -1;
        }
    }
}
