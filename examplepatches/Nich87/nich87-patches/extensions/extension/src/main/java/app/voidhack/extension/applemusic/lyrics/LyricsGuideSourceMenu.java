package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;

public final class LyricsGuideSourceMenu {
    private LyricsGuideSourceMenu() {}

    public static String label(
            Context context, String title, String script, boolean automaticallyCreated, boolean karaoke) {
        String source;
        if (!LrclibParser.PRONUNCIATION_LANGUAGE.equals(script)) {
            source = "guide_source_official";
        } else if (automaticallyCreated) {
            source = "guide_source_generated";
        } else {
            source = "guide_source_manual";
        }
        if (karaoke && LrclibParser.PRONUNCIATION_LANGUAGE.equals(script)) {
            title = pronunciationAction(context, title);
        }
        return title + "\n" + LrclibStrings.text(context, source);
    }

    private static String pronunciationAction(Context context, String title) {
        for (String action : new String[] {"show", "hide"}) {
            int original = LrclibStrings.id(context, "string", "lyrics_" + action + "_original");
            int pronunciation = LrclibStrings.id(context, "string", "lyrics_" + action + "_pronunciation");
            if (original != 0 && pronunciation != 0 && title.equals(context.getString(original))) {
                return context.getString(pronunciation);
            }
        }
        return title;
    }
}
