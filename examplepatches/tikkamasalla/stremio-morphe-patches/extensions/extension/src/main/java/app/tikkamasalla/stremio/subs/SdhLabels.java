package app.tikkamasalla.stremio.subs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Pure Java subtitle helpers: label ranking, content scoring and cue cleaning.
 * No Android or Media3 imports, so plain javac unit tests can compile this
 * file on its own. Unicode escapes are used instead of literal symbols.
 *
 * Scoring follows an exponential saturation curve over the share of cues
 * carrying SDH signals, which separates sparse-but-real SDH tracks from
 * lyric-heavy FULL tracks better than a plain share.
 *
 * SDH annotation rules adapted from liongalahad-nuviotv-morphe-patches
 * (GPLv3): fullwidth bracket blocks, nested outer-block removal, speaker
 * roles and blocklist, music mood/action and lyric dialogue word lists,
 * inline paired music-marker handling. Chevron stripping and fullwidth
 * parens follow NuvioTV's native Strip SDH behavior, minus its
 * character-set paren rule (sound-keyword guard is kept instead).
 */
public final class SdhLabels {
    private SdhLabels() {
    }

    /**
     * Whole-word match for SDH / CC / HI track labels. Non-alphanumeric
     * separators (spaces, dots, underscores, dashes, brackets) act as
     * boundaries, so "eng.hi.srt" matches while "Chinese" and "Ethics"
     * do not.
     */
    private static final Pattern SDH_LABEL = Pattern.compile(
            "(?i)(?<![A-Za-z0-9])(?:"
                    + "sdh|cc|hi"
                    + "|hearing[\\s._-]*impaired"
                    + "|closed[\\s._-]*captions?"
                    + "|deaf[\\s._-]*and[\\s._-]*hard[\\s._-]*of[\\s._-]*hearing"
                    + ")(?![A-Za-z0-9])");
    private static final Pattern FORCED_LABEL = Pattern.compile("(?i)\\bforced\\b");
    private static final Pattern SIGNS_LABEL = Pattern.compile("(?i)\\bsigns\\b");

    /** Matches ASS/SSA override blocks such as {\an8} or {\pos(100,200)}. */
    private static final Pattern ASS_TAG_PATTERN = Pattern.compile("\\{\\\\[^\\}]*\\}");
    /** Matches literal ASS newline escapes (\N or \n). */
    private static final Pattern ASS_NEWLINE_PATTERN = Pattern.compile("\\\\[Nn]");
    /** Matches all HTML-style tags (<i>, </i>, <b>, <font ...>, etc.). */
    private static final Pattern ALL_HTML_TAG_PATTERN = Pattern.compile("</?[a-zA-Z][^>]*>");
    /** Matches HTML tags other than <i> and </i> so italics survive cleaning. */
    private static final Pattern NON_ITALIC_HTML_TAG_PATTERN =
            Pattern.compile("</?(?!i\\b)[a-zA-Z][^>]*>");
    /** Matches empty <i></i> tags left after removing inner SDH tokens. */
    private static final Pattern EMPTY_ITALIC_PATTERN = Pattern.compile("(?i)<i>\\s*</i>");
    /** Whitespace normalisation around <i> and </i> tags. */
    private static final Pattern OPEN_ITALIC_SPACE_PATTERN = Pattern.compile("(?i)<i>\\s+");
    private static final Pattern CLOSE_ITALIC_SPACE_PATTERN = Pattern.compile("(?i)\\s+</i>");

    /** Matches square-bracketed segments: [...]. Trailing colons are handled by the remover. */
    private static final Pattern SQUARE_BRACKET_PATTERN =
            Pattern.compile("\\[([^\\[\\]]+)\\]");
    /** Matches fullwidth square-bracketed segments: [...] with CJK brackets. */
    private static final Pattern FULL_SQUARE_BRACKET_PATTERN =
            Pattern.compile("\\uFF3B([^\\uFF3B\\uFF3D]+)\\uFF3D");
    /** Matches parenthesised segments: (...). Trailing colons are handled by the remover. */
    private static final Pattern PAREN_PATTERN = Pattern.compile("\\(([^()]+)\\)");
    /** Matches CEA-608 speaker/topic chevrons (>> speaker change, >>> topic change).
     * Same-direction runs only, so emoticons (><, <>) and HTML tag boundaries
     * (<i><b>) never match. Leading/trailing runs are stripped outside tags;
     * mid-line runs become turn breaks in cleanSingleLine. */
    private static final Pattern LEADING_CHEVRON_PATTERN = Pattern.compile(
            "^((?:(?i:<i>)\\s*|[ \\t\\-\\u2013\\u2014])*)(?:>{2,}|<{2,})[ \\t]*");
    private static final Pattern TRAILING_CHEVRON_PATTERN = Pattern.compile(
            "[ \\t]*(?:>{2,}|<{2,})((?:\\s*(?i:</i>))*\\s*)$");
    private static final Pattern MIDLINE_CHEVRON_PATTERN = Pattern.compile(
            "(?<![<>\\w])(?:>{2,}(?![<>])|<{2,}(?![<>/A-Za-z]))");
    /** Matches fullwidth parenthesised segments with CJK parens. */
    private static final Pattern FULL_PAREN_PATTERN =
            Pattern.compile("\\uFF08([^\\uFF08\\uFF09]+)\\uFF09");

    /**
     * Matches on-screen sign translations inside brackets or parentheses,
     * which are kept as dialogue: "[Sign: Bakery]", "[Title: Chapter 1]".
     */
    private static final Pattern SIGN_PREFIX_PATTERN = Pattern.compile(
            "(?i)^\\s*(?:on[-\\s]+)?(?:sign|signs|text|title|caption|banner|poster|label|headline|note|plaque|billboard|screen)\\s*:");

    /** Matches lines wrapped in or consisting of music markers. */
    private static final Pattern MUSIC_LINE_PATTERN = Pattern.compile(
            "^(?:[\\u266A\\u266B#\\s-]+|[\\u266A\\u266B].*|.+[\\u266A\\u266B]|#\\s*[^#]+\\s*#)$");
    /** Strips leading/trailing music notes, hyphens and punctuation for checks. */
    private static final Pattern MUSIC_WRAPPER_STRIP_PATTERN = Pattern.compile(
            "^[\\u266A\\u266B#\\s\\-\\u2013\\u2014.,!?\"']+|[\\u266A\\u266B#\\s\\-\\u2013\\u2014.,!?\"']+$");
    /** Strips leading music-marker runs (notes, hashes, dashes) from lyrics. */
    private static final Pattern LEADING_MARKERS_PATTERN =
            Pattern.compile("^[\\s\\u266A\\u266B#\\-\\u2013\\u2014]+");
    /** Strips trailing music-marker runs from lyrics. */
    private static final Pattern TRAILING_MARKERS_PATTERN =
            Pattern.compile("[\\s\\u266A\\u266B#\\-\\u2013\\u2014]+$");
    /** Matches an inline paired music segment of up to 80 chars. */
    private static final Pattern PAIRED_NOTES_PATTERN = Pattern.compile(
            "(?:[\\u266A\\u266B])+\\s*((?:(?![\\u266A\\u266B])[^\\r\\n]){0,80}?)\\s*(?:[\\u266A\\u266B])+");
    /** Matches a quoted song title of 1-60 chars. */
    private static final Pattern QUOTED_TITLE_PATTERN =
            Pattern.compile("[\\u201C\\u201D\"][^\"\\u201C\\u201D\\r\\n]{1,60}[\"\\u201C\\u201D]");

