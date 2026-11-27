package app.jimaku.extension.menu;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.jimaku.extension.Languages;
import app.jimaku.extension.gateway.Lookup;
import app.jimaku.extension.shared.Wording;

/**
 * What Jimaku's subtitle menu lists for a video, worked out from what is known about it: a port of
 * the extension's {@code lib/menu-model.ts}, which runs its shared cases in {@code menu-model.json}.
 * Plain Java, so every scenario of the menu is a JVM test; {@link Menu} draws it.
 *
 * <p>The menu is one list under a Premium switch. Signed in, the switch filters it: on, the Premium
 * versions; off, the Standard ones. Signed out there are no minutes to spend, so the switch waits
 * for sign-in and the list holds what costs nothing: Standard for every language, and Premium where
 * it is made already or only needs a free translation of the cached transcript.
 *
 * <p>Captions the creator uploaded with the video stand apart from both: free, read as they are from
 * YouTube, listed in either mode as "By the creator". In the preferred language they take its row,
 * in place of Jimaku's own versions; in another, its row in Other languages.
 */
public final class MenuModel {
    private static final String MINUS = "−";
    private static final Version[] MADE = {Version.PREMIUM, Version.STANDARD};

    private MenuModel() {
    }

    /** Whole minutes, rounded down, as the balance is shown. */
    public static long minutesLeft(double seconds) {
        return (long) Math.floor(seconds / 60);
    }

    /** Minutes that a future purchase must cover, rounded up so even one owed second is visible. */
    public static long minutesOwed(double seconds) {
        return Math.max(0, (long) Math.ceil(-seconds / 60));
    }

    /** A video's cost in whole minutes, rounded up: a 14-minute video costs 14, one second more costs 15. */
    public static long minutesFor(double seconds) {
        return Math.max(1, (long) Math.ceil(seconds / 60));
    }

    public static boolean signedIn(MenuInput input) {
        return input.me != null && input.me.signedIn;
    }

    /** Standard works from the video's YouTube captions, automatic or uploaded. Until the player has said, it is taken to have them. */
    public static boolean captionsAllowed(MenuInput input) {
        return !hasNoTrack(input);
    }

    private static boolean hasNoTrack(MenuInput input) {
        return input.trackKnown && input.track == null;
    }

    /** The minutes costs are worked out from, in seconds, or null while they aren't known. */
    private static Double balance(MenuInput input) {
        return input.minutesKnown && input.me != null ? input.me.balance : null;
    }

    /**
     * The mode the Premium switch reads. Once the viewer has flipped it, theirs, on every video. Until
     * then each video opens in the mode a press would use: Premium when its transcript is cached, the
     * minutes cover it, or it has no YouTube captions; Standard otherwise.
     */
    public static Version effectiveMode(MenuInput input) {
        if (input.mode != null) return input.mode;
        if (input.lookup != null || hasNoTrack(input)) return Version.PREMIUM;
        double seconds = input.me != null ? input.me.balance : 0;
        return seconds > 0 && (input.duration == null || input.duration <= seconds) ? Version.PREMIUM : Version.STANDARD;
    }

    /** How {@code subtitle}, Premium or Standard, would be made for this video right now. */
    public static Plan plan(MenuInput input, Subtitle subtitle) {
        if (subtitle.version == Version.UPLOADED) throw new IllegalArgumentException("Uploaded captions aren't made: " + subtitle);
        // Neither version: the processor has no whole stream to download, and its captions are still being written.
        if (input.live) return Plan.none(Plan.Why.LIVE);
        if (subtitle.version == Version.STANDARD) return captionsAllowed(input) ? Plan.captions() : Plan.none(Plan.Why.NO_CAPTIONS);
        if (input.lookup != null) return Plan.translate();
        if (!signedIn(input)) return Plan.none(Plan.Why.SIGN_IN);
        Double minutes = balance(input);
        if (minutes == null) return Plan.premium(null);
        if (minutes <= 0) return Plan.none(Plan.Why.NO_MINUTES);
        if (input.duration == null) return Plan.premium(null);
        if (input.duration > minutes) return Plan.none(Plan.Why.TOO_LONG);
        return Plan.premium(minutesFor(input.duration));
    }

