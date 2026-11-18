import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.playback.PlaylistMinibar;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Each invocation is a fresh process, as required by the native cached owners. */
public final class PlaylistMinibarTest {
    private static int checks;

    private static void check(String message, boolean expected, boolean actual) {
        checks++;
        if (expected != actual) throw new AssertionError(message + ": " + actual + " != " + expected);
    }

    public static void main(String[] args) {
        if (args[0].equals("unavailable")) {
            unavailablePreferences(Boolean.parseBoolean(args[1]));
            return;
        }
        boolean installed = Boolean.parseBoolean(args[0]);
        boolean preference = Boolean.parseBoolean(args[1]);
        boolean liteMode = Boolean.parseBoolean(args[2]);
        boolean firstNative = Boolean.parseBoolean(args[3]);
        if (installed) InstalledTweaks.mark("miniplayer");
        InstalledTweaks.mark("player-overlay");
        AfterglowPrefs.setBool("playlistOldMinibar", preference);
        AfterglowPrefs.setBool("liteModeEnabled", liteMode);
        // The video's distinct miniplayer preference must not select this layout.
        AfterglowPrefs.setBool("miniplayer", !preference);
        boolean forceOld = installed && preference;
        check("first native read", firstNative && !forceOld,
                PlaylistMinibar.floatingPlaylistMinibar(firstNative));

        for (boolean original : new boolean[] {false, true}) {
            check("original " + original, original && !forceOld,
                    PlaylistMinibar.floatingPlaylistMinibar(original));
        }
        // Changing either way, importing, and page/full reset all leave the
        // current native owners coherent until a new process is created.
        AfterglowPrefs.setBool("playlistOldMinibar", !preference);
        AfterglowPrefs.setBool("liteModeEnabled", !liteMode);
        for (boolean original : new boolean[] {false, true}) {
            check("pending preference change " + original, original && !forceOld,
                    PlaylistMinibar.floatingPlaylistMinibar(original));
        }
        AfterglowPrefs.setBool("playlistOldMinibar", false);
        for (boolean original : new boolean[] {false, true}) {
            check("pending reset " + original, original && !forceOld,
                    PlaylistMinibar.floatingPlaylistMinibar(original));
        }
        System.out.println(checks + " playlist minibar checks passed");
    }

    private static void unavailablePreferences(boolean firstNative) {
        InstalledTweaks.mark("miniplayer");
        AfterglowPrefs.setBool("playlistOldMinibar", true);
        AfterglowPrefs.failReads = true;
        check("failed first preference read preserves native choice", firstNative,
                PlaylistMinibar.floatingPlaylistMinibar(firstNative));
        check("failure is logged once", true, Afterglow.errors == 1);

        AfterglowPrefs.failReads = false;
        // Recovering storage must neither poison the class nor change the
        // architecture already chosen by another native playlist owner.
        for (boolean original : new boolean[] {false, true}) {
            check("recovered preferences retain native choice " + original, original,
                    PlaylistMinibar.floatingPlaylistMinibar(original));
        }
        check("latched failure is not retried", true, Afterglow.errors == 1);
        System.out.println(checks + " playlist minibar failure/recovery checks passed");
    }
}
