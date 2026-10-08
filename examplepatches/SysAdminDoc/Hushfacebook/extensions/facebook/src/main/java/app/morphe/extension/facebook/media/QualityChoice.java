/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Default playback quality: videos, reels and video stories start at the quality picked in
 * Hushfacebook's settings.
 *
 * <p>Facebook's player chooses a video's rung with one DASH format evaluator per track group. The
 * evaluator's custom-quality setter is what Facebook's own quality menu calls with a pick: it takes
 * a label such as {@code 720p}, finds the track with that label and plays it from then on, or plays
 * as Facebook's bandwidth estimate says when no track has it, which is what the menu's Auto sends.
 * The evaluator also keeps a preselected label, filled in from the video's play request, which its
 * first choice of a track hands to that setter once and then forgets. Facebook's own code never
 * fills it in, and a pick in the menu stays with the one video it was made on.
 *
 * <p>So the patch has the evaluator's constructor tell {@link #evaluatorBuilt} about it, and while
 * the switch is on and a quality is chosen, this leaves the evaluator {@link #TOKEN} and the
 * choice's name as its preselected label. The setter asks {@link #customQuality} first, which turns
 * that label into the one of the video's own labels the choice plays ({@link PlaybackQuality#pick}),
 * or null, Facebook's choice, when the tracks have none, such as a video's sound. Every other label,
 * a pick in Facebook's menu included, goes through as it came. A preselected label Facebook put
 * there itself is left alone.
 *
 * <p>Reels and video stories can each have a quality of their own ({@link SurfaceQuality}). The
 * evaluator keeps the configuration it was built with, whose playback preferences carry the player
 * origin and sub-origin Facebook names every player with, and the configuration itself reads those
 * two to treat a story differently: an origin of {@code fb_stories} is a story, and a sub-origin of
 * {@code fb_shorts_viewer} or {@code fb_shorts_native_in_feed_unit} a reel. {@link #surfaceOf} sorts
 * by the same names, a little wider, so every {@code fb_shorts} player is a reel and every
 * {@code fb_stories} one a story. Anything else plays at the quality every video does.
 *
 * <p>It fails open: with the patch not in the build, the switch off, Hushfacebook paused, the
 * settings not ready yet, Auto chosen, or a failure in here, Facebook picks the quality as it plays.
 * A change takes effect for the next video that starts.
 */
public final class QualityChoice {
    /** The name the log lines go under, which is also their logcat tag after Morphe's prefix. */
    static final String SOURCE = "QualityChoice";

    /** What every line of this hook starts with, for a person reading the log. */
    static final String PREFIX = "Playback quality: ";

    /**
     * What an evaluator's preselected label starts with while it waits for its first choice, then
     * the chosen quality's {@link PlaybackQuality#fileValue}. No track is labelled like this, so a
     * label that got past {@link #customQuality} would still leave the choice to Facebook.
     */
    static final String TOKEN = "hushfacebook:playback_quality:";

    /** Counted under the patch's name for each video that started at the chosen quality. */
    static final String APPLIED = "video started at the chosen quality";

    /** Counted under the patch's name for each reel given the Reels quality rather than the videos' one. */
    static final String REEL_OWN = "reel given the Reels quality";

    /** Counted under the patch's name for each story given the Stories quality rather than the videos' one. */
    static final String STORY_OWN = "story given the Stories quality";

    /** Where a video plays, as far as which quality it starts at goes. */
    enum Surface {
        VIDEO, REEL, STORY
    }

    /** Choices logged one by one before the log only counts them. */
    static final int LOGGED_ONE_BY_ONE = 40;

    /** After those, one line per this many choices. */
    static final int SUMMED_UP_BY = 50;

    private static final String FAMILY = FamilyNames.PLAYBACK_QUALITY;

    /** What this class reads from an evaluator and its tracks. {@link #PATCHED} is the patch's; tests stand in. */
    interface Evaluator {
        /** The label the evaluator waits to apply at its first choice, or null for none. */
        @Nullable
        String preselected(Object evaluator);

        /** Sets the label the evaluator applies at its first choice. */
        void preselect(Object evaluator, @Nullable String label);

        /** The tracks the evaluator chooses among, or null before it has seen them. */
        @Nullable
        Object[] formats(Object evaluator);

        /** A track's quality label, such as 720p, or null when it has none. */
        @Nullable
        String label(Object format);

        /** The player origin the evaluator's video plays under, such as fb_stories, or null. */
        @Nullable
        String origin(Object evaluator);

        /** The player sub-origin, such as fb_shorts_viewer, or null. */
        @Nullable
        String subOrigin(Object evaluator);
    }

    static final Evaluator PATCHED = new Evaluator() {
        @Override
        public String preselected(Object evaluator) {
            return preselectedLabel(evaluator);
        }

        @Override
        public void preselect(Object evaluator, String label) {
            preselectLabel(evaluator, label);
        }

        @Override
        public Object[] formats(Object evaluator) {
            return trackFormats(evaluator);
        }

        @Override
        public String label(Object format) {
            return formatLabel(format);
        }

        @Override
        public String origin(Object evaluator) {
            return playOrigin(evaluator);
        }

        @Override
        public String subOrigin(Object evaluator) {
            return playSubOrigin(evaluator);
        }
    };

    static volatile Evaluator access = PATCHED;

    /** Whether the patch is in this build, when a test says so instead of {@link SettingsStatus}. */
    @Nullable
    static volatile Boolean inBuildForTests;

    /** The quality a test chooses instead of the saved one. The switch is still asked. */
    @Nullable
    static volatile PlaybackQuality qualityForTests;

    /** How many choices this made, for the log. */
    private static final AtomicInteger choices = new AtomicInteger();

    private QualityChoice() {
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled in by the patch: the evaluator's preselected label. Only an evaluator may be passed. */
    @Nullable
    public static String preselectedLabel(Object evaluator) {
        return null;
    }

    /** Filled in by the patch: sets the evaluator's preselected label. Only an evaluator may be passed. */
    public static void preselectLabel(Object evaluator, @Nullable String label) {
    }

    /** Filled in by the patch: the tracks the evaluator last chose among. Only an evaluator may be passed. */
    @Nullable
    public static Object[] trackFormats(Object evaluator) {
        return null;
    }

    /** Filled in by the patch: a track's quality label, read as the custom-quality setter reads it. Only a track may be passed. */
    @Nullable
    public static String formatLabel(Object format) {
        return null;
    }

    /**
     * Filled in by the patch: the player origin in the playback preferences of the configuration
     * the evaluator was built with, or null. Only an evaluator may be passed.
     */
    @Nullable
    public static String playOrigin(Object evaluator) {
        return null;
    }

    /** Filled in by the patch: the player sub-origin, read the same way. Only an evaluator may be passed. */
    @Nullable
    public static String playSubOrigin(Object evaluator) {
        return null;
    }

    // ------------------------------------------------------------------ hooks

    /** Whether this build carries the patch. */
    static boolean inBuild() {
        Boolean forced = inBuildForTests;
        return forced != null ? forced : SettingsStatus.defaultPlaybackQuality();
    }

    /**
     * Where a player of [origin] and [subOrigin] plays: a story for an fb_stories origin, a reel for
     * an fb_shorts origin or sub-origin, then a story for an fb_stories sub-origin, else a video.
     * Case doesn't count, as it doesn't for Facebook's own check.
     */
    static Surface surfaceOf(@Nullable String origin, @Nullable String subOrigin) {
        if (startsWith(origin, "fb_stories")) return Surface.STORY;
        if (startsWith(origin, "fb_shorts") || startsWith(subOrigin, "fb_shorts")) return Surface.REEL;
        if (startsWith(subOrigin, "fb_stories")) return Surface.STORY;
        return Surface.VIDEO;
    }

    private static boolean startsWith(@Nullable String name, String prefix) {
        return name != null && name.toLowerCase(Locale.US).startsWith(prefix);
    }

    /**
     * Injection point, at the end of the constructor of Facebook's DASH format evaluator. While the
     * patch is in, the settings are ready and the switch is on, which a pause answers off, leaves
     * the quality the video starts at as the label its first choice applies, unless Facebook left
     * one there itself: the Reels or Stories quality for a reel or a story when that has one of its
     * own, else the one every video starts at. Facebook's Auto leaves no label. Never throws.
     */
    public static void evaluatorBuilt(@Nullable Object evaluator) {
        try {
            if (evaluator == null || !inBuild()) return;
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.DEFAULT_PLAYBACK_QUALITY.get()) return;
            Surface surface = surfaceOf(access.origin(evaluator), access.subOrigin(evaluator));
            SurfaceQuality own = surface == Surface.REEL ? Settings.REELS_PLAYBACK_QUALITY.get()
                    : surface == Surface.STORY ? Settings.STORIES_PLAYBACK_QUALITY.get() : null;
            PlaybackQuality forced = qualityForTests;
            PlaybackQuality quality = own != null && own.quality != null ? own.quality
                    : forced != null ? forced : Settings.PLAYBACK_QUALITY.get();
            if (quality == null || quality == PlaybackQuality.AUTO || access.preselected(evaluator) != null) return;
            access.preselect(evaluator, TOKEN + quality.fileValue);
            if (own != null && own.quality != null) HookStatus.counted(FAMILY, surface == Surface.REEL ? REEL_OWN : STORY_OWN);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "evaluator built", failure);
        }
    }

    /**
     * Injection point, first thing in the evaluator's custom-quality setter, with the label it was
     * handed. Answers the label the setter looks for: the one the chosen quality plays for a label
     * {@link #evaluatorBuilt} left, else [label] as it came. Never throws.
     */
    @Nullable
    public static String customQuality(@Nullable Object evaluator, @Nullable String label) {
        if (label == null || !label.startsWith(TOKEN)) return label;
        try {
            HookStatus.invoked(FAMILY);
            PlaybackQuality quality = PlaybackQuality.fromFile(label.substring(TOKEN.length()));
            if (quality == null || evaluator == null) return null;
            List<String> labels = labels(access.formats(evaluator));
            String picked = quality.pick(labels);
            if (picked == null) return null;
            HookStatus.bound(FAMILY, "labelled tracks");
            HookStatus.counted(FAMILY, APPLIED);
            log(quality.fileValue + " started a video at " + picked + " of " + String.join(", ", labels) + ".");
            return picked;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "first choice", failure);
            return null;
        }
    }

    /** The quality labels of [formats], leaving out the tracks that have none. */
    private static List<String> labels(@Nullable Object[] formats) {
        List<String> labels = new ArrayList<>();
        if (formats == null) return labels;
        for (Object format : formats) {
            if (format == null) continue;
            String label = access.label(format);
            if (PlaybackQuality.qualityOf(label) > 0) labels.add(label);
        }
        return labels;
    }

    /** One line per choice for the first {@link #LOGGED_ONE_BY_ONE}, then one per {@link #SUMMED_UP_BY}. */
    private static void log(String line) {
        int count = choices.incrementAndGet();
        if (count <= LOGGED_ONE_BY_ONE) {
            Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE, () -> PREFIX + line);
        } else if (count % SUMMED_UP_BY == 0) {
            Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE,
                    () -> PREFIX + count + " videos so far. The last one: " + line);
        }
    }

    /** Forgets the line count, as a new process would. */
    static void forget() {
        choices.set(0);
    }
}