    /**
     * Matches ALL-CAPS speaker labels with an optional parenthetical
     * qualifier: "JOHN:", "MAN 2:", "JOHN (ON PHONE):", "- WOMAN:",
     * "<i>JOHN:</i>". Group 1 is the name candidate.
     */
    private static final Pattern SPEAKER_COLON_PATTERN = Pattern.compile(
            "^(?:[-\\u2013\\u2014]\\s*)?(?:(?i:<i>)\\s*)?([A-Z][A-Z0-9\\s.'#&\\-\\u2013\\u2014]{1,24})"
                    + "(?:\\s*(?:\\([^()\\r\\n]{1,24}\\)|\\uFF08[^\\uFF08\\uFF09\\r\\n]{1,24}\\uFF09))?:\\s*(?:(?i:</i>)\\s*)?");
    /**
     * Matches ALL-CAPS bracketed speaker labels: "[JOHN]", "[MAN 2]",
     * "- [WOMAN]". Group 1 is the name candidate.
     */
    private static final Pattern SPEAKER_BRACKET_START_PATTERN = Pattern.compile(
            "^(?:[-\\u2013\\u2014]\\s*)?(?:(?i:<i>)\\s*)?\\[([A-Z][A-Z0-9\\s.'#&\\-\\u2013\\u2014]{1,24})\\]\\s*:?\\s*");

    /**
     * Non-speaker uppercase prefixes that may precede a colon in normal or
     * forced subtitles.
     */
    private static final Pattern NON_SPEAKER_PREFIX_PATTERN = Pattern.compile(
            "^(?:SIGN|SIGNS|NOTE|NOTES|TEXT|TITLE|TIME|DATE|LOCATION|PLACE|WARNING|CAUTION|NOTICE|DANGER|CHAPTER|EPISODE|PART|ACT|SCENE|TO|FROM|SUBJECT|RE|AT|HTTP|HTTPS|RATIO|VISIT)$");

