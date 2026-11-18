package io.github.sabopura.morphe.extension.twitch.ui;

import java.util.EnumSet;

/** Which Twitch patches were applied, so the shared UI only offers what exists. */
@SuppressWarnings("unused")
public final class Features {
    private static volatile boolean preview;
    private static volatile boolean paused;
    private static volatile EnumSet<Feature> applied;

    private Features() {
    }

    /** Replaced at patch time with the comma-separated names of the applied {@link Feature}s. */
    public static String appliedNames() {
        return "";
    }

    /** Replaced at patch time with the version of the patch bundle; empty in an unpatched build. */
    public static String patchVersion() {
        return "";
    }

    private static EnumSet<Feature> applied() {
        EnumSet<Feature> result = applied;
        if (result != null) return result;
        result = EnumSet.noneOf(Feature.class);
        for (String name : appliedNames().split(","))
            if (!name.isEmpty()) result.add(Feature.valueOf(name));
        return applied = result;
    }

    public static boolean has(Feature feature) {
        return preview || !paused && applied().contains(feature);
    }

    /** Turns every feature off for this run, after repeated crashes at startup. */
    public static void pause() {
        paused = true;
    }

    public static boolean any(Feature... features) {
        for (Feature feature : features) if (has(feature)) return true;
        return false;
    }

    public static boolean ads() {
        return any(Feature.ADS_CLIENT, Feature.ADS_SERVER, Feature.ADS_REPLACE, Feature.ADS_COVER, Feature.ADS_PBYP);
    }

    public static boolean danmaku() {
        return has(Feature.DANMAKU);
    }

    /** A patch that decorates chat rows is applied. */
    public static boolean chat() {
        return any(Feature.CHAT_EMOTES, Feature.CHAT_BADGES, Feature.CHAT_FILTERS, Feature.CHAT_APPEARANCE,
                Feature.CHAT_HISTORY);
    }

    public static boolean player() {
        return any(Feature.PLAY_SPEED, Feature.PLAY_SEEK, Feature.PLAY_SLEEP, Feature.PLAY_TOOLS,
                Feature.VOD_CHAPTERS, Feature.VOD_OFFSET);
    }

    /** Shows every feature; used by the on-device verification harness only. */
    public static void enableAllForPreview() {
        preview = true;
    }
}
