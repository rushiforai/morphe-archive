package app.morphe.extension.sabp;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Live playback state and library for the Eppy UI.
 *
 * <p>Playback state comes from SABP's own media session (the same one the notification, lock
 * screen, Android Auto and Wear OS read). Commands go through PlayerService intent actions.
 */
public final class EppyPlayer {

    public interface Listener {
        /** Playback state, position or metadata changed. */
        void onPlaybackChanged();

        /** The library lists or covers changed. */
        void onLibraryChanged();
    }

    public static final int STATE_STARTED = 0;
    public static final int STATE_NEW = 1;
    public static final int STATE_FINISHED = 2;
    private static final String[] STATE_NAMES = {"Started", "New", "Finished"};

    public static final class Book {
        public final String folderUri;
        public final String title;
        public final int state;
        public Bitmap cover;
        /** From SABP's BookData when available: epoch ms, seconds, epoch ms (0/-1 = unknown). */
        public long lastPlayed;
        public int position = -1, length = -1;
        public long added;

        /** 0..1, or -1 when unknown. */
        public float progress() {
            return length > 0 && position >= 0 ? Math.min(1f, position / (float) length) : -1f;
        }

        Book(String folderUri, String title, int state) {
            this.folderUri = folderUri;
            this.title = title;
            this.state = state;
        }
    }

    private static EppyPlayer instance;

    public static EppyPlayer get(Context context) {
        if (instance == null) instance = new EppyPlayer(context.getApplicationContext());
        return instance;
    }

    private final Context app;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private final ArrayList<Listener> listeners = new ArrayList<>();
    private final List<List<Book>> shelves = new ArrayList<>();

    private MediaController controller;
    private boolean bound;
    private boolean libraryLoading;
    private long libraryLoadedAt;

    private final MediaController.Callback controllerCallback = new MediaController.Callback() {
        @Override
        public void onPlaybackStateChanged(PlaybackState state) {
            dispatchPlayback();
        }

        @Override
        public void onMetadataChanged(MediaMetadata metadata) {
            dispatchPlayback();
        }

        @Override
        public void onSessionDestroyed() {
            controller = null;
            dispatchPlayback();
        }
    };