    /**
     * Every version of subtitles that exists for this video: in the shared cache, on this device, or
     * uploaded with it. A transcript in two languages isn't its own language's subtitles: those are a
     * translation of it.
     */
    public static List<Subtitle> available(MenuInput input) {
        List<Subtitle> found = new ArrayList<>();
        if (input.lookup != null) {
            for (String lang : input.lookup.cachedLanguages()) found.add(new Subtitle(lang, Version.PREMIUM));
        }
        for (String lang : new LinkedHashSet<>(input.kept)) found.add(new Subtitle(lang, Version.STANDARD));
        for (String lang : new LinkedHashSet<>(input.uploaded)) found.add(new Subtitle(lang, Version.UPLOADED));
        return found;
    }

    public static boolean has(MenuInput input, Subtitle subtitle) {
        return available(input).contains(subtitle);
    }

    /** Whether the video has captions uploaded in {@code lang}. */
    private static boolean uploadedIn(MenuInput input, String lang) {
        return input.uploaded.contains(lang);
    }

    /**
     * The language a version's original caption is in, where one exists: the transcript's, the kept
     * captions', or for uploaded captions the uploaded track Standard translates from.
     */
    public static String originalOf(MenuInput input, Version version) {
        return switch (version) {
            case UPLOADED -> input.track != null && uploadedIn(input, input.track) ? input.track : null;
            case PREMIUM -> input.lookup != null ? input.lookup.original : null;
            case STANDARD -> input.standardOriginal;
        };
    }

    /** The language the video is in as far as {@code version} knows: its original, or else the caption track's. */
    private static String spoken(MenuInput input, Version version) {
        String original = originalOf(input, version);
        return original != null ? original : input.track;
    }

    /**
     * The version of {@code lang} shown without being asked for, as when subtitles stay on across
     * videos: captions uploaded in it first; then, signed in, the one in the switch's mode; signed
     * out, whichever exists, Premium first.
     */
    public static Subtitle pick(MenuInput input, String lang) {
        if (uploadedIn(input, lang)) return new Subtitle(lang, Version.UPLOADED);
        Version[] versions = signedIn(input) ? new Version[]{effectiveMode(input)} : MADE;
        for (Version version : versions) {
            Subtitle subtitle = new Subtitle(lang, version);
            if (has(input, subtitle)) return subtitle;
        }
        return null;
    }

    private static String t(MenuInput input, String key, String... substitutions) {
        return Wording.t(input.locale, key, substitutions);
    }

    /** What an unmade row reads: what a press would cost, or what is missing. */
    private static String cost(MenuInput input, Plan made) {
        return switch (made.method) {
            case CAPTIONS, TRANSLATE -> t(input, Wording.MENU_FREE);
            // The length is known within a second, so the row waits for it blank; minutes that can't be read are named.
            case PREMIUM -> made.minutes != null ? t(input, Wording.MENU_COST_MINUTES, String.valueOf(made.minutes))
                    : balance(input) == null ? t(input, Wording.MENU_USES_MINUTES) : "";
            case NONE -> made.why == Plan.Why.NO_MINUTES ? t(input, Wording.MENU_NO_MINUTES)
                    : made.why == Plan.Why.TOO_LONG ? t(input, Wording.MENU_TOO_LONG, String.valueOf(minutesLeft(orZero(balance(input))))) : "";
        };
    }

    private static double orZero(Double value) {
        return value != null ? value : 0;
    }

