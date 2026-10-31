package app.morphe.extension.sabp;

import android.app.Service;
import android.content.Context;
import android.content.Intent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

/**
 * The only place the Eppy UI touches Smart AudioBook Player's own (obfuscated) code.
 *
 * <p>Methods marked "patched" are stubs: the "Eppy UI" bytecode patch replaces their bodies with
 * calls into SABP's PlayerService, using method references it resolves at patch time from code
 * paths that keep stable names (MyMediaBrowserService, which Android Auto uses, and the seek bar
 * callbacks of PlayerActivity). If a stub was not patched it returns a harmless default, so the
 * UI degrades instead of crashing.
 *
 * <p>Everything else goes through things SABP itself treats as public: the PlayerService intent
 * actions (also used by its notification, widgets and Wear OS), and its media session.
 */
@SuppressWarnings("unused")
public final class EppyBridge {
    public static final String SABP_PACKAGE = "ak.alizandro.smartaudiobookplayer";
    public static final String PLAYER_SERVICE = SABP_PACKAGE + ".PlayerService";
    public static final String PLAYER_ACTIVITY = SABP_PACKAGE + ".PlayerActivity";
    public static final String LIBRARY_ACTIVITY = SABP_PACKAGE + ".LibraryActivity";
    public static final String BOOKMARKS_ACTIVITY = SABP_PACKAGE + ".BookmarksActivity";
    public static final String SETTINGS_ACTIVITY = SABP_PACKAGE + ".PlayerSettingsActivity";
    public static final String STATS_ACTIVITY = SABP_PACKAGE + ".PlaybackStatisticsActivity";
    public static final String HISTORY_ACTIVITY = SABP_PACKAGE + ".HistoryActivity";
    public static final String CHARACTERS_ACTIVITY = SABP_PACKAGE + ".CharactersActivity";
    public static final String QUEUE_ACTIVITY = SABP_PACKAGE + ".BookQueueActivity";
    public static final String BOOK_STATE_CLASS = SABP_PACKAGE + ".BookData$BookState";

    // PlayerService intent actions (stable strings used by SABP's notification and widgets).
    public static final String ACTION_PLAY = SABP_PACKAGE + ".ActionPlay";
    public static final String ACTION_PAUSE = SABP_PACKAGE + ".ActionPause";
    public static final String ACTION_PLAY_PAUSE = SABP_PACKAGE + ".ActionPlayPause";
    public static final String ACTION_REWIND_SMALL = SABP_PACKAGE + ".ActionRewindSmall";
    public static final String ACTION_REWIND_BIG = SABP_PACKAGE + ".ActionRewindBig";
    public static final String ACTION_FWD_SMALL = SABP_PACKAGE + ".ActionFwdSmall";
    public static final String ACTION_FWD_BIG = SABP_PACKAGE + ".ActionFwdBig";
    public static final String ACTION_NEXT_FILE = SABP_PACKAGE + ".ActionNextFile";
    public static final String ACTION_PREV_FILE = SABP_PACKAGE + ".ActionPrevFile";
    public static final String ACTION_ADD_BOOKMARK = SABP_PACKAGE + ".ActionAddBookmark";
    public static final String ACTION_NEXT_BOOKMARK = SABP_PACKAGE + ".ActionNextBookmark";
    public static final String ACTION_ENABLE_SLEEP = SABP_PACKAGE + ".ActionEnableSleepTimer";
    public static final String ACTION_DISABLE_SLEEP = SABP_PACKAGE + ".ActionDisableSleepTimer";
    public static final String ACTION_TOGGLE_SPEED = SABP_PACKAGE + ".ActionToggleSpeed";
    public static final String ACTION_PLAY_FROM_MEDIA_ID = SABP_PACKAGE + ".AutoActionPlayFromMediaId";

    // Broadcasts PlayerService sends when things change.
    public static final String INTENT_BOOK_CHANGED = SABP_PACKAGE + ".BookChangedIntent";
    public static final String INTENT_FILE_CHANGED = SABP_PACKAGE + ".FileChangedIntent";
    public static final String INTENT_SLEEP_CHANGED = SABP_PACKAGE + ".UpdateSleepViewIntent";

    private static WeakReference<Service> playerService = new WeakReference<>(null);
    private static final ArrayList<Runnable> serviceListeners = new ArrayList<>();

    private EppyBridge() {
    }