    private final ServiceConnection connection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder binder) {
            attach();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            detachController();
        }
    };

    private final Runnable serviceListener = () -> main.post(this::attach);

    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (EppyBridge.INTENT_BOOK_CHANGED.equals(action)) {
                refreshLibrary(true);
            }
            dispatchPlayback();
        }
    };

    private EppyPlayer(Context app) {
        this.app = app;
        for (int i = 0; i < 3; i++) shelves.add(new ArrayList<>());
        EppyBridge.addServiceListener(serviceListener);
    }

    // ---- lifecycle --------------------------------------------------------------------------

    /** Called from the UI's onStart. Starts and binds PlayerService the same way PlayerActivity does. */
    public void start() {
        if (!bound) {
            try {
                Intent intent = EppyBridge.serviceIntent(app, null);
                app.startForegroundService(intent);
                bound = app.bindService(intent, connection, Context.BIND_AUTO_CREATE);
            } catch (Throwable ignored) {
            }
            IntentFilter filter = new IntentFilter();
            filter.addAction(EppyBridge.INTENT_BOOK_CHANGED);
            filter.addAction(EppyBridge.INTENT_FILE_CHANGED);
            filter.addAction(EppyBridge.INTENT_SLEEP_CHANGED);
            try {
                app.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
            } catch (Throwable ignored) {
            }
        }
        attach();
        refreshLibrary(false);
    }

    /** Called from the UI's onStop. */
    public void stop() {
        if (bound) {
            try {
                app.unbindService(connection);
            } catch (Throwable ignored) {
            }
            try {
                app.unregisterReceiver(receiver);
            } catch (Throwable ignored) {
            }
            bound = false;
        }
        detachController();
    }

    public void addListener(Listener l) {
        if (!listeners.contains(l)) listeners.add(l);
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }

    private void dispatchPlayback() {
        main.post(() -> {
            for (Listener l : new ArrayList<>(listeners)) l.onPlaybackChanged();
        });
    }

    private void dispatchLibrary() {
        main.post(() -> {
            for (Listener l : new ArrayList<>(listeners)) l.onLibraryChanged();
        });
    }

    // ---- media session ------------------------------------------------------------------------

    private void attach() {
        if (controller != null) return;
        Service service = EppyBridge.getPlayerService();
        if (service == null) return;
        MediaSession.Token token = findSessionToken(service);
        if (token == null) return;
        try {
            controller = new MediaController(app, token);
            controller.registerCallback(controllerCallback, main);
            dispatchPlayback();
            refreshLibrary(false);
        } catch (Throwable ignored) {
            controller = null;
        }
    }

    private void detachController() {
        if (controller != null) {
            try {
                controller.unregisterCallback(controllerCallback);
            } catch (Throwable ignored) {
            }
            controller = null;
        }
    }

    /**
     * Finds PlayerService's session token without relying on obfuscated names: the no-arg method
     * returning androidx MediaSessionCompat.Token (a Parcelable whose class name is kept), parcelled
     * to recover the framework MediaSession.Token it wraps.
     */
    private static MediaSession.Token findSessionToken(Service service) {
        try {
            for (Method m : service.getClass().getDeclaredMethods()) {
                if (m.getParameterTypes().length != 0) continue;
                Class<?> type = m.getReturnType();
                if (type == MediaSession.Token.class) {
                    m.setAccessible(true);
                    return (MediaSession.Token) m.invoke(service);
                }
                if (type.getName().endsWith("MediaSessionCompat$Token") && Parcelable.class.isAssignableFrom(type)) {
                    m.setAccessible(true);
                    Object compat = m.invoke(service);
                    if (compat == null) return null;
                    Parcel parcel = Parcel.obtain();
                    try {
                        ((Parcelable) compat).writeToParcel(parcel, 0);
                        parcel.setDataPosition(0);
                        Object inner = parcel.readParcelable(MediaSession.Token.class.getClassLoader());
                        if (inner instanceof MediaSession.Token) return (MediaSession.Token) inner;
                    } finally {
                        parcel.recycle();
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public boolean hasSession() {
        return controller != null && controller.getMetadata() != null;
    }

    public boolean isPlaying() {
        PlaybackState s = controller != null ? controller.getPlaybackState() : null;
        return s != null && s.getState() == PlaybackState.STATE_PLAYING;
    }

    /** Book (folder) name. SABP puts it in ALBUM. */
    /**
     * The book's name. SABP's media-session fields change meaning with its notification setting
     * ("author and book title" puts the author in ALBUM and the book in TITLE; otherwise TITLE is
     * the file/chapter), so the library entry for the playing folder comes first.
     */
    public String bookTitle() {
        MediaMetadata m = controller != null ? controller.getMetadata() : null;
        if (m == null) return null;
        Book lib = find(currentFolderUri());
        if (lib != null && lib.title != null && !lib.title.trim().isEmpty()) return lib.title.trim();
        String album = m.getString(MediaMetadata.METADATA_KEY_ALBUM);
        if (album != null && !album.trim().isEmpty()) return album.trim();
        return m.getString(MediaMetadata.METADATA_KEY_TITLE);
    }

    /** Current chapter or file name. */
    /** The current chapter (embedded chapter or file) from the book layout, else the session title. */
    public String chapterTitle() {
        EppyBook b = book();
        if (b != null && !b.chapters.isEmpty()) {
            int idx = b.chapterIndexAt((int) bookPositionSeconds(), (int) filePositionSeconds());
            if (idx >= 0) {
                String t = b.chapters.get(idx).title;
                if (t != null && !t.trim().isEmpty()) return t.trim();
            }
        }
        MediaMetadata m = controller != null ? controller.getMetadata() : null;
        String t = m != null ? m.getString(MediaMetadata.METADATA_KEY_TITLE) : null;
        String book = bookTitle();
        return t != null && book != null && t.trim().equals(book) ? null : t;
    }

    /**
     * Position and length of the current chapter in ms ({pos, len}), or null when the layout
     * isn't known. SABP's session reports either the file or the whole book depending on its
     * progress setting, so the player uses this for its seek bar.
     */
    public long[] chapterProgressMs() {
        EppyBook b = book();
        double pos = bookPositionSeconds();
        if (b == null || pos < 0 || b.chapters.isEmpty()) return null;
        int idx = b.chapterIndexAt((int) pos, (int) filePositionSeconds());
        if (idx < 0) return null;
        EppyBook.ChapterItem ch = b.chapters.get(idx);
        int len = ch.length;
        if (len <= 0 && idx + 1 < b.chapters.size() && b.chapters.get(idx + 1).start > ch.start) len = b.chapters.get(idx + 1).start - ch.start;
        if (len <= 0 && b.total > ch.start && idx == b.chapters.size() - 1) len = b.total - ch.start;
        if (ch.start < 0 || len <= 0) return null;
        // Extrapolate between position reads while playing.
        long p = (long) ((pos - ch.start) * 1000);
        return new long[]{Math.max(0, Math.min(len * 1000L, p)), len * 1000L, ch.start};
    }

    public Bitmap cover() {
        MediaMetadata m = controller != null ? controller.getMetadata() : null;
        if (m == null) return null;
        Bitmap b = m.getBitmap(MediaMetadata.METADATA_KEY_ART);
        if (b == null) b = m.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
        return b;
    }

    /** Duration of the current chapter/file in ms. */
    public long durationMs() {
        MediaMetadata m = controller != null ? controller.getMetadata() : null;
        return m != null ? Math.max(0, m.getLong(MediaMetadata.METADATA_KEY_DURATION)) : 0;
    }

    /** Position in the current chapter/file in ms, extrapolated while playing. */
    public long positionMs() {
        PlaybackState s = controller != null ? controller.getPlaybackState() : null;
        if (s == null) return 0;
        long pos = s.getPosition();
        if (s.getState() == PlaybackState.STATE_PLAYING) {
            long elapsed = SystemClock.elapsedRealtime() - s.getLastPositionUpdateTime();
            pos += (long) (elapsed * s.getPlaybackSpeed());
        }
        long d = durationMs();
        if (d > 0) pos = Math.min(pos, d);
        return Math.max(0, pos);
    }

    public float speed() {
        PlaybackState s = controller != null ? controller.getPlaybackState() : null;
        float sp = s != null ? s.getPlaybackSpeed() : 1f;
        return sp > 0 ? sp : 1f;
    }

    /** Book-level progress 0..1 from SABP's BookData caches, or -1 when unknown. */
    public float bookProgress() {
        Object bookData = currentBookData();
        if (bookData == null) return -1;
        int current = intField(bookData, "mCurrentPlaybackTimeCache");
        int total = intField(bookData, "mTotalPlaybackTimeCache");
        if (total <= 0) return -1;
        return Math.max(0f, Math.min(1f, current / (float) total));
    }

    /** Remaining time of the whole book in seconds, or -1. */
    public int bookRemainingSeconds() {
        Object bookData = currentBookData();
        if (bookData == null) return -1;
        int current = intField(bookData, "mCurrentPlaybackTimeCache");
        int total = intField(bookData, "mTotalPlaybackTimeCache");
        return total > 0 ? Math.max(0, total - current) : -1;
    }

    public String currentFolderUri() {
        Object bookData = currentBookData();
        if (bookData == null) return null;
        Object v = field(bookData, "mFolderUri");
        return v instanceof String ? (String) v : null;
    }

    private Object currentBookData() {
        Service service = EppyBridge.getPlayerService();
        if (service == null) return null;
        try {
            for (Field f : service.getClass().getDeclaredFields()) {
                if (f.getType().getName().equals(EppyBridge.SABP_PACKAGE + ".BookData")) {
                    f.setAccessible(true);
                    return f.get(service);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Field libraryListField, libraryHolderField;

    /**
     * Every BookData in SABP's library (a copy). Found by shape, not by obfuscated name: the
     * PlayerService field whose object holds an ArrayList of BookData. Main thread only.
     */
    public static List<Object> allBookData(Service service) {
        ArrayList<Object> out = new ArrayList<>();
        if (service == null) return out;
        try {
            if (libraryHolderField == null) {
                String bookData = EppyBridge.SABP_PACKAGE + ".BookData";
                outer:
                for (Field hf : service.getClass().getDeclaredFields()) {
                    if (hf.getType().isPrimitive() || hf.getType().getName().startsWith("java.") || hf.getType().getName().startsWith("android.")) continue;
                    hf.setAccessible(true);
                    Object holder = hf.get(service);
                    if (holder == null) continue;
                    for (Field lf : holder.getClass().getDeclaredFields()) {
                        if (!java.util.List.class.isAssignableFrom(lf.getType())) continue;
                        lf.setAccessible(true);
                        Object v = lf.get(holder);
                        if (v instanceof List && !((List<?>) v).isEmpty()
                                && ((List<?>) v).get(0) != null && ((List<?>) v).get(0).getClass().getName().equals(bookData)) {
                            libraryHolderField = hf;
                            libraryListField = lf;
                            break outer;
                        }
                    }
                }
            }
            if (libraryHolderField == null) return out;
            Object holder = libraryHolderField.get(service);
            Object list = holder != null ? libraryListField.get(holder) : null;
            if (list instanceof List) out.addAll((List<?>) list);
        } catch (Throwable t) {
            EppyDiag.log("library", "BookData list not reachable: " + t);
        }
        return out;
    }

    private static Object field(Object o, String name) {
        try {
            Field f = o.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(o);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int intField(Object o, String name) {
        Object v = field(o, name);
        return v instanceof Integer ? (Integer) v : 0;
    }

    // ---- speed (SABP's engine: 0.5–3.0, skip silence 0–5) -----------------------------------

    public static final float MIN_SPEED = 0.5f, MAX_SPEED = 3.0f;
    public static final float[] SPEED_PRESETS = {0.5f, 0.75f, 1.0f, 1.1f, 1.2f, 1.25f, 1.5f, 1.75f, 2.0f, 2.5f, 3.0f};

    /** The current book's speed from SABP's BookData (falls back to the session's). */
    public float bookSpeed() {
        Object bd = currentBookData();
        Object v = bd != null ? field(bd, "mPlaybackSpeed") : null;
        if (v instanceof Float && (Float) v > 0) return (Float) v;
        return speed();
    }

    /** Skip-silence level 0 (off) – 5 of the current book. */
    public int skipSilence() {
        Object bd = currentBookData();
        return bd != null ? Math.max(0, Math.min(5, intField(bd, "mSkipSilence"))) : 0;
    }

    public boolean canSetSpeed() {
        return EppyBridge.getPlayerService() != null && EppyBridge.has("speed");
    }

    /** Sets speed (clamped to SABP's range, 0.05 steps) and skip silence through PlayerService. */
    public boolean setSpeed(float speed, int skipSilence) {
        Service service = EppyBridge.getPlayerService();
        if (service == null || !EppyBridge.has("speed")) return false;
        final float sp = Math.round(Math.max(MIN_SPEED, Math.min(MAX_SPEED, speed)) * 20f) / 20f;
        final int sk = Math.max(0, Math.min(5, skipSilence));
        main.post(() -> {
            try {
                EppyBridge.setSpeed(service, sp, sk);
            } catch (Throwable t) {
                EppyDiag.error("speed", "set speed failed: " + t);
            }
            dispatchPlayback();
        });
        EppyDiag.log("speed", sp + "× skip " + sk);
        return true;
    }

    /** Next speed in the cycle (favourites if set, else all presets), wrapping to the start. */
    public float nextSpeed(float[] cycle) {
        float cur = bookSpeed();
        for (float f : cycle) if (f > cur + 0.001f) return f;
        return cycle[0];
    }

    // ---- sleep timer (SABP's own, running in its service) ---------------------------------------

    public boolean sleepActive() {
        return SabpPrefs.sleepActive(app);
    }

    /** Countdown text from PlayerService ("9:58"), "" when not counting, null if unavailable. */
    public String sleepRemaining() {
        Service service = EppyBridge.getPlayerService();
        if (service == null || !EppyBridge.has("sleepRemaining")) return null;
        try {
            return EppyBridge.sleepRemaining(service);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Starts (or restarts) SABP's timer with a duration in minutes; -1 = end of chapter/file. */
    public void startSleep(int minutes) {
        restoreSleepDefault();
        SabpPrefs.setSleepMinutes(app, minutes);
        command(EppyBridge.ACTION_ENABLE_SLEEP);
        EppyDiag.log("sleep", "start " + (minutes < 0 ? "end of chapter" : minutes + " min"));
    }

    public void stopSleep() {
        command(EppyBridge.ACTION_DISABLE_SLEEP);
        restoreSleepDefault();
    }

    /**
     * Adds minutes to a running timer. SABP's timer counts its configured length from the moment
     * it starts, so this restarts it with (time left + extra) and remembers the user's normal
     * length, which is put back when the timer is next stopped or started.
     */
    public void extendSleep(int extraMinutes) {
        String rem = sleepRemaining();
        int leftMin = parseMinutes(rem);
        int base = SabpPrefs.sleepMinutes(app);
        if (leftMin < 0) leftMin = Math.max(0, base);
        android.content.SharedPreferences p = EppyTheme.prefs(app);
        if (!p.contains("sleepRestore")) p.edit().putInt("sleepRestore", base).apply();
        SabpPrefs.setSleepMinutes(app, leftMin + extraMinutes);
        command(EppyBridge.ACTION_ENABLE_SLEEP);
        EppyDiag.log("sleep", "extend to " + (leftMin + extraMinutes) + " min");
    }

    /** Puts back the user's normal timer length after an extension, if any. */
    public void restoreSleepDefault() {
        android.content.SharedPreferences p = EppyTheme.prefs(app);
        if (p.contains("sleepRestore")) {
            SabpPrefs.setSleepMinutes(app, p.getInt("sleepRestore", 10));
            p.edit().remove("sleepRestore").apply();
        }
    }

    /** "12:34" → 13 (rounded up), "" or null → -1. */
    static int parseMinutes(String mmss) {
        if (mmss == null || mmss.isEmpty()) return -1;
        try {
            String[] parts = mmss.trim().split(":");
            int secs = 0;
            for (String part : parts) secs = secs * 60 + Integer.parseInt(part.trim());
            return (secs + 59) / 60;
        } catch (Throwable t) {
            return -1;
        }
    }

    // ---- commands -------------------------------------------------------------------------

    public void playPause() {
        EppyBridge.send(app, EppyBridge.ACTION_PLAY_PAUSE);
    }

    public void command(String action) {
        EppyBridge.send(app, action);
    }

    public void playBook(Book book) {
        EppyBridge.playBook(app, book.folderUri);
    }

    public void seekTo(long ms) {
        Service service = EppyBridge.getPlayerService();
        if (service == null || !EppyBridge.isLinked()) return;
        main.post(() -> {
            try {
                EppyBridge.seekTracking(service, true);
                EppyBridge.seekToSeconds(service, (int) (ms / 1000));
                EppyBridge.seekTracking(service, false);
            } catch (Throwable ignored) {
            }
            dispatchPlayback();
        });
    }

    // ---- whole-book position, chapters, jumping ---------------------------------------------

    private EppyBook book;
    private long bookReadAt;
    private int lastFilePos = -1;
    private long lastFilePosAt;

    /** The current book's files/chapters, refreshed at most every 2 s or when the file changes. */
    public EppyBook book() {
        long now = SystemClock.elapsedRealtime();
        if (book == null || now - bookReadAt > 2000) {
            try {
                EppyBook b = EppyBook.current();
                if (b != null || book == null) book = b;
            } catch (Throwable ignored) {
            }
            bookReadAt = now;
        }
        return book;
    }

    public void invalidateBook() {
        bookReadAt = 0;
    }

    /** Live position in the current file (seconds, fractional while playing), or -1. */
    public double filePositionSeconds() {
        Service service = EppyBridge.getPlayerService();
        if (service == null) return -1;
        int p;
        try {
            p = EppyBridge.filePositionSeconds(service);
        } catch (Throwable t) {
            p = -1;
        }
        if (p < 0) return -1;
        long now = SystemClock.elapsedRealtime();
        if (p != lastFilePos) {
            lastFilePos = p;
            lastFilePosAt = now;
        }
        double frac = isPlaying() ? Math.min(0.99, (now - lastFilePosAt) / 1000.0 * speed()) : 0;
        return p + frac;
    }

    /** Live position in the whole book (seconds), or -1 when the book layout is unknown. */
    public double bookPositionSeconds() {
        EppyBook b = book();
        double fp = filePositionSeconds();
        if (b == null || fp < 0) return -1;
        EppyBook.FileItem f = b.file(b.currentFile);
        if (f == null || f.start < 0) return -1;
        return f.start + fp;
    }

    /** Jumps to a file and position, like SABP's bookmarks and chapter list do. */
    public boolean jumpTo(String fileName, int seconds) {
        return jumpTo(fileName, seconds, true);
    }

    /** resume=false leaves playback paused after the jump (SABP pauses while it moves). */
    public boolean jumpTo(String fileName, int seconds, boolean resume) {
        Service service = EppyBridge.getPlayerService();
        if (service == null || fileName == null || !EppyBridge.isLinked() || !EppyBridge.has("jump")) return false;
        main.post(() -> {
            try {
                EppyBridge.jumpTo(service, fileName, Math.max(0, seconds), resume);
            } catch (Throwable ignored) {
            }
            invalidateBook();
            dispatchPlayback();
        });
        return true;
    }

    /** Jumps to a whole-book position. */
    public boolean jumpToBook(double seconds) {
        return jumpToBook(seconds, true);
    }

    public boolean jumpToBook(double seconds, boolean resume) {
        EppyBook b = book();
        if (b == null) return false;
        Object[] loc = b.locate((int) Math.round(seconds));
        return loc != null && jumpTo((String) loc[0], (Integer) loc[1], resume);
    }

    /**
     * Seeks by a relative amount across file and chapter boundaries, clamped to the book, keeping
     * the current play/pause state. Falls back to SABP's own small rewind/forward when the book
     * layout isn't known.
     */
    public boolean seekBy(int deltaSeconds) {
        EppyBook b = book();
        double pos = bookPositionSeconds();
        if (b == null || pos < 0 || b.total <= 0) {
            command(deltaSeconds < 0 ? EppyBridge.ACTION_REWIND_SMALL : EppyBridge.ACTION_FWD_SMALL);
            return false;
        }
        double target = Math.max(0, Math.min(b.total - 1, pos + deltaSeconds));
        Object[] loc = b.locate((int) Math.round(target));
        if (loc == null) return false;
        return jumpTo((String) loc[0], (Integer) loc[1], isPlaying());
    }

    /** Next (+1) or previous (-1) chapter; previous restarts the current one if >3 s in. */
    public boolean skipChapter(int dir) {
        EppyBook b = book();
        if (b == null || b.chapters.size() < 2) {
            command(dir > 0 ? EppyBridge.ACTION_NEXT_FILE : EppyBridge.ACTION_PREV_FILE);
            return false;
        }
        int pos = (int) bookPositionSeconds();
        int idx = b.chapterIndexAt(pos, (int) filePositionSeconds());
        int target;
        if (dir > 0) target = idx + 1;
        else {
            EppyBook.ChapterItem cur = idx >= 0 ? b.chapters.get(idx) : null;
            boolean intoChapter = cur != null && cur.start >= 0 && pos >= 0 && pos - cur.start > 3;
            target = intoChapter ? idx : idx - 1;
        }
        if (target < 0 || target >= b.chapters.size()) return false;
        EppyBook.ChapterItem ch = b.chapters.get(target);
        return jumpTo(ch.fileName, ch.positionInFile, isPlaying());
    }

    public Context context() {
        return app;
    }

    public boolean canSeek() {
        return EppyBridge.isLinked() && EppyBridge.getPlayerService() != null;
    }

    // ---- library ------------------------------------------------------------------------------

    public List<Book> shelf(int state) {
        return shelves.get(state);
    }

    public List<Book> allBooks() {
        ArrayList<Book> all = new ArrayList<>();
        for (List<Book> s : shelves) all.addAll(s);
        return all;
    }

    public boolean libraryEmpty() {
        for (List<Book> s : shelves) if (!s.isEmpty()) return false;
        return true;
    }

    public boolean isLibraryLoading() {
        return libraryLoading;
    }

    /** Reloads the book lists through PlayerService (main thread), then covers off the main thread. */
    public void refreshLibrary(boolean force) {
        if (libraryLoading) return;
        if (!force && SystemClock.elapsedRealtime() - libraryLoadedAt < 30_000 && !libraryEmpty()) return;
        Service service = EppyBridge.getPlayerService();
        if (service == null || !EppyBridge.isLinked()) return;
        libraryLoading = true;
        main.post(() -> {
            final ArrayList<List<Book>> fresh = new ArrayList<>();
            final ArrayList<ArrayList<?>> keys = new ArrayList<>();
            try {
                for (int state = 0; state < 3; state++) {
                    Object stateEnum = bookStateEnum(STATE_NAMES[state]);
                    ArrayList<?> paths = stateEnum != null ? EppyBridge.booksForState(service, stateEnum) : null;
                    ArrayList<Book> books = new ArrayList<>();
                    if (paths != null) {
                        for (Object p : paths) {
                            Object uri = field(p, "mFolderUri");
                            Object name = field(p, "mFolderName");
                            if (uri instanceof String) {
                                books.add(new Book((String) uri, name instanceof String ? (String) name : "", state));
                            }
                        }
                    }
                    fresh.add(books);
                    ArrayList<?> k = null;
                    try {
                        if (paths != null && !paths.isEmpty()) k = EppyBridge.coverKeys(service, paths);
                    } catch (Throwable ignored) {
                    }
                    keys.add(k);
                }
            } catch (Throwable t) {
                libraryLoading = false;
                return;
            }
            // Progress, last-played and added times from SABP's own BookData list.
            try {
                java.util.HashMap<String, Object> data = new java.util.HashMap<>();
                for (Object bd : allBookData(service)) {
                    Object u = field(bd, "mFolderUri");
                    if (u instanceof String) data.put((String) u, bd);
                }
                for (List<Book> list : fresh) for (Book b : list) {
                    Object bd = data.get(b.folderUri);
                    if (bd == null) continue;
                    Object lp = field(bd, "mLastPlaybackTime");
                    Object ad = field(bd, "mAddTime");
                    b.lastPlayed = lp instanceof Long ? (Long) lp : 0;
                    b.added = ad instanceof Long ? (Long) ad : 0;
                    b.position = intField(bd, "mCurrentPlaybackTimeCache");
                    b.length = intField(bd, "mTotalPlaybackTimeCache");
                }
            } catch (Throwable t) {
                EppyDiag.log("library", "book details unavailable: " + t);
            }
            // Keep covers we already have while the new ones load.
            for (int s = 0; s < 3; s++) {
                for (Book b : fresh.get(s)) {
                    Book old = find(b.folderUri);
                    if (old != null) b.cover = old.cover;
                }
            }
            for (int s = 0; s < 3; s++) {
                shelves.get(s).clear();
                shelves.get(s).addAll(fresh.get(s));
            }
            libraryLoadedAt = SystemClock.elapsedRealtime();
            dispatchLibrary();
            io.execute(() -> {
                for (int s = 0; s < 3; s++) {
                    ArrayList<?> k = keys.get(s);
                    if (k == null) continue;
                    try {
                        ArrayList<?> covers = EppyBridge.loadCovers(app, k);
                        if (covers == null) continue;
                        List<Book> books = fresh.get(s);
                        for (int i = 0; i < books.size() && i < covers.size(); i++) {
                            Object c = covers.get(i);
                            if (c instanceof Bitmap) books.get(i).cover = (Bitmap) c;
                        }
                        dispatchLibrary();
                    } catch (Throwable ignored) {
                    }
                }
                libraryLoading = false;
            });
        });
    }

    public Book find(String folderUri) {
        if (folderUri == null) return null;
        for (List<Book> s : shelves) for (Book b : s) if (folderUri.equals(b.folderUri)) return b;
        return null;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private Object bookStateEnum(String name) {
        try {
            Class c = Class.forName(EppyBridge.BOOK_STATE_CLASS, false, app.getClassLoader());
            return Enum.valueOf(c, name);
        } catch (Throwable t) {
            return null;
        }
    }
}