    /** An unmade row: what a press asks first, and then does. */
    private static LanguageRow unmade(MenuInput input, Subtitle subtitle, String name, String value, Plan made) {
        return switch (made.method) {
            case CAPTIONS -> new LanguageRow(subtitle, name, value, false, null, LanguageRow.Press.START);
            case TRANSLATE -> new LanguageRow(subtitle, name, value, false,
                    new LanguageRow.Ask(t(input, Wording.ASK_GENERATE), t(input, Wording.ASK_YES_GENERATE)), LanguageRow.Press.START);
            case PREMIUM -> new LanguageRow(subtitle, name, value, false, new LanguageRow.Ask(made.minutes == null
                    ? t(input, Wording.ASK_USE) : t(input, Wording.ASK_USE_MINUTES, String.valueOf(made.minutes)),
                    t(input, Wording.ASK_YES_GENERATE)), LanguageRow.Press.START);
            case NONE -> made.why == Plan.Why.NO_MINUTES || made.why == Plan.Why.TOO_LONG
                    ? new LanguageRow(subtitle, name, value, false,
                    new LanguageRow.Ask(t(input, Wording.ASK_BUY), t(input, Wording.ACTION_BUY_MINUTES)), LanguageRow.Press.BUY)
                    : new LanguageRow(subtitle, name, value, false, null, LanguageRow.Press.BUSY);
        };
    }

    /** One row: what it reads and what a press does, for a version that is on screen, being made, made, or still to make. */
    private static LanguageRow row(MenuInput input, Subtitle subtitle, boolean main) {
        String name = Languages.name(subtitle.lang);
        // Uploaded captions are there to show, and say so in place of a cost.
        if (subtitle.version == Version.UPLOADED) {
            boolean checked = Subtitle.same(input.showing, subtitle);
            return new LanguageRow(subtitle, name, t(input, Wording.MENU_UPLOADED), checked, null,
                    checked ? LanguageRow.Press.HIDE : LanguageRow.Press.SHOW);
        }
        if (beingMade(input, subtitle)) {
            return new LanguageRow(subtitle, name, input.working.step, true,
                    new LanguageRow.Ask(t(input, Wording.ASK_STOP_ROW), t(input, Wording.ACTION_STOP)), LanguageRow.Press.STOP);
        }
        if (Subtitle.same(input.showing, subtitle)) return new LanguageRow(subtitle, name, "", true, null, LanguageRow.Press.HIDE);
        if (has(input, subtitle)) return new LanguageRow(subtitle, name, "", false, null, LanguageRow.Press.SHOW);
        Plan made = plan(input, subtitle);
        // Other languages says the cost once, in its caption; signed out, where its rows differ, each says Free.
        String value = main ? cost(input, made) : !signedIn(input) && input.lookup != null ? t(input, Wording.MENU_FREE) : "";
        // One job at a time: while another is made, a press only says so.
        if (input.working != null) return new LanguageRow(subtitle, name, value, false, null, LanguageRow.Press.BUSY);
        return unmade(input, subtitle, name, value, made);
    }

    /** Whether {@code subtitle} can be listed as something to make. */
    private static boolean makeable(MenuInput input, Subtitle subtitle) {
        Plan made = plan(input, subtitle);
        return made.method != Plan.Method.NONE || made.why == Plan.Why.NO_MINUTES || made.why == Plan.Why.TOO_LONG;
    }

    private static boolean beingMade(MenuInput input, Subtitle subtitle) {
        return input.working != null && Subtitle.same(input.working.subtitle, subtitle);
    }

    /** The versions a signed-out viewer is offered in {@code lang}: Premium where it costs nothing, and Standard. */
    private static List<Subtitle> offered(MenuInput input, String lang) {
        List<Subtitle> offered = new ArrayList<>();
        for (Version version : MADE) {
            Subtitle subtitle = new Subtitle(lang, version);
            if (has(input, subtitle) || beingMade(input, subtitle) || makeable(input, subtitle)) offered.add(subtitle);
        }
        return offered;
    }

    /** Whether {@code subtitle} is the video's own language in that version: Original caption shows it, so it is no row of its own. */
    private static boolean isOriginal(MenuInput input, Subtitle subtitle) {
        return !subtitle.lang.equals(input.preferred) && subtitle.lang.equals(spoken(input, subtitle.version));
    }

    /** Names compared as the extension's {@code Intl.Collator} with base sensitivity compares them. */
    private static Collator collator(MenuInput input) {
        Collator collator = Collator.getInstance(input.locale);
        collator.setStrength(Collator.PRIMARY);
        return collator;
    }

