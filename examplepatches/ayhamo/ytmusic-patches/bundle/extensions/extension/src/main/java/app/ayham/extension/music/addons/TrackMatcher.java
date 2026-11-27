package app.ayham.extension.music.addons;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Whether an addon's row is the same recording as a YouTube Music song: BitChord's TrackMatcher
 * (v1.9.2, web/app/src/data/match/trackMatcher.ts, GPL-3.0, by the BitChord authors) as the
 * extension ports it in src/addons/track-matcher.js, line for line. spec/addons/matcher-cases.json
 * holds for it as for BitChord (protocol.md §7), except our mashup rule ({@link #isMashup}, the
 * "(ours, mashups)" cases).
 *
 * Titles are taken apart into the words that carry identity (must agree), the markers of a
 * different take (remix, live, acoustic: must agree both ways) and packaging (a tie-break, never
 * a veto). Then the credit and the runtime are checked against that.
 */
public final class TrackMatcher {
    private TrackMatcher() {
    }

    /** One row from a catalogue: an addon's answer, as much of it as the matcher reads. */
    public static class Candidate {
        public String id;
        public String title;
        public String artist;
        public String album;
        public Double durationSec;
        public Boolean explicit;
    }

    /** The recording being looked for, as much of it as is known. */
    public static final class Target {
        public String title;
        public String artist;
        public String album;
        public String isrc;
        public Double durationSec;
        public Boolean isExplicit;
        public boolean isVideo;

        public Target copy() {
            Target t = new Target();
            t.title = title;
            t.artist = artist;
            t.album = album;
            t.isrc = isrc;
            t.durationSec = durationSec;
            t.isExplicit = isExplicit;
            t.isVideo = isVideo;
            return t;
        }
    }

    /** A title taken apart. */
    static final class Parsed {
        List<String> words;
        String core;
        LinkedHashSet<String> versions;
        LinkedHashSet<String> context;
    }

    // ---- weights ----

    private static final int BASE = 100;
    private static final int ARTIST_EXACT = 25;
    private static final int ARTIST_SHARED = 10;
    private static final int CREDITS_DISAGREE = -30;
    private static final int CREDIT_OVERRIDE_SEC = 2;
    private static final int DURATION_TIGHT = 40;
    private static final int DURATION_LOOSE = 15;
    private static final int ALBUM_EXACT = 35;
    private static final int EXPLICIT_EXACT = 20;
    private static final int CONTEXT_SHARED = 20;
    private static final int DURATION_TIGHT_SEC = 3;
    public static final int DURATION_LIMIT_SEC = 30;
    private static final int VIDEO_DURATION_LIMIT_SEC = 90;
    private static final int BRACKET_PASSES = 3;
    private static final int DASH_PASSES = 3;

    // ---- patterns: JS's \s, \b and . spelled out (Js), so Android's ICU reads them the same ----

    private static final String WS = Js.WS;
    private static final Pattern BRACKETED = Pattern.compile("[(\\[]([^()\\[\\]]*)[)\\]]");
    private static final Pattern DASH = Pattern.compile("[" + WS + "]+[-–—|]+[" + WS + "]+");
    private static final Pattern FEATURING = Pattern.compile(Js.B0 + "(feat|ft|featuring|with)" + Js.B1 + "[^\\n\\r\\u2028\\u2029]*");
    private static final Pattern WORD_SPLIT = Pattern.compile("[" + WS + ".·~〜]+");
    private static final Pattern NON_ALNUM = Pattern.compile("[^\\p{L}\\p{N}]");
    private static final Pattern LATIN = Pattern.compile("[a-z0-9]");
    private static final Pattern MASHUP_WORD = Pattern.compile("(?:^|[^\\p{L}\\p{N}])(?:mash[" + WS + "-]?ups?|medley)(?:$|[^\\p{L}\\p{N}])");
    private static final Pattern MASHUP_JOIN = Pattern.compile("[" + WS + "]+(?:x|×|vs\\.?|/)[" + WS + "]+");
    private static final String LATIN_QUERY_CHARS = "abcdefghijklmnopqrstuvwxyz0123456789 ";
    private static final Pattern CJK_OPEN = Pattern.compile("[「『【〈《〔［｛]");
    private static final Pattern CJK_CLOSE = Pattern.compile("[」』】〉》〕］｝]");
    /** Java's \p{Punct} (ASCII punctuation), the CJK dots and dashes. */
    private static final Pattern CJK_CORE_STRIP = Pattern.compile("[" + WS + "!-/:-@\\[-`{-~・～〜ー-]+");
    /** Hiragana, katakana, CJK unified ideographs, Hangul syllables. */
    private static final Pattern CJK = Pattern.compile("[぀-ゟ゠-ヿ一-鿿가-힯]");
    /** "\.?\b" after a word: the dot only when a word character follows it. */
    private static final String DOT_B = "(?:\\.(?=[" + Js.WORD + "])|" + Js.B1 + ")";
    private static final Pattern ARTIST_SEPARATORS = Pattern.compile("[" + WS + "]*(?:[,&/;·|、，×]"
            + "|" + Js.B0 + "and" + Js.B1 + "|" + Js.B0 + "x" + Js.B1 + "|" + Js.B0 + "vs" + DOT_B
            + "|" + Js.B0 + "feat" + DOT_B + "|" + Js.B0 + "ft" + DOT_B
            + "|" + Js.B0 + "featuring" + Js.B1 + "|" + Js.B0 + "with" + Js.B1 + ")[" + WS + "]*");

    private static Set<String> set(String... words) {
        return new HashSet<>(Arrays.asList(words));
    }

    private static final Set<String> VERSION_WORDS = set(
            "remix", "remixes", "rmx", "refix", "flip", "bootleg", "mashup", "medley",
            "live", "concert", "unplugged", "acoustic", "instrumental", "karaoke",
            "vocals", "vocal", "acapella", "acappella", "backing", "stems", "stem",
            "cover", "demo", "reprise", "remake", "rework", "extended", "edit",
            "version", "mix", "dub", "vip", "session", "sessions",
            "sped", "slowed", "reverb", "nightcore", "lofi", "orchestral", "symphonic",
            "part", "pt", "chapter",
            "カバー", "カラオケ", "リミックス", "ライブ",
            "アコースティック", "インスト", "バージョン",
            "歌ってみた", "踊ってみた", "弾いてみた",
            "翻唱", "现场", "混音",
            "커버", "라이브", "리믹스");
    private static final Set<String> TRAILING_TAKES = set("instrumental", "karaoke", "acapella", "acappella", "remix", "rmx", "nightcore");
    private static final Set<String> NOVOCAL_TAKES = set("instrumental", "karaoke", "acapella", "acappella", "backing", "stems", "stem");
    private static final Set<String> NEUTRAL_SEGMENTS = set(
            "albumversion", "originalversion", "originalmix", "singleversion",
            "radioversion", "radioedit", "stereoversion", "monoversion",
            "studioversion", "fullversion", "standardversion", "explicitversion",
            "deluxeversion", "originaltrack");
    private static final Set<String> NOISE_WORDS = set(
            "official", "video", "audio", "lyrics", "lyric", "lyrical", "visualizer",
            "song", "songs", "full", "music", "the", "and", "from", "feat", "ft",
            "featuring", "with", "new", "latest", "free", "download", "remaster",
            "remastered", "explicit", "clean", "bonus", "track", "deluxe", "original",
            "album", "single", "hd", "hq", "4k", "mp3");
    private static final Set<String> ALBUM_NOISE_WORDS = set(
            "album", "deluxe", "edition", "expanded", "remaster", "remastered",
            "version", "explicit", "clean", "bonus", "anniversary");
    private static final Set<String> TRAILING_NOISE = set(
            "song", "songs", "video", "audio", "lyrics", "lyric", "lyrical",
            "official", "full", "hd", "hq", "4k", "mp3", "ost", "soundtrack");
    private static final Set<String> JOINING_WORDS = set("and");

    // ---- small helpers ----

    private static String nz(String s) {
        return s == null ? "" : s;
    }

    private static String strip(String word) {
        return NON_ALNUM.matcher(word).replaceAll("");
    }

    private static List<String> wordsOf(String text) {
        List<String> out = new ArrayList<>();
        for (String w : Js.split(text, WORD_SPLIT)) {
            String s = strip(w);
            if (!s.isEmpty()) out.add(s);
        }
        return out;
    }

    private static boolean sameSet(Set<String> a, Set<String> b) {
        return a.size() == b.size() && b.containsAll(a);
    }

    private static Set<String> intersect(Set<String> a, Set<String> b) {
        Set<String> out = new LinkedHashSet<>();
        for (String x : a) if (b.contains(x)) out.add(x);
        return out;
    }

    private static boolean has(Pattern p, String s) {
        return p.matcher(s).find();
    }

    /** NFKC, lower case (never the device's locale: Turkish would make "LIVE" "lıve"), & as "and", CJK brackets as round ones. */
    public static String normalize(String text) {
        String t = Normalizer.normalize(nz(text), Normalizer.Form.NFKC).toLowerCase(Locale.ROOT).replace("&", " and ");
        t = CJK_OPEN.matcher(t).replaceAll("(");
        return CJK_CLOSE.matcher(t).replaceAll(")");
    }

    /** Latin letters without their accents, for comparing only ("Şımarık" / "Simarik"). Other scripts keep their marks. */
    public static String foldLatin(String text) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            i += Character.charCount(cp);
            if (cp == 0x0131) {
                b.append('i');
            } else if (cp < 0x80 || Character.UnicodeScript.of(cp) != Character.UnicodeScript.LATIN) {
                b.appendCodePoint(cp);
            } else {
                String d = Normalizer.normalize(new String(Character.toChars(cp)), Normalizer.Form.NFD);
                for (int k = 0; k < d.length(); ) {
                    int c = d.codePointAt(k);
                    k += Character.charCount(c);
                    if (Character.getType(c) != Character.NON_SPACING_MARK) b.appendCodePoint(c);
                }
            }
        }
        return b.toString();
    }

    // ---- asking ----

    /** What to put to a search box, best query first. */
    public static List<String> queries(Target target) {
        String title = searchableTitle(nz(target.title), nz(target.artist));
        if (Js.blank(title)) return new ArrayList<>();
        String artist = primaryArtist(nz(target.artist));
        List<String> out = new ArrayList<>();
        if (!artist.isEmpty()) out.add(title + " " + artist);
        out.add(title);
        String latin = Js.trim(romajiOf(title));
        String other = null;
        if (!latin.isEmpty() && !latin.equals(title) && onlyQueryChars(latin)) {
            other = latin;
        } else {
            for (String s : scriptMates(nz(target.title))) {
                if (!Js.blank(s) && !s.equals(title)) {
                    other = s;
                    break;
                }
            }
        }
        if (other != null && !other.isEmpty()) out.add(other);
        return new ArrayList<>(new LinkedHashSet<>(out));
    }

    private static boolean onlyQueryChars(String s) {
        for (int i = 0; i < s.length(); ) {
            int cp = s.codePointAt(i);
            i += Character.charCount(cp);
            if (LATIN_QUERY_CHARS.indexOf(cp) < 0) return false;
        }
        return true;
    }

    public static String searchableTitle(String title, String artist) {
        Parsed p = parseTitle(title, artist);
        List<String> all = new ArrayList<>(p.words);
        all.addAll(p.versions);
        return String.join(" ", all);
    }

    public static String primaryArtist(String artist) {
        return Js.trim(Js.split(normalize(artist), ARTIST_SEPARATORS).get(0));
    }

    public static boolean sharesArtist(String wanted, String got) {
        List<List<String>> want = artistNames(wanted), have = artistNames(got);
        if (want.isEmpty() || have.isEmpty()) return false;
        for (List<String> w : want) for (List<String> h : have) if (sameArtist(w, h)) return true;
        return false;
    }

    // ---- judging ----

    public static <T extends Candidate> T best(List<T> candidates, Target target) {
        List<T> r = ranked(candidates, target);
        return r.isEmpty() ? null : r.get(0);
    }

    /** The accepted rows, best first; ties keep the addon's order. */
    public static <T extends Candidate> List<T> ranked(List<T> candidates, Target target) {
        final List<T> scored = new ArrayList<>();
        final Map<T, Integer> values = new HashMap<>();
        for (T c : candidates) {
            Integer v = score(c, target);
            if (v == null) continue;
            scored.add(c);
            values.put(c, v);
        }
        List<T> credited = new ArrayList<>();
        for (T c : scored) if (artistScore(nz(target.artist), c.artist) != null) credited.add(c);
        List<T> out = new ArrayList<>(credited.isEmpty() ? scored : credited);
        // stable, as Kotlin's sortedByDescending
        Collections.sort(out, (a, b) -> Integer.compare(values.get(b), values.get(a)));
        return out;
    }

    /** How confident this is the same recording, or null when it is not one. */
    public static Integer score(Candidate candidate, Target target) {
        Parsed wanted = parseTitle(nz(target.title), nz(target.artist));
        Parsed got = parseTitle(nz(candidate.title), nz(candidate.artist));
        if (Js.blank(wanted.core) || Js.blank(got.core)) return null;
        // ours (protocol.md §7, mashups; not in BitChord a2d886e6): a mashup's title holds whole song
        // titles, so one of them inside it is another song; the whole title must match, and the credit must
        boolean mashup = isMashup(target.title, nz(target.artist));
        boolean isTitleMatch = wanted.core.equals(got.core)
                || romajiOf(wanted.core).equals(romajiOf(got.core))
                || isTranslationMatch(wanted, got)
                || (!mashup && !(Js.length(wanted.core) <= 3 || Js.length(got.core) <= 3)
                && (wanted.core.contains(got.core) || got.core.contains(wanted.core)));
        if (!isTitleMatch) return null;

        Set<String> albumMarks = albumVersionMarkers(candidate.album);
        Set<String> effective = new LinkedHashSet<>(got.versions);
        effective.addAll(intersect(albumMarks, NOVOCAL_TAKES));
        effective.addAll(intersect(albumMarks, wanted.versions));
        if (!sameSet(wanted.versions, effective)) return null;

        Integer credited = artistScore(nz(target.artist), candidate.artist);
        Integer duration = durationScore(target.durationSec, positive(candidate.durationSec), credited != null);
        if (duration == null) return null;
        Integer artist = credited != null ? credited
                : (!target.isVideo && !mashup && withinSeconds(candidate, target, CREDIT_OVERRIDE_SEC) ? Integer.valueOf(CREDITS_DISAGREE) : null);
        if (artist == null) return null;
        Integer explicit = explicitScore(target.isExplicit, candidate.explicit);
        if (explicit == null) return null;
        return BASE + artist + duration + albumScore(target.album, candidate.album) + explicit + contextScore(wanted, got);
    }

    public static boolean matches(Candidate candidate, String title, String artist, Double durationSec) {
        Target t = new Target();
        t.title = title;
        t.artist = artist;
        t.durationSec = durationSec;
        return score(candidate, t) != null;
    }

    /** TrackMatcher.hasConflictingAlbums. */
    public static boolean hasConflictingAlbums(List<? extends Candidate> candidates, Target target) {
        if (!Js.blank(target.album)) return false;
        List<Candidate> comparable = new ArrayList<>();
        for (Candidate c : candidates) if (target.durationSec == null || withinSeconds(c, target, DURATION_LIMIT_SEC)) comparable.add(c);
        if (target.durationSec != null && comparable.isEmpty()) return false;
        Set<String> keys = new HashSet<>();
        for (Candidate c : comparable) {
            String k = albumKey(c.album);
            if (k != null) keys.add(k);
        }
        return keys.size() > 1;
    }

    /** TrackMatcher.uniquelyMostCreditedCloseMatch. */
    public static <T extends Candidate> T uniquelyMostCreditedCloseMatch(List<T> candidates, Target target) {
        List<T> close = new ArrayList<>();
        for (T c : candidates) if (withinSeconds(c, target, DURATION_LIMIT_SEC)) close.add(c);
        if (close.size() < 2) return null;
        int top = Integer.MIN_VALUE;
        for (T c : close) top = Math.max(top, artistNames(c.artist).size());
        if (top < 2) return null;
        T winner = null;
        int n = 0;
        for (T c : close) {
            if (artistNames(c.artist).size() == top) {
                winner = c;
                n++;
            }
        }
        return n == 1 ? winner : null;
    }

    public static boolean withinSeconds(Candidate candidate, Target target, double seconds) {
        Double wanted = target.durationSec, got = positive(candidate.durationSec);
        if (wanted == null || got == null) return false;
        return Math.abs(wanted - got) <= seconds;
    }

    public static boolean isSevereMismatch(Double expectedSec, Double actualSec) {
        if (expectedSec == null || actualSec == null) return false;
        return Math.abs(actualSec - expectedSec) > DURATION_LIMIT_SEC;
    }

    /** An unstated runtime is null, not zero; a stated one is rounded to whole seconds. */
    private static Double positive(Double seconds) {
        return seconds != null && seconds > 0 ? Double.valueOf(Math.round(seconds)) : null;
    }

    // ---- title ----

    static Parsed parseTitle(String raw, String artist) {
        final LinkedHashSet<String> versions = new LinkedHashSet<>(), context = new LinkedHashSet<>();
        String text = normalize(raw);

        for (int pass = 0; pass < BRACKET_PASSES; pass++) {
            if (!has(BRACKETED, text)) continue;
            text = Js.replace(text, BRACKETED, m -> {
                classify(m.group(1), versions, context);
                return " ";
            });
        }
        int open = firstOf(text, '(', '[');
        if (open >= 0) {
            classify(text.substring(open), versions, context);
            text = text.substring(0, open);
        }

        for (int pass = 0; pass < DASH_PASSES; pass++) {
            Matcher dash = DASH.matcher(text);
            if (!dash.find()) continue;
            String head = text.substring(0, dash.start()), tail = text.substring(dash.end());
            if (isArtistName(head, artist)) {
                classify(head, versions, context);
                text = tail;
            } else if (!hasFilingLatin(head) && hasFilingLatin(tail) && !isArtistName(tail, artist)) {
                classify(head, versions, context);
                text = tail;
            } else {
                classify(tail, versions, context);
                text = head;
            }
        }

        text = FEATURING.matcher(text).replaceAll(" ");
        boolean containsCJK = has(CJK, text);

        List<String> words = new ArrayList<>();
        for (String w : Js.split(text, WORD_SPLIT)) {
            String s = strip(w);
            if (!s.isEmpty() && !JOINING_WORDS.contains(s)) words.add(s);
        }
        while (words.size() > 1) {
            String last = words.get(words.size() - 1);
            if (TRAILING_NOISE.contains(last)) {
                words.remove(words.size() - 1);
            } else if (TRAILING_TAKES.contains(last)) {
                versions.add(last);
                words.remove(words.size() - 1);
            } else {
                break;
            }
        }

        Parsed p = new Parsed();
        p.words = words;
        p.core = containsCJK ? CJK_CORE_STRIP.matcher(text).replaceAll("") : foldLatin(String.join("", words));
        p.versions = versions;
        p.context = context;
        return p;
    }

    private static int firstOf(String s, char a, char b) {
        for (int i = 0; i < s.length(); i++) if (s.charAt(i) == a || s.charAt(i) == b) return i;
        return -1;
    }

    private static void classify(String segment, Set<String> versions, Set<String> context) {
        List<String> words = wordsOf(segment);
        if (words.isEmpty()) return;
        if (NEUTRAL_SEGMENTS.contains(String.join("", words))) return;
        boolean marked = false;
        for (String w : words) {
            if (VERSION_WORDS.contains(w)) {
                versions.add(w);
                marked = true;
            }
        }
        if (marked) return;
        // a single CJK syllable is a whole title: the length gate is for Latin glue words
        for (String w : words) if ((Js.length(w) > 2 || has(CJK, w)) && !NOISE_WORDS.contains(w)) context.add(w);
    }

    /**
     * Whether a bracketed aside is the same title in another script: one core CJK-only, the
     * other Latin, and the other's aside that core in full.
     */
    static boolean isTranslationMatch(Parsed wanted, Parsed got) {
        boolean wantedCJK = has(CJK, wanted.core) && !hasFilingLatin(wanted.core);
        boolean gotCJK = has(CJK, got.core) && !hasFilingLatin(got.core);
        boolean wantedLatin = hasFilingLatin(wanted.core), gotLatin = hasFilingLatin(got.core);
        if ((wantedCJK && gotLatin) || (gotCJK && wantedLatin)) {
            if (foldLatin(String.join("", wanted.context)).equals(got.core)) return true;
            if (foldLatin(String.join("", got.context)).equals(wanted.core)) return true;
        }
        return false;
    }

    /**
     * Ours (protocol.md §7, mashups): a mashup or medley, by a "mashup" / "medley" word anywhere, or
     * by two or more titles joined with " x ", " vs ", " / " or " × " in one part of the title
     * (brackets and dash parts apart). A side that is the credited artist makes it a credit
     * ("Sigala x Ella Eyre - Came Here For Love"), not a mashup.
     */
    static boolean isMashup(String raw, String artist) {
        String text = normalize(nz(raw));
        if (has(MASHUP_WORD, text)) return true;
        // nested brackets ("(a (b) c)") go from the inside out: one pass would leave a half bracket in a side
        String bare = text;
        for (int pass = 0; pass < BRACKET_PASSES; pass++) bare = BRACKETED.matcher(bare).replaceAll(" ");
        for (String part : Js.split(bare, DASH)) {
            if (isArtistName(part, artist)) continue;
            List<String> sides = new ArrayList<>();
            for (String side : Js.split(part, MASHUP_JOIN)) {
                String t = side.trim();
                if (!wordsOf(t).isEmpty()) sides.add(t);
            }
            if (sides.size() < 2) continue;
            boolean credit = false;
            for (String side : sides) if (isArtistName(side, artist)) credit = true;
            if (!credit) return true;
        }
        return false;
    }

    private static boolean isArtistName(String text, String artist) {
        if (Js.blank(artist)) return false;
        List<String> words = wordsOf(text);
        if (words.isEmpty()) return false;
        Set<String> credited = new HashSet<>(wordsOf(normalize(artist)));
        return credited.containsAll(words);
    }

    static boolean hasFilingLatin(String text) {
        for (String w : wordsOf(text)) {
            if (has(LATIN, w) && !VERSION_WORDS.contains(w) && !NOISE_WORDS.contains(w)
                    && !TRAILING_NOISE.contains(w) && !JOINING_WORDS.contains(w)) return true;
        }
        return false;
    }

    static List<String> scriptMates(String raw) {
        String text = normalize(raw);
        Matcher dash = DASH.matcher(text);
        List<String> none = new ArrayList<>();
        if (!dash.find()) return none;
        String head = searchableTitle(text.substring(0, dash.start()), "");
        String tail = searchableTitle(text.substring(dash.end()), "");
        if (Js.blank(head) || Js.blank(tail) || head.equals(tail)) return none;
        return romajiOf(head).equals(tail) || romajiOf(tail).equals(head) ? Arrays.asList(head, tail) : none;
    }

    // ---- romaji ----

    private static final Map<Character, String> KANA_ROMAJI = new HashMap<>();
    private static final Map<Character, String> SMALL_Y = new HashMap<>();
    private static final Map<Character, String> SMALL_V = new HashMap<>();
    private static final String[][] CONS_OVERRIDES = {
            {"shi", "sh"}, {"chi", "ch"}, {"tsu", "ts"}, {"fu", "f"}, {"ji", "j"}, {"zu", "z"},
    };

    private static void row(String consonant, String kana) {
        String vowels = "aiueo";
        for (int i = 0; i < kana.length(); i++) KANA_ROMAJI.put(kana.charAt(i), consonant + vowels.charAt(i));
    }

    static {
        row("", "あいうえお");
        row("k", "かきくけこ");
        row("g", "がぎぐげご");
        row("s", "さしすせそ");
        KANA_ROMAJI.put('し', "shi");
        row("z", "ざじずぜぞ");
        KANA_ROMAJI.put('じ', "ji");
        row("t", "たちつてと");
        KANA_ROMAJI.put('ち', "chi");
        KANA_ROMAJI.put('つ', "tsu");
        row("d", "だぢづでど");
        KANA_ROMAJI.put('ぢ', "ji");
        KANA_ROMAJI.put('づ', "zu");
        row("n", "なにぬねの");
        row("h", "はひふへほ");
        KANA_ROMAJI.put('ふ', "fu");
        row("b", "ばびぶべぼ");
        row("p", "ぱぴぷぺぽ");
        row("m", "まみむめも");
        KANA_ROMAJI.put('や', "ya");
        KANA_ROMAJI.put('ゆ', "yu");
        KANA_ROMAJI.put('よ', "yo");
        row("r", "らりるれろ");
        KANA_ROMAJI.put('わ', "wa");
        KANA_ROMAJI.put('を', "wo");
        KANA_ROMAJI.put('ん', "n");
        KANA_ROMAJI.put('ゔ', "vu");
        String small = "ぁぃぅぇぉゃゅょゎゕゖ";
        String[] smallRoma = {"a", "i", "u", "e", "o", "ya", "yu", "yo", "wa", "ka", "ke"};
        for (int i = 0; i < small.length(); i++) KANA_ROMAJI.put(small.charAt(i), smallRoma[i]);
        SMALL_Y.put('ゃ', "ya");
        SMALL_Y.put('ゅ', "yu");
        SMALL_Y.put('ょ', "yo");
        SMALL_V.put('ぁ', "a");
        SMALL_V.put('ぃ', "i");
        SMALL_V.put('ぅ', "u");
        SMALL_V.put('ぇ', "e");
        SMALL_V.put('ぉ', "o");
    }

    /** Katakana to hiragana ('ァ'..'ヶ' minus 0x60). */
    private static char toHiragana(char c) {
        return c >= 0x30A1 && c <= 0x30F6 ? (char) (c - 0x60) : c;
    }

    private static final class Romaji {
        final StringBuilder out = new StringBuilder();
        boolean geminate;
        Character lastVowel;

        void emit(String roma) {
            String r = roma;
            if (geminate) {
                geminate = false;
                r = r.startsWith("ch") ? "t" + r : r.startsWith("sh") ? "s" + r : r.startsWith("ts") ? "t" + r : r.charAt(0) + r;
            }
            out.append(r);
            lastVowel = null;
            for (int i = r.length() - 1; i >= 0; i--) {
                if ("aeiou".indexOf(r.charAt(i)) >= 0) {
                    lastVowel = r.charAt(i);
                    break;
                }
            }
        }
    }

    public static String romajiOf(String text) {
        Romaji o = new Romaji();
        int i = 0;
        while (i < text.length()) {
            char c = toHiragana(text.charAt(i));
            if (c == 'っ') {
                o.geminate = true;
                i++;
            } else if (c == 'ー') {
                if (o.lastVowel != null) o.out.append(o.lastVowel.charValue());
                i++;
            } else if (c == 'ん') {
                String next = i + 1 < text.length() ? KANA_ROMAJI.get(toHiragana(text.charAt(i + 1))) : null;
                char peek = next != null && !next.isEmpty() ? next.charAt(0) : 0;
                o.emit(peek == 'b' || peek == 'm' || peek == 'p' ? "m" : "n");
                i++;
            } else {
                String base = KANA_ROMAJI.get(c);
                if (base == null) {
                    o.out.append(text.charAt(i));
                    o.lastVowel = null;
                    o.geminate = false;
                    i++;
                } else {
                    String small = null;
                    if (i + 1 < text.length()) {
                        char next = toHiragana(text.charAt(i + 1));
                        small = SMALL_Y.containsKey(next) ? SMALL_Y.get(next) : SMALL_V.get(next);
                    }
                    if (small != null) {
                        String cons = null;
                        for (String[] ov : CONS_OVERRIDES) {
                            if (base.startsWith(ov[0])) {
                                cons = ov[1];
                                break;
                            }
                        }
                        if (cons == null) cons = base.substring(0, base.length() - 1);
                        String glide = cons.equals("sh") || cons.equals("ch") || cons.equals("j")
                                ? (small.startsWith("y") ? small.substring(1) : small) : small;
                        o.emit(cons + glide);
                        i += 2;
                    } else {
                        o.emit(base);
                        i++;
                    }
                }
            }
        }
        return o.out.toString();
    }

    // ---- artist ----

    private static Integer artistScore(String wanted, String got) {
        List<List<String>> want = artistNames(wanted), have = artistNames(got);
        if (want.isEmpty() || have.isEmpty()) return 0;
        if (!sharesArtist(wanted, got)) return null;
        return key(want).equals(key(have)) ? ARTIST_EXACT : ARTIST_SHARED;
    }

    /** The names joined, sorted in JS's default (UTF-16) order. */
    private static String key(List<List<String>> names) {
        List<String> joined = new ArrayList<>();
        for (List<String> n : names) joined.add(String.join(" ", n));
        Collections.sort(joined);
        return String.join("|", joined);
    }

    /** The credited artists, each as its own list of words, de-duplicated in first-seen order. */
    public static List<List<String>> artistNames(String value) {
        Map<String, List<String>> seen = new LinkedHashMap<>();
        for (String name : Js.split(foldLatin(normalize(nz(value))), ARTIST_SEPARATORS)) {
            List<String> words = new ArrayList<>();
            for (String w : Js.split(name, WORD_SPLIT)) {
                String s = strip(w);
                if (Js.length(s) > 1) words.add(s);
            }
            if (!words.isEmpty()) seen.put(String.join(" ", words), words);
        }
        return new ArrayList<>(seen.values());
    }

    private static boolean sameArtist(List<String> a, List<String> b) {
        return runOf(a, b) || runOf(b, a);
    }

    private static boolean runOf(List<String> outer, List<String> inner) {
        if (inner.isEmpty() || inner.size() > outer.size()) return false;
        for (int at = 0; at <= outer.size() - inner.size(); at++) {
            boolean all = true;
            for (int i = 0; i < inner.size() && all; i++) all = outer.get(at + i).equals(inner.get(i));
            if (all) return true;
        }
        return false;
    }

    // ---- duration, album, explicit, context ----

    private static Integer durationScore(Double wanted, Double got, boolean allowVideoDrift) {
        if (wanted == null || got == null) return 0;
        double drift = Math.abs(wanted - got);
        if (drift > DURATION_LIMIT_SEC && allowVideoDrift && drift <= VIDEO_DURATION_LIMIT_SEC) return 0;
        if (drift > DURATION_LIMIT_SEC) return null;
        return drift <= DURATION_TIGHT_SEC ? DURATION_TIGHT : DURATION_LOOSE;
    }

    private static int albumScore(String wanted, String got) {
        String want = albumKey(wanted), have = albumKey(got);
        return want != null && have != null && want.equals(have) ? ALBUM_EXACT : 0;
    }

    private static Integer explicitScore(Boolean wanted, Boolean got) {
        if (wanted == null || got == null) return 0;
        return !wanted.equals(got) ? null : EXPLICIT_EXACT;
    }

    public static Set<String> albumVersionMarkers(String album) {
        return !Js.blank(album) ? parseTitle(album, "").versions : new LinkedHashSet<String>();
    }

    private static String albumKey(String value) {
        String text = Js.trim(normalize(nz(value)));
        if (text.isEmpty()) return null;
        for (int pass = 0; pass < BRACKET_PASSES; pass++) text = BRACKETED.matcher(text).replaceAll(" ");
        StringBuilder key = new StringBuilder();
        for (String w : Js.split(text, WORD_SPLIT)) {
            String s = strip(w);
            if (!s.isEmpty() && !ALBUM_NOISE_WORDS.contains(s)) key.append(s);
        }
        return key.length() > 0 ? key.toString() : null;
    }

    private static int contextScore(Parsed wanted, Parsed got) {
        for (String w : wanted.context) if (got.context.contains(w)) return CONTEXT_SHARED;
        return 0;
    }
}