    // ---- hooks called from SABP (injected by the patch) -----------------------------------

    /** Injected at the start of PlayerService.onCreate(). */
    public static void onPlayerServiceCreated(Service service) {
        playerService = new WeakReference<>(service);
        notifyServiceListeners();
    }

    /** Injected at the start of PlayerService.onDestroy(). */
    public static void onPlayerServiceDestroyed(Service service) {
        if (playerService.get() == service) {
            playerService = new WeakReference<>(null);
        }
        notifyServiceListeners();
    }

    private static void notifyServiceListeners() {
        ArrayList<Runnable> copy;
        synchronized (serviceListeners) {
            copy = new ArrayList<>(serviceListeners);
        }
        for (Runnable r : copy) {
            try {
                r.run();
            } catch (Throwable ignored) {
            }
        }
    }

    public static void addServiceListener(Runnable r) {
        synchronized (serviceListeners) {
            serviceListeners.add(r);
        }
    }

    public static void removeServiceListener(Runnable r) {
        synchronized (serviceListeners) {
            serviceListeners.remove(r);
        }
    }

    public static Service getPlayerService() {
        return playerService.get();
    }

    // ---- patched stubs ----------------------------------------------------------------------

    /** Patched: PlayerService's "books in this state" list (ArrayList of BookPath). */
    public static ArrayList<?> booksForState(Object service, Object bookState) {
        return null;
    }

    /** Patched: PlayerService's "cover keys for these books" list, input to {@link #loadCovers}. */
    public static ArrayList<?> coverKeys(Object service, ArrayList<?> bookPaths) {
        return null;
    }

    /** Patched: SABP's cover loader, returns an ArrayList of Bitmap (entries may be null). */
    public static ArrayList<?> loadCovers(Context context, ArrayList<?> coverKeys) {
        return null;
    }

    /** Patched: PlayerService call made when the user starts dragging the seek bar. */
    public static void seekTracking(Object service, boolean tracking) {
    }

    /** Patched: PlayerService call that moves to a position (seconds in the current file/chapter). */
    public static void seekToSeconds(Object service, int seconds) {
    }

    /** Patched: PlayerService's live position in the current file, in seconds (-1 if unknown). */
    public static int filePositionSeconds(Object service) {
        return -1;
    }

    /**
     * Patched: PlayerService's jump-to method, the one SABP's bookmarks, history and chapter
     * dialog use. Opens fileName at the given second; resume=true keeps playing.
     */
    public static void jumpTo(Object service, String fileName, int seconds, boolean resume) {
    }

    /** Patched: SABP's bookmark loader (reads bookmarks.sabp.xml from the book folder). */
    public static ArrayList<?> loadBookmarks(Context context, String folderUri) {
        return null;
    }

    /** Patched: SABP's bookmark writer. */
    public static void saveBookmarks(Context context, ArrayList<?> bookmarks, String folderUri) {
    }

    /** Patched: SABP's character list loader (characters.sabp.xml, ArrayList of CharacterDescription). */
    public static ArrayList<?> loadCharacters(Context context, String folderUri) {
        return null;
    }

    /** Patched: SABP's character list writer. */
    public static void saveCharacters(Context context, ArrayList<?> characters, String folderUri) {
    }

    /** Patched: PlayerService's speed setter (speed, skip-silence level 0–5). Range 0.5–3.0. */
    public static void setSpeed(Object service, float speed, int skipSilence) {
    }

    /** Patched: PlayerService's sleep-timer countdown text ("" when off), e.g. "9:58". */
    public static String sleepRemaining(Object service) {
        return null;
    }

    /** Patched: volume boost level (-1 quieter, 0 off, 1–3 louder), as the classic boost button sets it. */
    public static void setBoost(Object service, int level) {
    }

    /** Patched: show ID3 titles instead of file names for the current book. */
    public static void setId3Titles(Object service, boolean on) {
    }

    /** Patched: equalizer for the current book (an EqualizerLevels, or null for flat). */
    public static void setEqualizer(Object service, Object levels) {
    }

    /** Patched: repeat mode for the current book (a RepeatSettings, or null for off). */
    public static void setRepeat(Object service, Object repeat) {
    }

    /** Patched: skip-start/end seconds for the current book (a SkipStartEndSettings). */
    public static void setSkipStartEnd(Object service, Object settings) {
    }