    /**
     * The main list's entries: the preferred language first, then by name, Premium before Standard. It
     * holds every version that is made, on screen or being made, and always a row for the preferred
     * language where one can be made. Captions uploaded in the preferred language take its row, in
     * place of Jimaku's versions of it; those in other languages wait in Other languages. A press never
     * reorders it.
     */
    private static List<Subtitle> mainEntries(MenuInput input) {
        List<Subtitle> shown = new ArrayList<>();
        if (input.showing != null) shown.add(input.showing);
        if (input.working != null) shown.add(input.working.subtitle);
        boolean uploaded = uploadedIn(input, input.preferred);
        List<Subtitle> made = new ArrayList<>();
        for (Subtitle subtitle : available(input)) {
            if (isOriginal(input, subtitle) || subtitle.version == Version.UPLOADED) continue;
            if (uploaded && subtitle.lang.equals(input.preferred)) continue;
            made.add(subtitle);
        }
        List<Subtitle> entries = new ArrayList<>();
        if (uploaded) {
            Version mode = signedIn(input) ? effectiveMode(input) : null;
            entries.add(new Subtitle(input.preferred, Version.UPLOADED));
            for (Subtitle subtitle : made) if (mode == null || subtitle.version == mode) entries.add(subtitle);
        } else if (signedIn(input)) {
            Version mode = effectiveMode(input);
            Subtitle preferred = new Subtitle(input.preferred, mode);
            if (has(input, preferred) || makeable(input, preferred)) entries.add(preferred);
            for (Subtitle subtitle : made) if (subtitle.version == mode) entries.add(subtitle);
        } else {
            List<Subtitle> preferred = offered(input, input.preferred);
            List<Subtitle> there = new ArrayList<>();
            for (Subtitle subtitle : preferred) if (has(input, subtitle) || shown.contains(subtitle)) there.add(subtitle);
            entries.addAll(!there.isEmpty() ? there : preferred.subList(0, Math.min(1, preferred.size())));
            entries.addAll(made);
        }
        entries.addAll(shown);
        List<Subtitle> unique = new ArrayList<>(new LinkedHashSet<>(entries));
        Collator collator = collator(input);
        unique.sort(Comparator.<Subtitle>comparingInt(subtitle -> subtitle.lang.equals(input.preferred) ? 0 : 1)
                .thenComparing(subtitle -> Languages.name(subtitle.lang), collator)
                .thenComparing(subtitle -> subtitle.version));
        return unique;
    }

    /**
     * Other languages' entries: for each language the main list doesn't settle, the captions uploaded
     * in it, or else the one version a press would make.
     */
    private static List<Subtitle> otherEntries(MenuInput input) {
        List<Subtitle> main = mainEntries(input);
        Set<String> mainLanguages = new HashSet<>();
        for (Subtitle subtitle : main) mainLanguages.add(subtitle.lang);
        List<Subtitle> entries = new ArrayList<>();
        for (String lang : Languages.codes()) {
            // Signed in, a language in the main list isn't repeated.
            if (signedIn(input) && mainLanguages.contains(lang)) continue;
            List<Subtitle> candidates = uploadedIn(input, lang) ? Collections.singletonList(new Subtitle(lang, Version.UPLOADED))
                    : signedIn(input) ? Collections.singletonList(new Subtitle(lang, effectiveMode(input))) : offered(input, lang);
            for (Subtitle subtitle : candidates) {
                if (main.contains(subtitle) || isOriginal(input, subtitle)) continue;
                if (subtitle.version != Version.UPLOADED && (has(input, subtitle) || !makeable(input, subtitle))) continue;
                entries.add(subtitle);
                break;
            }
        }
        return entries;
    }

    private static String premiumValue(MenuInput input) {
        if (!signedIn(input)) return "";
        if (effectiveMode(input) == Version.STANDARD) return t(input, Wording.MENU_STANDARD_FREE);
        // The last minutes seen stay, even where they can't be read just now.
        return minutesText(input.locale, input.me.balance);
    }

