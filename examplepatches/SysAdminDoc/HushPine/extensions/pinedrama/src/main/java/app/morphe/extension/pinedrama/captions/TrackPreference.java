/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.captions;

import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.feedfilter.CaptionLanguageFilter;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Which subtitle and which dub a video plays with, and whether the feed keeps it (issue #4).
 *
 * <p>PineDrama asks the server for tracks in the app's language and picks one per video from
 * that, so the same video can play differently from the feed and from Collections. Each option
 * here works on its own and every one of them starts off. A video with nothing on the list falls
 * back to PineDrama's own pick, and anything chosen by hand on the video itself wins, so the app's
 * "See original" and "See translation" button keeps working.
 */
public final class TrackPreference {
    /** The Hook status family this reports under. */
    static final String FAMILY = "subtitle and dub preference";
    /** The list entry that means the video's own track. */
    public static final String ORIGINAL = "original";
    /** What the app's per-video choice reads as until someone taps it. */
    private static final String NOT_CHOSEN = "NOT_OVERWRITTEN";
    /** The id the player reads as no subtitle. */
    static final int NONE = -1;
    private static final String SEPARATOR = "\\s*[,\\n]\\s*";
    /** How the player numbers an audio track report. */
    static final int AUDIO = 1;
    /** How many videos and players the dub correction keeps track of. */
    private static final int REMEMBERED = 64;
    /** The dub each video's switch asked for, by video id. */
    private static final Map<String, String> ASKED = recent();
    /** The dub the setup decision played, by video id, for copies of the video that list none. */
    private static final Map<String, String> KNOWN = recent();
    /** Players that already had their one look: video id plus the identity of its track list. */
    private static final Map<String, Boolean> SETTLED = recent();

    /** One caption track: its language as sent, that language's primary tag, and its player id. */
    static final class Subtitle {
        final String code;
        final String language;
        final int id;
        final boolean original;

        Subtitle(String code, int id, boolean original) {
            this.code = code;
            this.language = CaptionLanguageFilter.primary(code);
            this.id = id;
            this.original = original;
        }
    }

    private static volatile boolean captionsSwitchedOff;
    private static String subtitlesFrom;
    private static List<String> subtitles = List.of();
    private static String dubsFrom;
    private static List<String> dubs = List.of();

    private TrackPreference() {}

    // Subtitles, called from the app.

    /** The player's subtitle is being settled: answers the id it should load. */
    public static int subtitleId(Object aweme, Object model, int stock, Object handChoice) {
        HookStatus.bound(FAMILY, "subtitle pick");
        boolean forceOriginal = Settings.FORCE_ORIGINAL_SUBTITLE.get();
        boolean force = Settings.FORCE_SUBTITLE.get();
        List<String> wanted = wantedSubtitles();
        if (!forceOriginal && !force && wanted.isEmpty()) return stock;
        if (chosenByHand(handChoice)) return stock;
        return chooseSubtitle(readSubtitles(model), wanted, force, forceOriginal, stock);
    }

    /**
     * The track the caption overlay asks for. The app only knows its own language's translation
     * and the original, and once a video is playing it switches the player back to one of those,
     * so a pick made only when the player starts is gone a moment later.
     */
    public static int overlaySubtitle(Object aweme, int stock, Object handChoice) {
        Object model = captionModel(aweme);
        return subtitleId(aweme, model, stock, handChoice);
    }

    /** The language code the overlay should name for the track it was just told to load. */
    public static String subtitleLanguage(Object aweme, int id) {
        Subtitle track = trackWith(readSubtitles(captionModel(aweme)), id);
        return track == null ? null : track.code;
    }

    /** Whether that track is a translation, which is how the app treats anything but the original. */
    public static boolean subtitleTranslated(Object aweme, int id) {
        Subtitle track = trackWith(readSubtitles(captionModel(aweme)), id);
        return track == null || !track.original;
    }

    /**
     * The overlay hides a translation that isn't in the app's language, taking it for one left over
     * from before a language change. Answers false when that translation was asked for.
     */
    public static boolean staleSubtitle(Object aweme, Object shown, boolean stock) {
        HookStatus.bound(FAMILY, "stale subtitle");
        if (!stock || !(shown instanceof Integer)) return stock;
        List<String> wanted = wantedSubtitles();
        if (wanted.isEmpty()) return stock;
        return !isListChoice(readSubtitles(captionModel(aweme)), wanted, (Integer) shown);
    }

    /** The app is asking whether captions are on for this video. */
    public static boolean captionsOn(Object aweme, boolean stock) {
        HookStatus.bound(FAMILY, "captions on");
        if (stock || captionsSwitchedOff) return stock;
        boolean forceOriginal = Settings.FORCE_ORIGINAL_SUBTITLE.get();
        if (!forceOriginal && !Settings.FORCE_SUBTITLE.get()) return false;
        return wouldShow(readSubtitles(captionModel(aweme)), wantedSubtitles(), forceOriginal);
    }

    /** Someone used the app's own caption switch, which a forced subtitle has to give way to. */
    public static void captionSwitch(boolean on) {
        HookStatus.bound(FAMILY, "caption switch");
        captionsSwitchedOff = !on;
    }

    /** True stops the app hiding the original as a foreign subtitle, because it was asked for. */
    public static boolean originalStaysShown(Object aweme) {
        HookStatus.bound(FAMILY, "foreign original");
        boolean forceOriginal = Settings.FORCE_ORIGINAL_SUBTITLE.get();
        List<String> wanted = wantedSubtitles();
        if (!forceOriginal && wanted.isEmpty()) return false;
        return wantsOriginal(readSubtitles(captionModel(aweme)), wanted, forceOriginal);
    }

    // Dubs, called from the app.

    /** The dub language the playback decision compares every track against. Empty matches none. */
    public static String dubTarget(Object aweme, String stock) {
        HookStatus.bound(FAMILY, "dub pick");
        if (Settings.FORCE_ORIGINAL_DUB.get()) {
            know(Reflect.string(aweme, "getAid", "aid"), null);
            return "";
        }
        List<String> wanted = wantedDubs();
        if (wanted.isEmpty()) return stock;
        String choice = chooseDub(aweme, wanted);
        String target = choice == null ? stock : ORIGINAL.equals(choice) ? "" : choice;
        know(Reflect.string(aweme, "getAid", "aid"), playedDub(aweme, wanted, choice, stock));
        Logger.printDebug(() -> "Dub pick: " + describeDubs(aweme) + " stock=" + stock
            + " -> " + target);
        return target;
    }

    /** True plays a dub even with PineDrama's dubbing switch off or the language on its skip list. */
    public static boolean dubForced(Object aweme) {
        if (!Settings.FORCE_DUB.get() || Settings.FORCE_ORIGINAL_DUB.get()) return false;
        List<String> wanted = wantedDubs();
        if (wanted.isEmpty()) return true;
        String choice = chooseDub(aweme, wanted);
        return choice != null && !ORIGINAL.equals(choice);
    }

    /** The audio language the player switches to once the video's label is on screen. */
    public static String dubLanguage(Object aweme, String stock, Object handChoice) {
        HookStatus.bound(FAMILY, "dub switch");
        boolean forceOriginal = Settings.FORCE_ORIGINAL_DUB.get();
        List<String> wanted = wantedDubs();
        if (!forceOriginal && wanted.isEmpty()) return stock;
        String video = Reflect.string(aweme, "getAid", "aid");
        if (chosenByHand(handChoice)) {
            remember(video, null);
            return stock;
        }
        String own = originalCode(readSubtitles(captionModel(aweme)));
        String choice = forceOriginal ? ORIGINAL : chooseDub(aweme, wanted);
        // A copy that lists no dubs can't settle anything, so it keeps the dub the setup played.
        String known = forceOriginal || video == null || !readDubs(aweme).isEmpty() ? null : KNOWN.get(video);
        String result = known != null ? known
            : settleDubLanguage(choice, own, stock, forceOriginal || Settings.FORCE_DUB.get());
        remember(video, result != null && (result.equals(choice) || result.equals(known)) ? result : null);
        Logger.printDebug(() -> "Dub switch: " + describeDubs(aweme) + " stock=" + stock
            + " own=" + own + " choice=" + choice + (known == null ? "" : " known=" + known)
            + " -> " + result);
        return result;
    }

    /**
     * The player reports the track it now plays. Its list of audio tracks only exists from the
     * first audio report on, and a switch that arrives before that is dropped, which is how a video
     * opened from Favorites kept its original audio. So the first report with the list in place
     * gets the dub the switch asked for. Later reports are left alone, so the app's own "See
     * original" still sticks. Answers the track to switch to, or -1 to leave it.
     */
    public static int dubTrack(String video, Object tracks, int kind, int playing) {
        HookStatus.bound(FAMILY, "dub track");
        if (kind != AUDIO || video == null || !(tracks instanceof Map<?, ?>)) return NONE;
        if (SETTLED.put(video + '#' + System.identityHashCode(tracks), Boolean.TRUE) != null) return NONE;
        String language = ASKED.get(video);
        if (language == null || Settings.FORCE_ORIGINAL_DUB.get() || wantedDubs().isEmpty()) return NONE;
        int track = trackFor((Map<?, ?>) tracks, language, playing);
        if (track != NONE) {
            Logger.printDebug(() -> "Dub track: " + video + " plays " + playing + ", " + language
                + " is " + track);
        }
        return track;
    }

    /** The player's id for that language, or -1 when it has none or already plays it. */
    static int trackFor(Map<?, ?> tracks, String language, int playing) {
        Object id = tracks.get(language);
        if (!(id instanceof Integer)) return NONE;
        int track = (Integer) id;
        return track == playing ? NONE : track;
    }

    /** Keeps the dub a video's switch asked for, or forgets it with null. */
    static void remember(String video, String language) {
        if (video == null) return;
        if (language == null) ASKED.remove(video);
        else ASKED.put(video, language);
    }

    /**
     * The listed dub the setup plays, or null. A post reopened from Favorites gets its switch from
     * a copy that lists no dubs, which can only name the original and so undid the dub. Its setup
     * often lists none either, and then plays the app's own target when that's on the list.
     */
    private static String playedDub(Object aweme, List<String> wanted, String choice, String stock) {
        if (ORIGINAL.equals(choice)) return null;
        String own = originalCode(readSubtitles(captionModel(aweme)));
        if (choice != null) {
            return choice.equals(settleDubLanguage(choice, own, stock, Settings.FORCE_DUB.get())) ? choice : null;
        }
        String language = stock == null ? null : CaptionLanguageFilter.primary(stock);
        if (language == null || !wanted.contains(language)) return null;
        return own != null && language.equals(CaptionLanguageFilter.primary(own)) ? null : stock;
    }

    /** Keeps the dub a video's setup played, or forgets it with null. */
    private static void know(String video, String language) {
        if (video == null) return;
        if (language == null) KNOWN.remove(video);
        else KNOWN.put(video, language);
    }

    /** Forgets every asked and played dub and settled player, for tests. */
    static void forgetDubs() {
        ASKED.clear();
        KNOWN.clear();
        SETTLED.clear();
    }

    private static <V> Map<String, V> recent() {
        return Collections.synchronizedMap(new LinkedHashMap<String, V>() {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, V> eldest) {
                return size() > REMEMBERED;
            }
        });
    }

    /**
     * What the switch should play. Without a force a dub only replaces another dub: a video the
     * app was going to play in its own language stays that way.
     */
    static String settleDubLanguage(String choice, String own, String stock, boolean forced) {
        if (choice == null) return stock;
        // No switch for the video's own audio. The player starts there once dubTarget clears the
        // target, and the only code that could name it can also be the dub's, which would win.
        if (ORIGINAL.equals(choice)) return null;
        if (!forced && stock != null && stock.equals(own)) return stock;
        return choice;
    }

    /** True keeps the "AI dubbed" label off a video the settings keep on its own audio. */
    public static boolean dubLabelOff(Object aweme, Object handChoice) {
        HookStatus.bound(FAMILY, "dub label");
        boolean forceOriginal = Settings.FORCE_ORIGINAL_DUB.get();
        List<String> wanted = wantedDubs();
        if (!forceOriginal && wanted.isEmpty()) return false;
        if (chosenByHand(handChoice)) return false;
        return forceOriginal || ORIGINAL.equals(chooseDub(aweme, wanted));
    }

    // Feed filters.

    /** Whether the video has none of the listed subtitles. Text burned in counts as having one. */
    public static boolean missingSubtitle(Object aweme) {
        List<String> wanted = wantedSubtitles();
        if (wanted.isEmpty()) return false;
        Object model = captionModel(aweme);
        List<Subtitle> tracks = readSubtitles(model);
        Subtitle original = originalOf(tracks);
        Set<String> have = languages(tracks);
        have.addAll(burnedIn(model));
        return pick(wanted, have, original == null ? null : original.language, original != null) == null;
    }

    /** Whether the video has none of the listed dubs. Its own audio is what original means here. */
    public static boolean missingDub(Object aweme) {
        List<String> wanted = wantedDubs();
        return !wanted.isEmpty() && chooseDub(aweme, wanted) == null;
    }

    public static boolean subtitleListSet() {
        return !wantedSubtitles().isEmpty();
    }

    public static boolean dubListSet() {
        return !wantedDubs().isEmpty();
    }

    // The settings row's check.

    /** Why a priority list can't work, or null. Same message as the other language lists. */
    public static String priorityProblem(String value) {
        if (value == null) return null;
        for (String entry : value.trim().split(SEPARATOR)) {
            if (ORIGINAL.equalsIgnoreCase(entry)) continue;
            String problem = CaptionLanguageFilter.languageProblem(entry);
            if (problem != null) return problem;
        }
        return null;
    }

    // The choosing, free of the app's types.

    /** A priority list in order: primary language tags, plus {@link #ORIGINAL}, unknowns dropped. */
    static List<String> parse(String value) {
        if (value == null || value.trim().isEmpty()) return List.of();
        Set<String> codes = new LinkedHashSet<>();
        for (String entry : value.trim().split(SEPARATOR)) {
            if (codes.size() >= CaptionLanguageFilter.MAX_ENTRIES) break;
            if (ORIGINAL.equals(entry.toLowerCase(Locale.ROOT))) {
                codes.add(ORIGINAL);
                continue;
            }
            String code = CaptionLanguageFilter.primary(entry);
            if (code != null) codes.add(code);
        }
        return List.copyOf(codes);
    }

    /**
     * The first entry the video can honor, or null. A code naming the video's own language means
     * its original track, which is why it comes back as {@link #ORIGINAL}.
     */
    static String pick(List<String> wanted, Collection<String> have, String own, boolean hasOwn) {
        for (String entry : wanted) {
            if (ORIGINAL.equals(entry)) {
                if (hasOwn) return ORIGINAL;
            } else if (hasOwn && entry.equals(own)) {
                return ORIGINAL;
            } else if (have.contains(entry)) {
                return entry;
            }
        }
        return null;
    }

    /**
     * The subtitle to load. A list alone only changes which track shows on a video that was going
     * to show one. A force also shows one on a video that wasn't.
     */
    static int chooseSubtitle(List<Subtitle> tracks, List<String> wanted, boolean force,
            boolean forceOriginal, int stock) {
        Subtitle original = originalOf(tracks);
        if (forceOriginal) return original != null ? original.id : stock;
        String choice = pick(wanted, languages(tracks), original == null ? null : original.language,
                original != null);
        if (choice != null) {
            if (stock == NONE && !force) return stock;
            return idOf(tracks, choice, original, stock);
        }
        if (force && wanted.isEmpty() && stock == NONE && !tracks.isEmpty()) {
            return original != null ? original.id : tracks.get(0).id;
        }
        return stock;
    }

    /** Whether this track is the one the list settles on for this video. */
    static boolean isListChoice(List<Subtitle> tracks, List<String> wanted, int id) {
        Subtitle original = originalOf(tracks);
        String choice = pick(wanted, languages(tracks), original == null ? null : original.language,
                original != null);
        return choice != null && idOf(tracks, choice, original, NONE) == id;
    }

    /** Whether a force has a track to show on this video, which is what turns captions on. */
    static boolean wouldShow(List<Subtitle> tracks, List<String> wanted, boolean forceOriginal) {
        Subtitle original = originalOf(tracks);
        if (forceOriginal) return original != null;
        if (wanted.isEmpty()) return !tracks.isEmpty();
        return pick(wanted, languages(tracks), original == null ? null : original.language,
                original != null) != null;
    }

    static boolean wantsOriginal(List<Subtitle> tracks, List<String> wanted, boolean forceOriginal) {
        Subtitle original = originalOf(tracks);
        if (original == null) return false;
        return forceOriginal
                || ORIGINAL.equals(pick(wanted, languages(tracks), original.language, true));
    }

    /**
     * The dub entry for a video, given its dubs by primary tag. Only a dub track counts for a
     * language: dramas carry a generated caption in the viewer's language marked as the original,
     * Chinese audio included, so the captions never say what the video is spoken in.
     */
    static String chooseDub(List<String> wanted, Map<String, String> dubsByLanguage) {
        for (String entry : wanted) {
            if (ORIGINAL.equals(entry)) return ORIGINAL;
            String dub = dubsByLanguage.get(entry);
            if (dub != null) return dub;
        }
        return null;
    }

    private static int idOf(List<Subtitle> tracks, String choice, Subtitle original, int stock) {
        if (ORIGINAL.equals(choice)) return original != null ? original.id : stock;
        for (Subtitle track : tracks) {
            if (choice.equals(track.language)) return track.id;
        }
        return stock;
    }

    private static Subtitle trackWith(List<Subtitle> tracks, int id) {
        for (Subtitle track : tracks) {
            if (track.id == id) return track;
        }
        return null;
    }

    private static Subtitle originalOf(List<Subtitle> tracks) {
        for (Subtitle track : tracks) {
            if (track.original) return track;
        }
        return null;
    }

    private static String originalCode(List<Subtitle> tracks) {
        Subtitle original = originalOf(tracks);
        return original == null ? null : original.code;
    }

    private static Set<String> languages(List<Subtitle> tracks) {
        Set<String> found = new LinkedHashSet<>();
        for (Subtitle track : tracks) {
            if (track.language != null) found.add(track.language);
        }
        return found;
    }

    static boolean chosenByHand(Object handChoice) {
        return handChoice instanceof Enum && !NOT_CHOSEN.equals(((Enum<?>) handChoice).name());
    }

    // Reading the app's objects.

    private static String chooseDub(Object aweme, List<String> wanted) {
        return chooseDub(wanted, readDubs(aweme));
    }

    private static Object captionModel(Object aweme) {
        Object video = Reflect.property(aweme, "getVideo", "video");
        return Reflect.property(video, "getCaptionModel", "captionModel");
    }

    private static List<Subtitle> readSubtitles(Object model) {
        Object list = Reflect.readField(model, "captionList");
        if (!(list instanceof List<?>)) return List.of();
        List<Subtitle> tracks = new ArrayList<>(((List<?>) list).size());
        for (Object caption : (List<?>) list) {
            Object id = Reflect.readField(caption, "subId");
            String code = Reflect.string(caption, "getLanguageCode", "languageCode");
            if (!(id instanceof Integer) || code == null) continue;
            tracks.add(new Subtitle(code, (Integer) id, Boolean.TRUE.equals(
                    Reflect.property(caption, "isOriginalCaption", "isOriginalCaption"))));
        }
        return tracks;
    }

    private static Set<String> burnedIn(Object model) {
        Set<String> found = new LinkedHashSet<>();
        Object list = Reflect.readField(model, "duplicateLanguages");
        if (list instanceof List<?>) {
            for (Object code : (List<?>) list) {
                String language = code instanceof String ? CaptionLanguageFilter.primary((String) code) : null;
                if (language != null) found.add(language);
            }
        }
        return found;
    }

    /** A video's dubs by primary tag, with the exact code the player compares against. */
    private static Map<String, String> readDubs(Object aweme) {
        Map<String, String> found = new LinkedHashMap<>();
        Object audio = Reflect.invoke(aweme, "getAudio");
        Object infos = audio == null ? null : Reflect.invoke(audio, "getTtsInfos");
        if (infos instanceof List<?>) {
            for (Object info : (List<?>) infos) {
                addDub(found, Reflect.readField(info, "languageCode"));
            }
        }
        Object translated = Reflect.invoke(aweme, "getTranslatedVideo");
        if (translated != null && Reflect.readField(translated, "video") != null) {
            addDub(found, Reflect.readField(translated, "languageCode"));
        }
        return found;
    }

    /** The dubs a video carries, for the diagnostics log: its tts tracks and its translated video. */
    private static String describeDubs(Object aweme) {
        Object translated = Reflect.invoke(aweme, "getTranslatedVideo");
        String translation = translated == null ? "none"
            : Reflect.readField(translated, "languageCode")
                + (Reflect.readField(translated, "video") == null ? " (no video)" : "");
        return "dubs=" + readDubs(aweme).keySet() + " translated=" + translation;
    }

    private static void addDub(Map<String, String> found, Object code) {
        if (!(code instanceof String)) return;
        String language = CaptionLanguageFilter.primary((String) code);
        if (language != null && !found.containsKey(language)) found.put(language, (String) code);
    }

    private static List<String> wantedSubtitles() {
        String value = Settings.SUBTITLE_PRIORITY.get();
        synchronized (TrackPreference.class) {
            if (!value.equals(subtitlesFrom)) {
                subtitles = parse(value);
                subtitlesFrom = value;
            }
            return subtitles;
        }
    }

    private static List<String> wantedDubs() {
        String value = Settings.DUB_PRIORITY.get();
        synchronized (TrackPreference.class) {
            if (!value.equals(dubsFrom)) {
                dubs = parse(value);
                dubsFrom = value;
            }
            return dubs;
        }
    }
}
