package app.ckzombies.extension;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.os.Environment;

import java.io.File;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Locale;

/**
 * Tells the player what is wrong with the OBB instead of trying to download it.
 *
 * When the game finds no OBB, its resource screen (ResFileDownloadView) asks Google Play and then
 * Glu's rpack.glu.com, which no longer exists, for the file, and ends on "Download failed. Could
 * not connect to server." The screen calls route() on every change of its state. Once the flow
 * heads for a download, route() looks at the OBB folder the same way the game does and sends the
 * screen to its error page with a message that says what it found there. exitOnly() then leaves
 * that page a single, smaller Exit button: Retry would only have tried the dead download again.
 */
@SuppressWarnings("unused")
public final class ObbCheck {

    /** ResFileDownloadView's error page: m_downloadError above Retry and Exit. */
    static final int STATE_ERROR = 9;
    /**
     * The states on the way to a download: 2 checksums unpacked resources, 4 and 10 ask Google
     * Play for a download link, 5 and 7 download, 6 is where Retry and "Preparing..." lead.
     */
    private static final int[] DOWNLOAD_STATES = {2, 4, 5, 6, 7, 10};

    /** The widget ids createPromptLayout() gives the error page's two buttons. */
    static final int RETRY_BUTTON = 6;
    static final int EXIT_BUTTON = 7;

    /** How many entries of the OBB folder the message lists before it only counts the rest. */
    static final int LISTED = 4;

    private static String message;

    private ObbCheck() {
    }

    /**
     * Called by ResFileDownloadView.newState() with the state it is about to enter; returns the
     * state to enter instead. [expectedSize] is GluDownloadResMgr.getSpecialFileSize().
     */
    public static int route(Context context, int state, int expectedSize) {
        try {
            return route(context, state, expectedSize, Environment.getExternalStorageDirectory());
        } catch (Throwable ignored) {
            return state;
        }
    }

    /** [storage] is where the game builds its paths from: Environment.getExternalStorageDirectory(). */
    static synchronized int route(Context context, int state, int expectedSize, File storage) {
        try {
            if (context == null || storage == null || expectedSize <= 0
                    || !(isDownloadState(state) || state == STATE_ERROR)) {
                return state;
            }
            String pkg = context.getPackageName();
            if (Build.VERSION.SDK_INT >= 11) {
                // Asking for the folder makes Android create it for the game, or hand it back to
                // the game when another app made it (see ExternalStorage).
                context.getObbDir();
            }
            File obb = new File(storage, "Android/obb/" + pkg);
            File[] obbEntries = obb.listFiles();
            boolean found = match(obbEntries, expectedSize, true) != null
                    || match(new File(storage, "Android/data/" + pkg + "/files").listFiles(), expectedSize, false) != null
                    || match(context.getDir("fixme", Context.MODE_PRIVATE).listFiles(), expectedSize, false) != null;
            if (explains(state, found)) {
                message = describe("Android/obb/" + pkg + "/", obb.exists(), obbEntries, expectedSize);
            }
            return decide(state);
        } catch (Throwable ignored) {
            // Glu's own flow then runs as before and ends on its own message.
            return state;
        }
    }

    /** The message for the error page, once; null when route() did not write one. */
    public static synchronized String takeMessage() {
        String taken = message;
        message = null;
        return taken;
    }

    static boolean isDownloadState(int state) {
        for (int s : DOWNLOAD_STATES) {
            if (s == state) {
                return true;
            }
        }
        return false;
    }

    /** Every way to a download ends on the error page instead; other states go on as they were. */
    static int decide(int state) {
        return isDownloadState(state) ? STATE_ERROR : state;
    }

    /**
     * Whether the error page shows this class's message: always instead of a download, and on an
     * error page the game reached by itself only when the OBB is missing.
     */
    static boolean explains(int state, boolean found) {
        return isDownloadState(state) || state == STATE_ERROR && !found;
    }