    /** The minutes beside the switch and in Account: "300 min left", or "−5 min left" where they are overspent. */
    public static String minutesText(Locale locale, double seconds) {
        return Wording.t(locale, Wording.MENU_MINUTES_LEFT, seconds < 0 ? MINUS + minutesOwed(seconds) : String.valueOf(minutesLeft(seconds)));
    }

    public static MainPanel mainPanel(MenuInput input) {
        List<LanguageRow> rows = new ArrayList<>();
        for (Subtitle subtitle : mainEntries(input)) rows.add(row(input, subtitle, true));
        boolean other = !otherEntries(input).isEmpty();
        String note = rows.isEmpty() && !other ? t(input, input.live ? Wording.MENU_LIVE : Wording.MENU_NO_CAPTIONS) : null;
        return new MainPanel(signedIn(input), signedIn(input) && effectiveMode(input) == Version.PREMIUM, premiumValue(input),
                rows, other, note, originalAvailable(input));
    }

    /**
     * Whether Original caption has something to show. Not without an original, nor where the original is
     * in the language on screen or being made, or with nothing there, in the preferred language: the
     * row for it shows the same, as on an English video with English captions by the creator for a
     * viewer who prefers English.
     */
    public static boolean originalAvailable(MenuInput input) {
        String repeated = input.showing != null ? input.showing.lang
                : input.working != null ? input.working.subtitle.lang : input.preferred;
        for (Version version : new Version[]{Version.PREMIUM, Version.STANDARD, Version.UPLOADED}) {
            String lang = originalOf(input, version);
            if (lang != null && !repeats(input, new Subtitle(lang, version), repeated)) return true;
        }
        return false;
    }

    /**
     * Whether an original would only repeat subtitles in {@code lang}: where it is in that language, unless it
     * is a Premium transcript in two languages, whose lines in the other one aren't in those subtitles.
     */
    public static boolean repeats(MenuInput input, Subtitle original, String lang) {
        return original.lang.equals(lang) && !(original.version == Version.PREMIUM && input.lookup != null && input.lookup.mixed);
    }

    private static String otherCaption(MenuInput input) {
        String standardFree = t(input, Wording.MENU_CAPTION, t(input, Wording.MENU_STANDARD), t(input, Wording.MENU_FREE));
        if (!signedIn(input)) return input.lookup != null ? t(input, Wording.MENU_FREE) : standardFree;
        if (effectiveMode(input) == Version.STANDARD) return standardFree;
        Plan made = plan(input, new Subtitle(input.preferred, Version.PREMIUM));
        String says = made.method == Plan.Method.PREMIUM && made.minutes != null
                ? t(input, Wording.MENU_COST_EACH, String.valueOf(made.minutes)) : cost(input, made);
        return !says.isEmpty() ? t(input, Wording.MENU_CAPTION, t(input, Wording.MENU_PREMIUM), says) : t(input, Wording.MENU_PREMIUM);
    }

    /** Every language still to make, by name, narrowed to those whose own or English name holds {@code query}. */
    public static OtherPanel otherPanel(MenuInput input, String query) {
        Set<String> found = searchLanguages(query);
        List<LanguageRow> rows = new ArrayList<>();
        for (Subtitle subtitle : otherEntries(input)) if (found.contains(subtitle.lang)) rows.add(row(input, subtitle, false));
        Collator collator = collator(input);
        rows.sort((a, b) -> collator.compare(a.name, b.name));
        return new OtherPanel(otherCaption(input), rows);
    }

    /**
     * The languages the extension's {@code searchLanguages} finds for what was typed: all of them for
     * nothing, otherwise those whose own name or English name holds it, or whose code it is.
     */
    static Set<String> searchLanguages(String query) {
        String wanted = trim(query).toLowerCase(Locale.ROOT);
        Set<String> found = new LinkedHashSet<>();
        for (String code : Languages.codes()) {
            if (wanted.isEmpty() || Languages.name(code).toLowerCase(Locale.ROOT).contains(wanted)
                    || Languages.englishName(code).toLowerCase(Locale.ROOT).contains(wanted)
                    || code.toLowerCase(Locale.ROOT).equals(wanted)) {
                found.add(code);
            }
        }
        return found;
    }