    /**
     * Name or role labels accepted as speakers after a colon: all uppercase,
     * Title Case one-to-three words, or a known role with uppercase first.
     */
    private static final Pattern SPEAKER_ROLE_PATTERN = Pattern.compile(
            "^(?:man|woman|boy|girl|child|narrator|announcer|tv announcer|radio announcer|reporter|interviewer|host|operator|dispatcher|caller|spouse|husband|wife|mother|father|lawyer|attorney|judge|waiter|waitress|doctor|nurse|officer|detective|teacher|student|crowd|all|voice|voices|tom|john|mike|sarah)$",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern PAREN_QUALIFIER_PATTERN = Pattern.compile(
            "\\s*(?:\\([^()]{1,24}\\)|\\uFF08[^\\uFF08\\uFF09]{1,24}\\uFF09)\\s*$");
    private static final Set<String> SPEAKER_BLOCKLIST = new HashSet<String>(Arrays.asList(
            "at", "chapter", "http", "https", "note", "ratio", "rule", "scene",
            "time", "visit", "warning"));

    /**
     * Comprehensive SDH sound, vocalisation, action, music, manner and
     * language descriptors. Every root is word-boundaried to avoid false
     * substring matches. Mood words (sad, romantic, background) and "score"
     * follow the C word list.
     */
    private static final Pattern SDH_SOUND_KEYWORDS_PATTERN = Pattern.compile(
            "(?i)\\b(?:"
                    + "laugh(?:s|ed|ing|ter)?|chuckl(?:es?|ed|ing)|giggl(?:es?|ed|ing)|snicker(?:s|ed|ing)?"
                    + "|cackl(?:es?|ed|ing)|sigh(?:s|ed|ing)?|groan(?:s|ed|ing)?|moan(?:s|ed|ing)?"
                    + "|grunt(?:s|ed|ing)?|gasp(?:s|ed|ing)?|pant(?:s|ed|ing)?|wheez(?:es?|ed|ing)"
                    + "|cough(?:s|ed|ing)?|sneez(?:es?|ed|ing)|sniff(?:s|ed|ing|l(?:es?|ed|ing))?"
                    + "|snort(?:s|ed|ing)?|sob(?:s|bed|bing)?|weep(?:s|ing)?|wept|wail(?:s|ed|ing)?"
                    + "|cr(?:y|ies|ied|ying)|scream(?:s|ed|ing)?|shriek(?:s|ed|ing)?|screech(?:es|ed|ing)?"
                    + "|yell(?:s|ed|ing)?|shout(?:s|ed|ing)?|holler(?:s|ed|ing)?|bellow(?:s|ed|ing)?"
                    + "|roar(?:s|ed|ing)?|howl(?:s|ed|ing)?|whimper(?:s|ed|ing)?|whin(?:es?|ed|ing)"
                    + "|whisper(?:s|ed|ing)?|mutter(?:s|ed|ing)?|mumbl(?:es?|ed|ing)|murmur(?:s|ed|ing)?"
                    + "|stammer(?:s|ed|ing)?|stutter(?:s|ed|ing)?|slur(?:s|red|ring)?|hiccup(?:s|ped|ping)?"
                    + "|belch(?:es|ed|ing)?|burp(?:s|ed|ing)?|yawn(?:s|ed|ing)?|gulp(?:s|ed|ing)?"
                    + "|swallow(?:s|ed|ing)?|clear(?:s|ed|ing)?\\s+(?:his|her|their)?\\s*throat|throat\\s+clearing"
                    + "|inhal(?:es?|ed|ing)|exhal(?:es?|ed|ing)|breath(?:es?|ed|ing|less(?:ly)?)"
                    + "|scoff(?:s|ed|ing)?|snarl(?:s|ed|ing)?|growl(?:s|ed|ing)?|hiss(?:es|ed|ing)?"
                    + "|hum(?:s|med|ming)?|whistl(?:es?|ed|ing)|chant(?:s|ed|ing)?|cheer(?:s|ed|ing)?"
                    + "|applau(?:d(?:s|ed|ing)?|se)|clap(?:s|ped|ping)?|boo(?:s|ed|ing)?|jeer(?:s|ed|ing)?"
                    + "|chatter(?:s|ed|ing)?|clamor(?:s|ed|ing)?|commotion|babbl(?:es?|ed|ing)"
                    + "|gurgl(?:es?|ed|ing)|strangl(?:es?|ed|ing)|chok(?:es?|ed|ing)|gag(?:s|ged|ging)?"
                    + "|retch(?:es|ed|ing)?|spit(?:s|ting)?|kiss(?:es|ed|ing)?|smooch(?:es|ed|ing)?"
                    + "|snor(?:es?|ed|ing)|shudder(?:s|ed|ing)?|shiver(?:s|ed|ing)?|trembl(?:es?|ed|ing)"
                    + "|shrug(?:s|ged|ging)?|nod(?:s|ded|ding)?|blink(?:s|ed|ing)?|wink(?:s|ed|ing)?"
                    + "|door(?:bell)?|creak(?:s|ed|ing)?|squeak(?:s|ed|ing)?|slam(?:s|med|ming)?"
                    + "|knock(?:s|ed|ing)?|bang(?:s|ed|ing)?|thud(?:s|ded|ding)?|thump(?:s|ed|ing)?"
                    + "|crash(?:es|ed|ing)?|smash(?:es|ed|ing)?|shatter(?:s|ed|ing)?|crack(?:s|ed|ing|l(?:es?|ed|ing))?"
                    + "|snap(?:s|ped|ping)?|click(?:s|ed|ing)?|clack(?:s|ed|ing)?|clank(?:s|ed|ing)?"
                    + "|clang(?:s|ed|ing)?|clatter(?:s|ed|ing)?|rattl(?:es?|ed|ing)|rustl(?:es?|ed|ing)"
                    + "|rumbl(?:es?|ed|ing)|boom(?:s|ed|ing)?|explod(?:es?|ed|ing)|explosion(?:s)?"
                    + "|gun(?:shot|fire)s?|shot(?:s)?\\s+fired|firing|blast(?:s|ed|ing)?|ricochet(?:s|ed|ing)?"
                    + "|siren(?:s)?|alarm(?:s)?|horn(?:s)?\\s+honk|honk(?:s|ed|ing)?|bell(?:s)?\\s+(?:ring|toll|chim)"
                    + "|chim(?:es?|ed|ing)|ring(?:s|ing)?|rang|buzz(?:es|ed|ing|er)?|beep(?:s|ed|ing)?"
                    + "|chirp(?:s|ed|ing)?|tick(?:s|ed|ing)?|whir(?:s|red|ring)?|rev(?:s|ved|ving)?"
                    + "|engine(?:s)?|motor(?:s)?|tire(?:s)?\\s+screech|skid(?:s|ded|ding)?|brak(?:es?|ed|ing)"
                    + "|footstep(?:s)?|stomp(?:s|ed|ing)?|patter(?:s|ed|ing)?|splash(?:es|ed|ing)?"
                    + "|slosh(?:es|ed|ing)?|drip(?:s|ped|ping)?|thunder(?:s|ed|ing)?|rain(?:s|ed|ing)?"
                    + "|sizzl(?:es?|ed|ing)|pop(?:s|ped|ping)|fizz(?:es|ed|ing)?|whoosh(?:es|ed|ing)?"
                    + "|swish(?:es|ed|ing)?|swoosh(?:es|ed|ing)?|thwack(?:s|ed|ing)?|slap(?:s|ped|ping)?"
                    + "|punch(?:es|ed|ing)?|smack(?:s|ed|ing)?|phone|telephone|radio|intercom|static"
                    + "|music(?:al)?|melod(?:y|ic)|tune|instrument(?:al)?|piano|guitar|violin|cello"
                    + "|drum(?:s|ming)?|percussion|trumpet|sax(?:ophone)?|flute|orchestra(?:l)?|synth(?:esizer)?"
                    + "|organ|harp|choir|chorus|jazz|opera|theme|intro|outro|ballad|jingle|fanfare"
                    + "|crescendo|stinger|soundtrack|audio|sound(?:s)?|silenc(?:e|ed)|silent(?:ly)?"
                    + "|score|sad|romantic|background|sinister"
                    + "|in\\s+(?:spanish|french|german|italian|russian|chinese|japanese|korean|arabic|hindi|portuguese|latin|hebrew|greek|dutch|polish|swedish|turkish|vietnamese|thai|english|foreign|unison)"
                    + "|foreign\\s+language|native\\s+language|speaking\\s+[a-z]+|speaks\\s+[a-z]+"
                    + "|accent|over\\s+phone|on\\s+(?:phone|radio|tv|screen|speaker)|off[-\\s]*screen"
                    + "|voice[-\\s]*over|indistinct(?:ly)?|inaudibl(?:e|y)|unintelligibl(?:e|y)"
                    + "|overlapping|muffled|echo(?:es|ed|ing)?|distorted|sarcastically|softly|loudly|quietly"
                    + "|weakly|continues|continuing|fades|fading|plays|playing|resumes|intensifies|swells"
                    + "|bark(?:s|ed|ing)?|meow(?:s|ed|ing)?|purr(?:s|ed|ing)?|neigh(?:s|ed|ing)?"
                    + "|whinn(?:y|ies|ied|ying)|gallop(?:s|ed|ing)?|hooves|moo(?:s|ed|ing)?|bleat(?:s|ed|ing)?"
                    + "|hoot(?:s|ed|ing)?|croak(?:s|ed|ing)?"
                    + ")\\b");

    /** Keywords marking a music-marker line as a description rather than lyrics. */
    private static final Pattern MUSIC_DESCRIPTION_KEYWORDS_PATTERN = Pattern.compile(
            "(?i)\\b(?:"
                    + "music(?:al)?|piano|guitar|violin|cello|drum(?:s|ming)?|percussion|trumpet"
                    + "|sax(?:ophone)?|flute|orchestra(?:l)?|synth(?:esizer)?|organ|harp|bass|horn|strings"
                    + "|choir|chorus|vocal(?:s|izing)?|hum(?:s|ming)?|whistl(?:es?|ing)|melod(?:y|ic)"
                    + "|tune|theme|intro|outro|solo|riff|beat|rhythm|instrument(?:al)?|jingle|fanfare"
                    + "|ballad|song\\s+(?:plays|playing|begins|starts|continues|ends|fades)"
                    + "|singing\\s+(?:in\\s+[a-z]+|continues|stops|fades)"
                    + "|plays|playing|continues|continuing|fades|fading|swells|begins|starts|ends|stops"
                    + "|upbeat|ominous|dramatic|tense|somber|eerie|mysterious|melanchol(?:y|ic)"
                    + "|jaunty|lively|triumphant|suspenseful|haunting|soothing|gentle"
                    + "|jazz|rock|pop|classical|country|blues|electronic|techno|folk|opera|anthem|lullaby"
                    + "|score|sad|romantic|background"
                    + ")\\b");

    /**
     * Conversational pronouns and dialogue words marking a music-marker line
     * as real song lyrics rather than an SDH music description. Extended
     * with the C dialogue word list.
     */
    private static final Pattern LYRIC_PRONOUN_PATTERN = Pattern.compile(
            "(?i)\\b(?:i|i'm|i\\u2019m|i'll|i've|i'd|me|my|mine|you|you're|you\\u2019re|you'll|you've|your|yours"
                    + "|we|we're|we\\u2019re|we'll|we've|us|our|ours|he|him|his|she|her|hers|they|them|their|theirs"
                    + "|this|that|who|what|where|when|why|how|please"
                    + "|don't|can't|won't|let's|gonna|wanna|never|always|heart|love|tonight|forever)\\b");

    private static final Pattern DIALOGUE_WORD_PATTERN = Pattern.compile(
            "\\b(?:i|i'm|i\\u2019m|me|my|mine|we|our|ours|you|your|yours|he|him|his|she|her|hers"
                    + "|they|them|their|this|that|who|what|where|when|why|how|please)\\b",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern MUSIC_WORD_PATTERN = Pattern.compile(
            "\\b(?:music|instrumental|melody|theme|score|soundtrack|song|singing|sings|choir|orchestra"
                    + "|drums?|guitar|piano|violin|jazz|rock|classical)\\b",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern MUSIC_ACTION_PATTERN = Pattern.compile(
            "\\b(?:plays?|playing|continues?|continuing|starts?|starting|stops?|stopping"
                    + "|fades?|fading|swells?|swelling)\\b",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern MUSIC_MOOD_PATTERN = Pattern.compile(
            "\\b(?:ominous|tense|dramatic|soft|quiet|loud|upbeat|somber|sad|romantic"
                    + "|suspenseful|eerie|gentle|background|sinister)\\b",
            Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    /** Matches a speaker turn separator ("- ", dash variants) inside one line. */
    private static final Pattern INLINE_TURN_SPLIT_PATTERN =
            Pattern.compile("(?:^|\\s+)[-\\u2013\\u2014]\\s+");
    /** Leading hyphen at the start of a line (optionally inside opening <i>). */
    private static final Pattern LEADING_HYPHEN_PATTERN =
            Pattern.compile("^((?:(?i:<i>)\\s*)?)[-\\u2013\\u2014]\\s*");
    /** Trailing dangling hyphen at the end of a line. */
    private static final Pattern TRAILING_HYPHEN_PATTERN =
            Pattern.compile("(?:^|\\s+)[-\\u2013\\u2014]\\s*$");
    /** Extra spaces before punctuation left after removing an inline block. */
    private static final Pattern SPACE_BEFORE_PUNCT_PATTERN = Pattern.compile("\\s+([,.;:!?])");
    /** Multiple horizontal whitespace characters. */
    private static final Pattern MULTI_SPACE_PATTERN = Pattern.compile("[ \\t]{2,}");
    /** Word splitter for word count checks. */
    private static final Pattern WHITESPACE_SPLIT_PATTERN = Pattern.compile("\\s+");

    /** Styling tags that carry no meaning: <i>, <font ...>, {\an8}. */
    private static final Pattern STYLE_TAG = Pattern.compile("<[^<>]{0,60}>|\\{\\\\[^\\{\\}]{0,40}\\}");
    private static final Pattern BLANKS = Pattern.compile("[ \\t\\u00A0]+");
    private static final Pattern TIMESTAMP_LINE =
            Pattern.compile("\\d{1,2}:\\d{2}(:\\d{2})?([,.]\\d{1,3})?\\s*-->");
    /** Music notes: stripped by the cleaner, lyric words between them are kept. */
    private static final Pattern MUSIC_NOTE = Pattern.compile("[\\u266A\\u266B\\u2669]");

    /** Track kinds, best first. Only FULL and SIGNS are dialogue complete. */
    public static final int KIND_FULL = 0;
    public static final int KIND_SIGNS = 1;
    public static final int KIND_FORCED = 2;
    public static final int KIND_SDH = 3;

    /** Role flag for sound descriptions (Media3 C value 0x400). */
    private static final int ROLE_DESCRIBES_SOUND = 0x400;
    /** Selection flag for forced tracks (Media3 C value 0x2). */
    private static final int SELECTION_FORCED = 0x2;

    /**
     * Classification threshold for {@link #isSdhContent(List)}.
     * Conservative: a wrong switch away from a good track costs more than
     * staying on an SDH track the live cleaner still strips.
     */
    public static final double SDH_THRESHOLD = 0.35;
    /** Minimum dialogue cues before a content verdict is trusted. */
    public static final int MIN_DIALOGUE_CUES = 10;
    /** Minimum cues for full-confidence scoring; below this dampen the share. */
    private static final int MIN_CONFIDENT_CUES = 15;
    /** Neutral low-confidence prior used when fewer than 15 cues are present. */
    private static final double NEUTRAL_LOW_CONFIDENCE_SCORE = 0.25;
    /** Scale parameter: 10 percent cue share maps to about 0.63 score. */
    private static final double SHARE_SCALE = 0.10;

    /** True when the track name itself advertises hearing-impaired content. */
    public static boolean isSdhLabel(String label) {
        return label != null && SDH_LABEL.matcher(label).find();
    }

    public static boolean isForcedLabel(String label) {
        return label != null && FORCED_LABEL.matcher(label).find();
    }

    public static boolean isSignsLabel(String label) {
        return label != null && SIGNS_LABEL.matcher(label).find();
    }

    /** Rank a track from its label and Media3 flags. Lower is better. */
    public static int kindOf(String label, int roleFlags, int selectionFlags) {
        if ((roleFlags & ROLE_DESCRIBES_SOUND) != 0) return KIND_SDH;
        if (label != null) {
            if (SDH_LABEL.matcher(label).find()) return KIND_SDH;
            if (FORCED_LABEL.matcher(label).find()) return KIND_FORCED;
            if (SIGNS_LABEL.matcher(label).find()) return KIND_SIGNS;
        }
        if ((selectionFlags & SELECTION_FORCED) != 0) return KIND_FORCED;
        return KIND_FULL;
    }

    /**
     * True for bitmap subtitle formats (PGS, VobSub, DVB). Stremio's player draws some of them
     * outline-only, so text formats (SRT, ASS/SSA, VTT, TTML, ...) are preferred over them.
     * An unknown or missing mime type counts as text.
     */
    public static boolean isBitmapMime(String mime) {
        if (mime == null) return false;
        String v = mime.toLowerCase(Locale.US);
        return v.contains("pgs") || v.contains("vobsub") || v.contains("dvbsub")
                || v.contains("dvb-sub") || v.contains("dvb_sub") || v.contains("xsub");
    }

    /** Normalize a subtitle language for comparison: eng and en both become en. */
    public static String normLang(String lang) {
        if (lang == null) return "";
        String l = lang.toLowerCase(Locale.US).replace('_', '-');
        int dash = l.indexOf('-');
        if (dash > 0) l = l.substring(0, dash);
        if (l.length() == 3) {
            if (l.equals("eng")) return "en";
            if (l.equals("spa")) return "es";
            if (l.equals("fra") || l.equals("fre")) return "fr";
            if (l.equals("deu") || l.equals("ger")) return "de";
            if (l.equals("ita")) return "it";
            if (l.equals("por")) return "pt";
            if (l.equals("rus")) return "ru";
            if (l.equals("jpn")) return "ja";
            if (l.equals("zho") || l.equals("chi")) return "zh";
            if (l.equals("kor")) return "ko";
            if (l.equals("hin")) return "hi";
            if (l.equals("ara")) return "ar";
            if (l.equals("nld") || l.equals("dut")) return "nl";
            if (l.equals("swe")) return "sv";
            if (l.equals("nor") || l.equals("nob")) return "nb";
            if (l.equals("dan")) return "da";
            if (l.equals("fin")) return "fi";
            if (l.equals("pol")) return "pl";
            if (l.equals("tur")) return "tr";
            if (l.equals("ukr")) return "uk";
            return l;
        }
        return l;
    }

    /** True when the cue carries a sound description: tag, music note or speaker label. */
    public static boolean isSoundCue(String cueText) {
        if (cueText == null) return false;
        String stripped = stripFormattingForAnalysis(cueText).trim();
        if (stripped.isEmpty()) return false;
        return hasSdhSignalInCue(stripped);
    }

    /** True when the cue holds dialogue: any letter, or a music-only cue. */
    public static boolean isDialogueCue(String cueText) {
        if (cueText == null) return false;
        String t = cueText.trim();
        if (t.isEmpty()) return false;
        for (int i = 0; i < t.length(); i++) {
            if (Character.isLetter(t.charAt(i))) return true;
        }
        return MUSIC_NOTE.matcher(t).find();
    }

    /**
     * SDH likelihood in 0.0..1.0 over the cue texts (typically the first
     * 40-200 cues). Exponential saturation makes sparse-but-real SDH tracks
     * score well above lyric-heavy FULL tracks. Returns -1 when fewer than
     * MIN_DIALOGUE_CUES dialogue cues are present.
     */
    public static double scoreCues(List<String> cues) {
        if (cues == null || cues.isEmpty()) return -1.0;
        int totalCues = 0;
        int sdhCues = 0;
        int limit = Math.min(cues.size(), 200);
        for (int i = 0; i < limit; i++) {
            String rawCue = cues.get(i);
            if (rawCue == null) continue;
            String stripped = stripFormattingForAnalysis(rawCue).trim();
            if (stripped.isEmpty()) continue;
            totalCues++;
            if (hasSdhSignalInCue(stripped)) sdhCues++;
        }
        if (totalCues < MIN_DIALOGUE_CUES) return -1.0;
        double share = (double) sdhCues / (double) totalCues;
        double rawScore = 1.0 - Math.exp(-share / SHARE_SCALE);
        if (rawScore > 1.0) rawScore = 1.0;
        else if (rawScore < 0.0) rawScore = 0.0;
        if (totalCues < MIN_CONFIDENT_CUES) {
            double confidence = (totalCues / (double) MIN_CONFIDENT_CUES) * 0.35;
            return NEUTRAL_LOW_CONFIDENCE_SCORE * (1.0 - confidence) + rawScore * confidence;
        }
        return rawScore;
    }

    /** True when the cues score at or above SDH_THRESHOLD. Weak samples keep the track. */
    public static boolean isSdhContent(List<String> cues) {
        return scoreCues(cues) >= SDH_THRESHOLD;
    }

    /** Parse an .srt body into per-cue text (lines joined with line feeds). */
    public static List<String> parseSrt(String text) {
        List<String> out = new ArrayList<String>();
        if (text == null) return out;
        String body = text.replace("\r\n", "\n").replace('\r', '\n');
        if (body.length() > 0 && body.charAt(0) == '\uFEFF') body = body.substring(1);
        String[] blocks = body.split("\n[ \\t\\u00A0]*\n");
        for (String block : blocks) {
            String[] lines = block.split("\n");
            StringBuilder cue = new StringBuilder();
            for (String raw : lines) {
                String line = raw.trim();
                if (line.isEmpty()) continue;
                if (cue.length() == 0 && line.matches("\\d{1,6}")) continue;
                if (TIMESTAMP_LINE.matcher(line).find()) continue;
                line = STYLE_TAG.matcher(line).replaceAll("");
                line = BLANKS.matcher(line).replaceAll(" ").trim();
                if (line.isEmpty()) continue;
                if (cue.length() > 0) cue.append('\n');
                cue.append(line);
            }
            if (cue.length() > 0) out.add(cue.toString());
        }
        return out;
    }

    /** Parse a WebVTT body into per-cue text. */
    public static List<String> parseVtt(String text) {
        List<String> out = new ArrayList<String>();
        if (text == null) return out;
        String body = text.replace("\r\n", "\n").replace('\r', '\n');
        if (body.length() > 0 && body.charAt(0) == '\uFEFF') body = body.substring(1);
        String[] blocks = body.split("\n[ \\t\\u00A0]*\n");
        boolean first = true;
        for (String block : blocks) {
            if (first) {
                first = false;
                if (block.trim().startsWith("WEBVTT")) continue;
            }
            String trimmed = block.trim();
            if (trimmed.startsWith("NOTE") || trimmed.startsWith("STYLE")
                    || trimmed.startsWith("REGION")) continue;
            String[] lines = block.split("\n");
            StringBuilder cue = new StringBuilder();
            for (String raw : lines) {
                String line = raw.trim();
                if (line.isEmpty()) continue;
                if (TIMESTAMP_LINE.matcher(line).find()) continue;
                line = STYLE_TAG.matcher(line).replaceAll("");
                line = BLANKS.matcher(line).replaceAll(" ").trim();
                if (line.isEmpty()) continue;
                if (cue.length() > 0) cue.append('\n');
                cue.append(line);
            }
            String built = cue.toString();
            if (built.matches("\\d{1,6}")) continue;
            if (!built.isEmpty()) out.add(built);
        }
        return out;
    }

    /** Pick the parser by url suffix, falling back to content sniffing. */
    public static List<String> parseSubtitleFile(String url, String text) {
        if (url != null && url.toLowerCase(Locale.US).contains(".vtt")) return parseVtt(text);
        if (text != null) {
            String head = text.length() > 200 ? text.substring(0, 200) : text;
            if (head.contains("WEBVTT")) return parseVtt(text);
        }
        return parseSrt(text);
    }

    /**
     * Strip the SDH parts from one cue text: sound tags in []/() (even split
     * across lines, nested, or fullwidth), music descriptions, leading
     * speaker labels (with parenthetical qualifiers), styling tags. Sign
     * translations, normal parentheticals, lyric words and unmatched markers
     * are kept. Returns null when nothing speakable remains and the cue
     * should be dropped.
     */
    public static String cleanCueText(String text) {
        if (text == null) return null;
        String cleaned = cleanHybrid(text);
        if (cleaned == null || cleaned.isEmpty()) return null;
        return cleaned;
    }

    // ------------------------------------------------------------------
    // Internal analysis helpers
    // ------------------------------------------------------------------

    private static String stripFormattingForAnalysis(String text) {
        String s = ASS_NEWLINE_PATTERN.matcher(text).replaceAll("\n");
        s = ASS_TAG_PATTERN.matcher(s).replaceAll("");
        s = ALL_HTML_TAG_PATTERN.matcher(s).replaceAll("");
        return s.replace("\r\n", "\n").replace('\r', '\n');
    }

    private static boolean hasSdhSignalInCue(String strippedCue) {
        String[] lines = strippedCue.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i].trim();
            if (line.isEmpty()) continue;
            if (hasSdhSignalInLine(line)) return true;
        }
        return false;
    }

    private static boolean hasSdhSignalInLine(String line) {
        if (!isWholeSignBlock(line) && hasChevronSignal(line)) return true;
        if (isMusicNoteLine(line)) return isMusicDescriptionLine(line);
        Matcher sqMatcher = SQUARE_BRACKET_PATTERN.matcher(line);
        while (sqMatcher.find()) {
            String inside = sqMatcher.group(1).trim();
            if (!isSignAnnotation(inside) && (isSdhBracketOrParenContent(inside, true)
                    || isAllCapsSpeakerName(inside))) return true;
        }
        Matcher fullMatcher = FULL_SQUARE_BRACKET_PATTERN.matcher(line);
        while (fullMatcher.find()) {
            String inside = fullMatcher.group(1).trim();
            if (!isSignAnnotation(inside) && isSdhBracketOrParenContent(inside, true)) return true;
        }
        Matcher parenMatcher = PAREN_PATTERN.matcher(line);
        while (parenMatcher.find()) {
            String inside = parenMatcher.group(1).trim();
            if (!isSignAnnotation(inside) && isSdhBracketOrParenContent(inside, false)) return true;
        }
        Matcher fullParenMatcher = FULL_PAREN_PATTERN.matcher(line);
        while (fullParenMatcher.find()) {
            String inside = fullParenMatcher.group(1).trim();
            if (!isSignAnnotation(inside) && isSdhBracketOrParenContent(inside, false)) return true;
        }
        if (hasSpeakerLabel(line)) return true;
        return false;
    }

    private static boolean isSignAnnotation(String inside) {
        return SIGN_PREFIX_PATTERN.matcher(inside).find();
    }

    /** True when the whole turn is one sign-translation block, which is kept verbatim. */
    private static boolean isWholeSignBlock(String s) {
        String t = ALL_HTML_TAG_PATTERN.matcher(s).replaceAll("").trim();
        if (t.length() < 2) return false;
        char first = t.charAt(0);
        char last = t.charAt(t.length() - 1);
        if (!((first == '[' && last == ']') || (first == '(' && last == ')')
                || (first == '\uFF3B' && last == '\uFF3D')
                || (first == '\uFF08' && last == '\uFF09'))) return false;
        return isSignAnnotation(t.substring(1, t.length() - 1).trim());
    }

    /** True when chevrons needing cleanup appear anywhere in the turn. */
    private static boolean hasChevronSignal(String line) {
        return LEADING_CHEVRON_PATTERN.matcher(line).find()
                || TRAILING_CHEVRON_PATTERN.matcher(line).find()
                || MIDLINE_CHEVRON_PATTERN.matcher(line).find();
    }

    private static boolean isSdhBracketOrParenContent(String inside, boolean isSquareBracket) {
        if (inside == null) return false;
        String trimmed = ALL_HTML_TAG_PATTERN.matcher(inside).replaceAll("").trim();
        if (trimmed.isEmpty()) return false;
        if (isSignAnnotation(trimmed)) return false;
        if (SDH_SOUND_KEYWORDS_PATTERN.matcher(trimmed).find()) return true;
        if (isSquareBracket) {
            String[] words = WHITESPACE_SPLIT_PATTERN.split(trimmed);
            if (words.length >= 1 && words.length <= 5) return true;
        }
        return false;
    }

    private static boolean isAllCapsSpeakerName(String text) {
        String trimmed = text.trim();
        if (trimmed.length() < 2 || trimmed.length() > 25) return false;
        if (NON_SPEAKER_PREFIX_PATTERN.matcher(trimmed).matches()) return false;
        boolean hasLetter = false;
        for (int i = 0; i < trimmed.length(); i++) {
            char c = trimmed.charAt(i);
            if (c >= 'a' && c <= 'z') return false;
            if (c >= 'A' && c <= 'Z') hasLetter = true;
        }
        return hasLetter;
    }

    private static boolean isLikelySpeakerLabel(String raw) {
        if (raw == null) return false;
        String label = PAREN_QUALIFIER_PATTERN.matcher(raw).replaceAll("").trim();
        if (label.isEmpty() || label.length() > 32) return false;
        if (label.contains("://")) return false;
        if (SPEAKER_BLOCKLIST.contains(label.toLowerCase(Locale.ROOT))) return false;
        boolean hasDigit = false;
        boolean hasLower = false;
        for (int i = 0; i < label.length(); i++) {
            char c = label.charAt(i);
            if (Character.isDigit(c)) hasDigit = true;
            if (Character.isLowerCase(c)) hasLower = true;
        }
        if (hasDigit && hasLower) return false;
        if (SPEAKER_ROLE_PATTERN.matcher(label).matches()) {
            return !label.isEmpty() && Character.isUpperCase(label.charAt(0));
        }
        if (isAllCapsSpeakerName(label)) return true;
        String letters = label.replaceAll("[^\\p{L}]", "");
        if (letters.isEmpty()) return false;
        String[] words = label.trim().split("\\s+");
        if (words.length < 1 || words.length > 3) return false;
        for (String word : words) {
            String[] parts = word.split("[-'\\u2019]");
            for (String part : parts) {
                if (part.isEmpty()) continue;
                String lp = part.replaceAll("[^\\p{L}]", "");
                if (lp.isEmpty()) continue;
                boolean allUp = lp.equals(lp.toUpperCase(Locale.ROOT));
                boolean title = Character.isUpperCase(lp.charAt(0));
                if (title && lp.length() > 1) {
                    title = lp.substring(1).equals(lp.substring(1).toLowerCase(Locale.ROOT));
                }
                if (!allUp && !title) return false;
            }
        }
        return true;
    }

    private static boolean hasSpeakerLabel(String line) {
        Matcher m = SPEAKER_COLON_PATTERN.matcher(line);
        if (m.find()) {
            String candidate = m.group(1).trim();
            if (isAllCapsSpeakerName(candidate)) {
                int absColon = m.start() + m.group().lastIndexOf(':');
                if (!digitColonDigit(line, absColon)) return true;
            }
        }
        Matcher b = SPEAKER_BRACKET_START_PATTERN.matcher(line);
        if (b.find()) {
            String candidate = b.group(1).trim();
            if (isAllCapsSpeakerName(candidate)) return true;
        }
        return false;
    }

    private static boolean digitColonDigit(String text, int colon) {
        if (colon <= 0 || colon + 1 >= text.length()) return false;
        if (!Character.isDigit(text.charAt(colon - 1))) return false;
        int k = colon + 1;
        while (k < text.length() && Character.isWhitespace(text.charAt(k))) k++;
        return k < text.length() && Character.isDigit(text.charAt(k));
    }

    private static boolean isMusicNoteLine(String plainLine) {
        String trimmed = plainLine.trim();
        if (trimmed.isEmpty()) return false;
        if (trimmed.startsWith("\u2014") || trimmed.startsWith("-")) {
            trimmed = trimmed.substring(1).trim();
        }
        return MUSIC_LINE_PATTERN.matcher(trimmed).matches();
    }

    /**
     * Distinguishes SDH music descriptions ("ominous music", "soft piano")
     * from song lyrics ("Never gonna give you up") inside music markers.
     */
    private static boolean isMusicDescriptionLine(String plainLine) {
        String inner = MUSIC_WRAPPER_STRIP_PATTERN.matcher(plainLine).replaceAll("").trim();
        if (inner.isEmpty()) return true;
        if ((inner.startsWith("[") && inner.endsWith("]"))
                || (inner.startsWith("(") && inner.endsWith(")"))) return true;
        if (LYRIC_PRONOUN_PATTERN.matcher(inner).find()) return false;
        String[] words = WHITESPACE_SPLIT_PATTERN.split(inner);
        return words.length <= 6 && MUSIC_DESCRIPTION_KEYWORDS_PATTERN.matcher(inner).find();
    }

    private static boolean isInlineMusicDescription(String body) {
        String norm = body.trim().toLowerCase(Locale.ROOT).replaceAll("\\s+", " ");
        norm = LEADING_MARKERS_PATTERN.matcher(norm).replaceAll("").trim();
        norm = TRAILING_MARKERS_PATTERN.matcher(norm).replaceAll("").trim();
        if (norm.isEmpty()) return true;
        if (DIALOGUE_WORD_PATTERN.matcher(norm).find()) return false;
        boolean hasMusicWord = MUSIC_WORD_PATTERN.matcher(norm).find();
        boolean quotedPlaying =
                QUOTED_TITLE_PATTERN.matcher(norm).find() && MUSIC_ACTION_PATTERN.matcher(norm).find();
        if (quotedPlaying) return true;
        return hasMusicWord && (norm.equals("music") || norm.equals("instrumental")
                || MUSIC_ACTION_PATTERN.matcher(norm).find() || MUSIC_MOOD_PATTERN.matcher(norm).find()
                || norm.split(" ").length <= 3);
    }

    // ------------------------------------------------------------------
    // Internal cleaning helpers
    // ------------------------------------------------------------------

    private static final class CleaningResult {
        final String text;
        final int turnCount;

        CleaningResult(String text, int turnCount) {
            this.text = text;
            this.turnCount = turnCount;
        }
    }

    private static String cleanHybrid(String cueText) {
        if (cueText == null || cueText.isEmpty()) return "";
        String prepared = ASS_NEWLINE_PATTERN.matcher(cueText).replaceAll("\n");
        prepared = ASS_TAG_PATTERN.matcher(prepared).replaceAll("");
        prepared = NON_ITALIC_HTML_TAG_PATTERN.matcher(prepared).replaceAll("");
        prepared = prepared.replace("\r\n", "\n").replace('\r', '\n');
        prepared = removeSdhBlocksWholeCue(prepared);
        String[] rawLines = prepared.split("\n");
        List<String> cleanedLines = new ArrayList<String>(rawLines.length);
        int totalDialogueTurns = 0;
        for (int i = 0; i < rawLines.length; i++) {
            String line = rawLines[i].trim();
            if (line.isEmpty()) continue;
            String plainLine = ALL_HTML_TAG_PATTERN.matcher(line).replaceAll("").trim();
            if (isMusicNoteLine(plainLine)) {
                if (isMusicDescriptionLine(plainLine)) continue;
                line = LEADING_MARKERS_PATTERN.matcher(line).replaceAll("");
                line = TRAILING_MARKERS_PATTERN.matcher(line).replaceAll("").trim();
                if (line.isEmpty()) continue;
            }
            CleaningResult result = cleanSingleLine(line);
            if (!result.text.isEmpty()) {
                cleanedLines.add(result.text);
                totalDialogueTurns += result.turnCount;
            }
        }
        if (cleanedLines.isEmpty()) return "";
        if (totalDialogueTurns <= 1 && cleanedLines.size() == 1) {
            String single = LEADING_HYPHEN_PATTERN.matcher(cleanedLines.get(0)).replaceFirst("$1").trim();
            single = tidyItalicsAndSpaces(single);
            return single;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < cleanedLines.size(); i++) {
            if (i > 0) sb.append('\n');
            sb.append(cleanedLines.get(i));
        }
        return sb.toString();
    }

    /**
     * Whole-cue SDH block pass: removes sound/action blocks in ASCII [],
     * fullwidth [] and () across line breaks, innermost first so nested
     * blocks collapse fully. Sign translations and normal parentheticals
     * survive.
     */
    private static String removeSdhBlocksWholeCue(String text) {
        String current = text;
        for (int pass = 0; pass < 10; pass++) {
            String next = removeSdhBlocksOnce(current);
            if (next.equals(current)) return current;
            current = next;
        }
        return current;
    }

    private static String removeSdhBlocksOnce(String text) {
        String out = removeSdhPatternOnce(text, SQUARE_BRACKET_PATTERN, true);
        out = removeSdhPatternOnce(out, FULL_SQUARE_BRACKET_PATTERN, true);
        out = removeSdhPatternOnce(out, PAREN_PATTERN, false);
        out = removeSdhPatternOnce(out, FULL_PAREN_PATTERN, false);
        return out;
    }

    private static String removeSdhPatternOnce(String text, Pattern pattern, boolean isSquare) {
        Matcher m = pattern.matcher(text);
        StringBuilder sb = new StringBuilder();
        int last = 0;
        boolean found = false;
        while (m.find()) {
            String inside = m.group(1).trim();
            if (!isSignAnnotation(inside) && isSdhBracketOrParenContent(inside, isSquare)) {
                int end = m.end();
                if (end < text.length() && (text.charAt(end) == ':' || text.charAt(end) == ';'
                        || text.charAt(end) == '\uFF1A')
                        && leadingIsBlankOrMarker(text, m.start())) {
                    end++;
                    while (end < text.length()
                            && (text.charAt(end) == ' ' || text.charAt(end) == '\t')) end++;
                }
                sb.append(text, last, m.start());
                sb.append(' ');
                last = end;
                found = true;
            }
        }
        if (!found) return text;
        sb.append(text, last, text.length());
        return sb.toString();
    }

    private static boolean leadingIsBlankOrMarker(String text, int start) {
        int lineStart = start;
        while (lineStart > 0 && text.charAt(lineStart - 1) != '\n'
                && text.charAt(lineStart - 1) != '\r') lineStart--;
        String prefix = text.substring(lineStart, start).trim();
        return prefix.isEmpty() || prefix.equals("-") || prefix.equals("\u2013")
                || prefix.equals("\u2014");
    }

    private static CleaningResult cleanSingleLine(String line) {
        String src = line;
        if (!isWholeSignBlock(src)) {
            src = LEADING_CHEVRON_PATTERN.matcher(src).replaceAll("$1");
            String[] parts = MIDLINE_CHEVRON_PATTERN.split(src);
            if (parts.length > 1) {
                List<String> cleanedTurns = new ArrayList<String>(parts.length);
                int totalTurns = 0;
                for (int i = 0; i < parts.length; i++) {
                    CleaningResult r = cleanDashTurns(parts[i].trim());
                    if (!r.text.isEmpty()) {
                        cleanedTurns.add(r.text);
                        totalTurns += r.turnCount;
                    }
                }
                if (cleanedTurns.isEmpty()) return new CleaningResult("", 0);
                if (cleanedTurns.size() == 1) return new CleaningResult(cleanedTurns.get(0), 1);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < cleanedTurns.size(); i++) {
                    if (i > 0) sb.append(" - ");
                    else sb.append("- ");
                    sb.append(cleanedTurns.get(i));
                }
                return new CleaningResult(sb.toString(), totalTurns);
            }
        }
        return cleanDashTurns(src);
    }

    private static CleaningResult cleanDashTurns(String src) {
        String plainForTurns = ALL_HTML_TAG_PATTERN.matcher(src).replaceAll("").trim();
        boolean startsWithHyphen = plainForTurns.startsWith("-")
                || plainForTurns.startsWith("\u2013") || plainForTurns.startsWith("\u2014");
        Matcher splitMatcher = INLINE_TURN_SPLIT_PATTERN.matcher(src);
        List<Integer> splitStarts = new ArrayList<Integer>(2);
        List<Integer> splitEnds = new ArrayList<Integer>(2);
        while (splitMatcher.find()) {
            splitStarts.add(Integer.valueOf(splitMatcher.start()));
            splitEnds.add(Integer.valueOf(splitMatcher.end()));
        }
        if (splitStarts.size() >= 2) {
            List<String> cleanedTurns = new ArrayList<String>(splitStarts.size());
            for (int i = 0; i < splitStarts.size(); i++) {
                int contentStart = splitEnds.get(i).intValue();
                int contentEnd =
                        (i + 1 < splitStarts.size()) ? splitStarts.get(i + 1).intValue() : src.length();
                String rawTurn = src.substring(contentStart, contentEnd).trim();
                String cleanedTurn = cleanTurnContent(rawTurn);
                if (!cleanedTurn.isEmpty()) cleanedTurns.add(cleanedTurn);
            }
            if (cleanedTurns.isEmpty()) return new CleaningResult("", 0);
            if (cleanedTurns.size() == 1) return new CleaningResult(cleanedTurns.get(0), 1);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < cleanedTurns.size(); i++) {
                if (i > 0) sb.append(" - ");
                else sb.append("- ");
                sb.append(cleanedTurns.get(i));
            }
            return new CleaningResult(sb.toString(), cleanedTurns.size());
        }
        String cleaned = cleanTurnContent(src);
        if (cleaned.isEmpty()) return new CleaningResult("", 0);
        if (startsWithHyphen && !cleaned.startsWith("-") && !cleaned.startsWith("<i>-")) {
            cleaned = "- " + cleaned;
        }
        return new CleaningResult(cleaned, 1);
    }

    private static String cleanTurnContent(String turn) {
        String s = turn.trim();
        if (!isWholeSignBlock(s)) {
            s = LEADING_CHEVRON_PATTERN.matcher(s).replaceAll("$1");
            s = TRAILING_CHEVRON_PATTERN.matcher(s).replaceAll("$1");
        }
        s = LEADING_HYPHEN_PATTERN.matcher(s).replaceFirst("$1");
        s = removeInlineMusicSegments(s);
        s = removeSdhBlocksOnce(s);
        s = removeSpeakerPrefix(s);
        s = tidyItalicsAndSpaces(s);
        String plain = ALL_HTML_TAG_PATTERN.matcher(s).replaceAll("").trim();
        if (plain.isEmpty() || plain.equals("-") || plain.equals("\u2013") || plain.equals("\u2014")) {
            return "";
        }
        return s;
    }

    private static String removeInlineMusicSegments(String turn) {
        Matcher m = PAIRED_NOTES_PATTERN.matcher(turn);
        StringBuffer sb = new StringBuffer();
        boolean found = false;
        while (m.find()) {
            String body = m.group(1) == null ? "" : m.group(1);
            if (isInlineMusicDescription(body)) {
                m.appendReplacement(sb, " ");
                found = true;
            } else {
                String kept = LEADING_MARKERS_PATTERN.matcher(m.group()).replaceAll("");
                kept = TRAILING_MARKERS_PATTERN.matcher(kept).replaceAll("").trim();
                m.appendReplacement(sb, Matcher.quoteReplacement(kept));
                if (!kept.equals(m.group())) found = true;
            }
        }
        if (!found) return turn;
        m.appendTail(sb);
        return sb.toString();
    }

    private static String removeSpeakerPrefix(String s) {
        String bracketed = SPEAKER_BRACKET_START_PATTERN.matcher(s).replaceFirst("");
        if (!bracketed.equals(s)) {
            String t = tidyItalicsAndSpaces(bracketed);
            if (ALL_HTML_TAG_PATTERN.matcher(t).replaceAll("").trim().isEmpty()) return "";
            s = bracketed;
        }
        Matcher colonMatcher = SPEAKER_COLON_PATTERN.matcher(s);
        if (colonMatcher.find()) {
            String speakerCandidate = colonMatcher.group(1).trim();
            int absColon = colonMatcher.start() + colonMatcher.group().lastIndexOf(':');
            if (!digitColonDigit(s, absColon) && isLikelySpeakerLabel(speakerCandidate)) {
                String matchedPrefix = colonMatcher.group();
                boolean hadOpeningItalic = matchedPrefix.toLowerCase(Locale.ROOT).contains("<i>");
                boolean hadClosingItalic = matchedPrefix.toLowerCase(Locale.ROOT).contains("</i>");
                String replacement = (hadOpeningItalic && !hadClosingItalic) ? "<i>" : "";
                s = s.substring(0, colonMatcher.start()) + replacement + s.substring(colonMatcher.end());
            }
        }
        String plain = ALL_HTML_TAG_PATTERN.matcher(s).replaceAll("").trim();
        if (plain.isEmpty()) return "";
        return s;
    }

    private static String tidyItalicsAndSpaces(String s) {
        String out = EMPTY_ITALIC_PATTERN.matcher(s).replaceAll("");
        out = OPEN_ITALIC_SPACE_PATTERN.matcher(out).replaceAll("<i>");
        out = CLOSE_ITALIC_SPACE_PATTERN.matcher(out).replaceAll("</i>");
        out = SPACE_BEFORE_PUNCT_PATTERN.matcher(out).replaceAll("$1");
        out = MULTI_SPACE_PATTERN.matcher(out).replaceAll(" ").trim();
        out = TRAILING_HYPHEN_PATTERN.matcher(out).replaceAll("").trim();
        out = EMPTY_ITALIC_PATTERN.matcher(out).replaceAll("").trim();
        return out;
    }
}