    /**
     * The file the game would take, as GluDownloadResMgr.findGPKFileInDir() picks it: the exact
     * size, and in every folder but the OBB one also a .gpk or .obb name.
     */
    static File match(File[] entries, long expectedSize, boolean anyName) {
        if (entries == null) {
            return null;
        }
        for (File entry : entries) {
            String path = entry.getAbsolutePath();
            if ((anyName || path.endsWith(".gpk") || path.endsWith(".obb")) && entry.length() == expectedSize) {
                return entry;
            }
        }
        return null;
    }

    /** [entries] is null when the folder cannot be listed. */
    static String describe(String folder, boolean exists, File[] entries, long expectedSize) {
        StringBuilder text = new StringBuilder()
                .append("The game data file (OBB) was not found.\n\n")
                .append("Copy it into\n").append(folder).append('\n')
                .append("It must be exactly ").append(bytes(expectedSize)).append(".\n\n");
        if (!exists) {
            text.append("That folder does not exist.");
        } else if (entries == null) {
            text.append("That folder exists, but Android does not let the game read it.");
        } else if (entries.length == 0) {
            text.append("That folder is empty.");
        } else {
            text.append("That folder has:");
            for (int i = 0; i < entries.length && i < LISTED; i++) {
                File entry = entries[i];
                text.append('\n').append(entry.getName()).append(entry.isDirectory()
                        ? " (folder)"
                        : " (" + bytes(entry.length()) + ")");
            }
            if (entries.length > LISTED) {
                text.append("\nand ").append(entries.length - LISTED).append(" more");
            }
        }
        return text.append("\n\nThen open the game again.").toString();
    }

    static String bytes(long n) {
        return String.format(Locale.US, "%,d bytes", n);
    }

    /**
     * Called right after the error page is laid out. Takes Retry out of the view's widgets and
     * narrows Exit to a third of the screen, centred, and to two thirds of its height, centred in
     * the row. The widgets are Glu's (ResFileDownloadView$GluButton and its GluWidget base), read
     * through their public fields; if any is missing the page stays as Glu laid it out.
     */
    public static void exitOnly(Object view) {
        try {
            List<?> widgets = (List<?>) field(view, "m_widgets").get(view);
            Object retry = null;
            Object exit = null;
            for (Object widget : widgets) {
                int id = field(widget, "m_widgetID").getInt(widget);
                if (id == RETRY_BUTTON) {
                    retry = widget;
                } else if (id == EXIT_BUTTON) {
                    exit = widget;
                }
            }
            if (retry == null || exit == null) {
                return;
            }
            int screenWidth = field(view, "m_screenWidth").getInt(view);
            int top = field(exit, "m_y").getInt(exit);
            int width = screenWidth / 3;
            exit.getClass().getMethod("setBounds", int.class, int.class, int.class, int.class)
                    .invoke(exit, (screenWidth - width) / 2, top, width, 0);

            // setBounds() gives every button the same fixed height; shorten this one around its middle.
            int bottom = field(exit, "m_dy").getInt(exit);
            int[] rows = shorten(top, bottom);
            field(exit, "m_y").setInt(exit, rows[0]);
            field(exit, "m_dy").setInt(exit, rows[1]);
            Rect rect = (Rect) field(exit, "m_rectBounds").get(exit);
            rect.top = rows[0];
            rect.bottom = rows[1];
            widgets.remove(retry);
        } catch (Throwable ignored) {
            // Glu's two buttons stay; both still work.
        }
    }

    /** [top, bottom] of a button two thirds as tall as top..bottom, centred on it. */
    static int[] shorten(int top, int bottom) {
        int height = bottom - top + 1;
        int shorter = height * 2 / 3;
        int newTop = top + (height - shorter) / 2;
        return new int[] {newTop, newTop + shorter - 1};
    }

    private static Field field(Object owner, String name) throws NoSuchFieldException {
        Field field = owner.getClass().getField(name);
        field.setAccessible(true);
        return field;
    }

    /** For the tests: forgets what an earlier route() left behind. */
    static synchronized void reset() {
        message = null;
    }
}