    /** As JavaScript's trim(): spaces of every kind, the ideographic one too, and line ends. */
    private static String trim(String text) {
        int start = 0, end = text.length();
        while (start < end && blank(text.charAt(start))) start++;
        while (end > start && blank(text.charAt(end - 1))) end--;
        return text.substring(start, end);
    }

    private static boolean blank(char c) {
        return Character.isWhitespace(c) || Character.isSpaceChar(c) || c == '﻿';
    }

    /** Every question a row of this menu could come to ask while it is open, so it can open wide enough for the longest. */
    public static List<String> questions(MenuInput input) {
        Plan made = plan(input, new Subtitle(input.preferred, Version.PREMIUM));
        return Arrays.asList(made.method == Plan.Method.PREMIUM && made.minutes != null
                        ? t(input, Wording.ASK_USE_MINUTES, String.valueOf(made.minutes)) : t(input, Wording.ASK_USE),
                t(input, Wording.ASK_GENERATE), t(input, Wording.ASK_BUY), t(input, Wording.ASK_STOP_ROW));
    }

    /** A size or the background as Settings reads it: "110%". */
    public static String percent(Locale locale, int value) {
        return Wording.t(locale, Wording.SETTINGS_PERCENT, String.valueOf(value));
    }

    /** A timing in seconds as Settings reads it: "+0.3 s", "0.0 s", "−0.3 s", rounded as JavaScript's toFixed(1) rounds. */
    public static String seconds(Locale locale, double value) {
        String sign = value > 0 ? "+" : value < 0 ? MINUS : "";
        String whole = new BigDecimal(Math.abs(value)).setScale(1, RoundingMode.HALF_UP).toPlainString();
        return Wording.t(locale, Wording.SETTINGS_SECONDS, sign + whole);
    }

    // The player menu as step 2 shows it: a signed-out viewer who reads only the shared cache.

    /** One language row of step 2's menu: a version on screen, or ready to show. */
    public static final class Row {
        public final String lang;
        public final String name;
        public final boolean checked;
        /** Every row read from the shared cache is a Premium version. */
        public final boolean premium;

        Row(LanguageRow row) {
            this.lang = row.lang;
            this.name = row.name;
            this.checked = row.checked;
            this.premium = row.version == Version.PREMIUM;
        }

        @Override
        public String toString() {
            return lang + (checked ? " checked" : "");
        }
    }

    /**
     * The main sheet's language rows for {@code lookup}, null when nothing is cached, with
     * {@code showing} on screen, or null: of the whole menu's rows, those a press shows or hides.
     */
    public static List<Row> languages(Lookup lookup, String preferred, String showing, Locale locale) {
        List<Row> rows = new ArrayList<>();
        for (LanguageRow row : mainPanel(cacheOnly(lookup, preferred, showing, locale)).rows) {
            if (row.press == LanguageRow.Press.SHOW || row.press == LanguageRow.Press.HIDE) rows.add(new Row(row));
        }
        return rows;
    }

    /** Whether Original caption has something to show for {@code lookup}, with {@code showing} on screen, or null. */
    public static boolean originalAvailable(Lookup lookup, String preferred, String showing) {
        return originalAvailable(cacheOnly(lookup, preferred, showing, Locale.getDefault()));
    }

    /**
     * The whole menu's input in step 2: signed out, nothing kept on the device or uploaded known, the
     * length and caption track not read. A language is on screen once the cache has it.
     */
    private static MenuInput cacheOnly(Lookup lookup, String preferred, String showing, Locale locale) {
        boolean cached = showing != null && lookup != null && lookup.cachedLanguages().contains(showing);
        return new MenuInput.Builder(preferred).lookup(lookup).showing(cached ? new Subtitle(showing, Version.PREMIUM) : null)
                .locale(locale).build();
    }
}
