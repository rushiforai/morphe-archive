package dev.twitchpatches.extension.startup;

/**
 * Startup tab choices for the Ayufa startup tab patch. The indices are
 * persisted and read by the injected bridge, so they must remain stable.
 */
final class StartupTab {
    static final int FOLLOWING = 0;
    static final int LIVE = 1;
    static final int CLIPS = 2;

    static int parse(String value) {
        if ("following".equals(value)) return FOLLOWING;
        if ("clips".equals(value)) return CLIPS;
        return LIVE;
    }

    static String serialize(int tab) {
        switch (tab) {
            case FOLLOWING: return "following";
            case CLIPS: return "clips";
            default: return "live";
        }
    }

    static String label(int tab) {
        switch (tab) {
            case FOLLOWING: return "フォロー";
            case CLIPS: return "クリップ";
            default: return "ライブ";
        }
    }
}