    /** Patched: which SABP targets the patch found, "name=ok;name=missing: why". */
    public static String hookReport() {
        return "";
    }

    /** True when the patch found the named SABP target (see {@link #hookReport()}). */
    public static boolean has(String hook) {
        String r = hookReport();
        if (r == null || r.isEmpty()) return isLinked();
        for (String e : r.split(";")) {
            int eq = e.indexOf('=');
            if (eq > 0 && e.substring(0, eq).equals(hook)) return e.substring(eq + 1).equals("ok");
        }
        return false;
    }

    /** Patched: true when the patch filled in the stubs above. */
    public static boolean isLinked() {
        return false;
    }

    /**
     * Runtime check of every bridge call against the running SABP (Settings → Diagnostics).
     * Patch-time checks only prove the methods exist; this proves they work on this device.
     */
    public static String selfCheck(Context c) {
        StringBuilder b = new StringBuilder();
        b.append("Bridge patched: ").append(isLinked() ? "yes" : "NO (patch didn't apply stubs)").append('\n');
        Service s = getPlayerService();
        b.append("Player service: ").append(s != null ? "running" : "not running (start a book)").append('\n');
        if (s != null) {
            try {
                b.append("File position: ").append(filePositionSeconds(s)).append(" s\n");
            } catch (Throwable t) {
                b.append("File position: FAILED ").append(t).append('\n');
            }
            try {
                Object started = Enum.valueOf((Class) Class.forName(BOOK_STATE_CLASS), "Started");
                ArrayList<?> books = booksForState(s, started);
                b.append("Library (in progress): ").append(books != null ? books.size() + " books" : "null").append('\n');
            } catch (Throwable t) {
                b.append("Library: FAILED ").append(t).append('\n');
            }
            try {
                EppyBook book = EppyBook.current();
                b.append("Book layout: ").append(book == null ? "no book loaded" : book.files.size() + " files, " + book.chapters.size()
                        + " chapters, " + (book.total > 0 ? book.total + " s" : "length unknown")).append('\n');
                if (book != null) {
                    ArrayList<?> marks = loadBookmarks(c, book.folderUri);
                    b.append("Bookmarks file: ").append(marks != null ? marks.size() + " bookmarks" : "null").append('\n');
                }
            } catch (Throwable t) {
                b.append("Book/bookmarks: FAILED ").append(t).append('\n');
            }
        }
        b.append("Player interface: ").append(EppyRoute.playerInterface(c)).append('\n');
        b.append("Speech matching: ").append(app.morphe.extension.sabp.read.SpeechSync.supported(c) ? "available on this device" : "not available (needs Android 13+ and an on-device model)").append('\n');
        try {
            app.morphe.extension.sabp.read.Transcriber tr = app.morphe.extension.sabp.read.Transcriber.get(c);
            b.append("Speech engine: ").append(app.morphe.extension.sabp.read.Whisper.available()
                    ? app.morphe.extension.sabp.read.Whisper.libraryName() + ", model " + (tr.modelReady() ? tr.model().id : "not downloaded")
                    + ", " + tr.state() + (tr.speedLabel() != null ? ", " + tr.speedLabel() : "")
                    : "not loaded (" + app.morphe.extension.sabp.read.Whisper.loadError() + ")");
        } catch (Throwable t) {
            b.append("Speech engine: ").append(t);
        }
        return b.toString();
    }

    // ---- public-API helpers ---------------------------------------------------------------

    public static Intent serviceIntent(Context context, String action) {
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), PLAYER_SERVICE);
        if (action != null) intent.setAction(action);
        return intent;
    }

    /** Sends one of PlayerService's intent actions. */
    public static void send(Context context, String action) {
        try {
            context.startService(serviceIntent(context, action));
        } catch (Throwable t) {
            try {
                context.startForegroundService(serviceIntent(context, action));
            } catch (Throwable ignored) {
            }
        }
    }

    /** Starts playing a book. mediaId is the book folder URI (BookPath.mFolderUri). */
    public static void playBook(Context context, String folderUri) {
        Intent intent = serviceIntent(context, ACTION_PLAY_FROM_MEDIA_ID);
        intent.putExtra("mediaId", folderUri);
        try {
            context.startForegroundService(intent);
        } catch (Throwable ignored) {
        }
    }

    public static Intent activityIntent(Context context, String className) {
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), className);
        return intent;
    }
}
