package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Log chats that don't notify, for end-to-end encrypted chats (#143). Messenger's native code decides whether an
 * encrypted chat's message notifies, with one SQL statement in libstartup.so, and files a muted chat's message as
 * already shown, so nothing in Java ever sees it. While the switch is on, that statement's mute column reads `1 OR ?`
 * and spaces instead, the same length with the same one bind, so a muted chat's message comes through like any other.
 * Past that gate the encrypted push runs Messenger's own Java notification check, the one the msys notification parser
 * builds, so {@link QuietChats} marks the chat quiet there and the notification manager drops it once the log has the
 * message, exactly as it does in an ordinary chat. Off puts the stock column back.
 *
 * libstartup.so comes packed inside the APK, and Messenger unpacks it into its own data folder on the first start after
 * an install or update, so the change goes into that copy, and only over the exact stock bytes. Messenger reads the
 * statement as it starts, so a change takes a restart. The copy's length and time name the copy a spot was found in, so
 * a start reads one short span instead of all 56 MB.
 *
 * Android 17 won't load a native file anyone can write (Safer Native DCL, for apps targeting 37 as Messenger 587 does),
 * and every Messenger process loads this one as it starts, whenever that is. So the file at Messenger's path is never
 * made writable: a change goes into a new copy in Messenger's data folder, which turns read-only with the old time and
 * then moves over the old one in one step. A start finds the old copy or the new one, both read-only, and a process that
 * already loaded the old one keeps it.
 *
 * Messenger's library loader (SoLoader) keeps the folder it unpacks into read-only between unpacks, and unpacks under a
 * lock file there, so nothing new can be made inside it (the S25 on Android 17 refused the copy beside the library).
 * The move takes that same lock, so it never lands in the middle of an unpack, and opens the folder for the one rename
 * the way SoLoader opens it for its own writes.
 */
final class MuteQuery {
    private MuteQuery() {}

    /** Where Messenger unpacks the library, under its data folder. */
    static final String LIB = "lib-compressed/libstartup.so";
    /** The lock file SoLoader holds in that folder while it unpacks. */
    static final String LOCK = "dso_lock";
    /** The new copy's name in Messenger's data folder, while it's made. */
    private static final String STAGED = "hushmessenger_mute_query.so";
    /** The spot cache's own store, kept out of the settings a backup copies. */
    static final String FILE = "hushmessenger_mute_query";
    /** The restart row's name for the column Messenger read as it started. */
    static final String RESTART_KEY = "mute_query";

    private static final byte[] HEAD = ascii("SELECT ");
    static final byte[] STOCK = ascii("HT.mute_expiration_ts_ms IS NULL OR ? > HT.mute_expiration_ts_ms AND HT.mute_expiration_ts_ms > -1,");
    private static final byte[] TAIL = ascii(" CREATE_PRIVACY_CONTEXT_FROM_TRANSPORT_KEY_SQL(HT.transport_key),");
    static final byte[] EDITED = edited();
    static final int SPAN = HEAD.length + STOCK.length + TAIL.length;
    private static final int CHUNK = 1 << 20;

    private static byte[] ascii(String text) { return text.getBytes(StandardCharsets.US_ASCII); }

    /** `1 OR ?`, then spaces up to the stock column's comma, which stays. */
    private static byte[] edited() {
        byte[] form = new byte[STOCK.length];
        Arrays.fill(form, (byte) ' ');
        byte[] start = ascii("1 OR ?");
        System.arraycopy(start, 0, form, 0, start.length);
        form[form.length - 1] = ',';
        return form;
    }

    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMuteQuery");
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        return thread;
    });
    private static volatile SharedPreferences watched;
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGES = (prefs, key) -> {
        Context app = Settings.appContext;
        if (app != null && (QuietChats.KEY.equals(key) || MessageLog.KEY.equals(key) || "paused".equals(key))) WORKER.execute(() -> sync(app));
    };

    /** On the main process's start: the copy catches up now and after every change to the switches it follows. */
    static void follow(Context app) {
        SharedPreferences prefs = Settings.preferences;
        if (prefs != null && watched != prefs) {
            prefs.registerOnSharedPreferenceChangeListener(CHANGES);
            watched = prefs;
        }
        WORKER.execute(() -> sync(app));
    }

    static void sync(Context app) {
        boolean wanted = QuietChats.wanted();
        try {
            Boolean edited = put(new File(app.getApplicationInfo().dataDir, LIB), app.getSharedPreferences(FILE, Context.MODE_PRIVATE), wanted);
            if (edited == null && wanted) android.util.Log.w("HushMessenger", "message_log_quiet_chats: no mute check to change in this Messenger");
        } catch (IOException | RuntimeException error) {
            Settings.hookFailedPrivately(QuietChats.KEY,
                error instanceof Refused ? error.getMessage() : "Can't change the encrypted chats' mute check", error);
        }
    }

    /** A change that stopped at one of its own checks, with Messenger's copy left as it was. Its message says which. */
    static final class Refused extends IOException {
        Refused(String message) { super(message); }
    }

    /**
     * Moves a finished copy over Messenger's in one step, with SoLoader's lock already held. Tests swap it, since Windows
     * won't replace a read-only file and ignores a folder's read-only flag.
     */
    interface Swap { void move(File from, File to) throws IOException; }

    static volatile Swap swap = (from, to) -> {
        File folder = to.getParentFile();
        // SoLoader leaves the folder read-only between unpacks, and a rename into it needs it writable for that moment.
        boolean opened = !folder.canWrite();
        if (opened && !folder.setWritable(true)) throw new Refused("Can't open Messenger's library folder for the change");
        try {
            Files.move(from.toPath(), to.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
        } finally {
            if (opened && !folder.setWritable(false)) {
                android.util.Log.w("HushMessenger", "message_log_quiet_chats: Messenger's library folder didn't go back to read-only");
            }
        }
    };

    /** One statement in the file: where its column starts and whether it's in the edited form. */
    static final class Spot {
        final long at;
        final boolean edited;

        Spot(long at, boolean edited) {
            this.at = at;
            this.edited = edited;
        }
    }

    private static boolean has(byte[] bytes, int from, byte[] part) {
        for (int k = 0; k < part.length; k++) if (bytes[from + k] != part[k]) return false;
        return true;
    }

    /** True for the edited form, false for stock, null for neither, of the [SPAN] bytes starting at [from]. */
    private static Boolean form(byte[] bytes, int from) {
        if (!has(bytes, from, HEAD)) return null;
        int column = from + HEAD.length;
        if (!has(bytes, column + STOCK.length, TAIL)) return null;
        if (has(bytes, column, STOCK)) return Boolean.FALSE;
        if (has(bytes, column, EDITED)) return Boolean.TRUE;
        return null;
    }

    /** The one statement in [lib], in either form. Null when there's none, or more than one to choose from. */
    static Spot find(File lib) throws IOException {
        byte[] buffer = new byte[CHUNK + SPAN];
        Spot found = null;
        long base = 0;
        int kept = 0;
        try (InputStream in = new FileInputStream(lib)) {
            for (int read; (read = in.read(buffer, kept, buffer.length - kept)) >= 0; ) {
                int filled = kept + read, last = filled - SPAN;
                for (int i = 0; i <= last; i++) {
                    if (buffer[i] != 'S') continue;
                    Boolean edited = form(buffer, i);
                    if (edited == null) continue;
                    if (found != null) return null;
                    found = new Spot(base + i + HEAD.length, edited);
                }
                int next = Math.max(0, last + 1);
                kept = filled - next;
                System.arraycopy(buffer, next, buffer, 0, kept);
                base += next;
            }
        }
        return found;
    }

    /** The statement at the cached spot, when [lib] is still the copy it was found in. */
    private static Spot cached(File lib, SharedPreferences cache) throws IOException {
        long at = cache.getLong("at", -1);
        if (at < HEAD.length || cache.getLong("length", -1) != lib.length() || cache.getLong("time", -1) != lib.lastModified()) return null;
        byte[] span = new byte[SPAN];
        try (RandomAccessFile file = new RandomAccessFile(lib, "r")) {
            if (at - HEAD.length + SPAN > file.length()) return null;
            file.seek(at - HEAD.length);
            file.readFully(span);
        }
        Boolean edited = form(span, 0);
        return edited == null ? null : new Spot(at, edited);
    }

    /**
     * Puts the column in the form [edited] asks for, and answers whether it's edited now: null when [lib] has no
     * statement to change. With the switch off and no spot cached, the copy was never touched, so nothing is read.
     */
    static Boolean put(File lib, SharedPreferences cache, boolean edited) throws IOException {
        if (!lib.isFile()) return null;
        Spot spot = cached(lib, cache);
        if (spot == null) {
            // A new copy (Messenger unpacked it again) is stock, so only the switch on needs a look.
            if (!edited) {
                if (cache.contains("at")) cache.edit().clear().apply();
                return null;
            }
            spot = find(lib);
            if (spot == null) return null;
        }
        if (spot.edited != edited) {
            replace(lib, spot.at, edited ? EDITED : STOCK);
            if (lib.canWrite()) throw new Refused("Messenger's startup library didn't stay read-only");
        }
        cache.edit().putLong("at", spot.at).putLong("length", lib.length()).putLong("time", lib.lastModified()).apply();
        Spot now = cached(lib, cache);
        if (now == null || now.edited != edited) throw new IOException("The mute check didn't take the change");
        return now.edited;
    }

    /** Where the new copy is made: Messenger's data folder, the one holding [lib]'s folder, on the same disk. */
    static File next(File lib) {
        File data = lib.getAbsoluteFile().getParentFile().getParentFile();
        return new File(data, STAGED);
    }

    /**
     * Writes a copy of [lib] with [column] at [at], makes it read-only with [lib]'s time (Messenger's unpacker checks only
     * its own state file, and the old time keeps it that way), then moves it over [lib] under SoLoader's lock. Any check
     * that fails leaves [lib] as it was and takes the copy away.
     */
    private static void replace(File lib, long at, byte[] column) throws IOException {
        File lock = new File(lib.getParentFile(), LOCK);
        if (!lock.isFile()) throw new Refused("Messenger's library folder has no unpack lock to take");
        File next = next(lib);
        long length = lib.length(), time = lib.lastModified();
        boolean moved = false;
        discard(next);
        try {
            try (InputStream in = new FileInputStream(lib); FileOutputStream out = new FileOutputStream(next)) {
                byte[] buffer = new byte[CHUNK];
                long base = 0;
                for (int read; (read = in.read(buffer)) > 0; base += read) {
                    for (long k = Math.max(at, base), end = Math.min(at + column.length, base + read); k < end; k++) {
                        buffer[(int) (k - base)] = column[(int) (k - at)];
                    }
                    out.write(buffer, 0, read);
                }
                out.getFD().sync();
            }
            byte[] span = new byte[SPAN];
            try (RandomAccessFile file = new RandomAccessFile(next, "r")) {
                if (file.length() != length) throw new Refused("The mute check's new copy came out the wrong size");
                file.seek(at - HEAD.length);
                file.readFully(span);
            }
            if (!Boolean.valueOf(column == EDITED).equals(form(span, 0))) {
                throw new Refused("The mute check's new copy didn't take the change");
            }
            if (!next.setLastModified(time)) throw new Refused("Can't give the mute check's new copy the old time");
            if (!next.setWritable(false, false) || next.canWrite()) {
                throw new Refused("Can't make the mute check's new copy read-only");
            }
            try (RandomAccessFile handle = new RandomAccessFile(lock, "rw"); FileLock held = hold(handle)) {
                // An update that unpacked a new copy meanwhile wins, and the next start looks at that one.
                if (lib.length() != length || lib.lastModified() != time) throw new Refused("Messenger replaced its startup library during the change");
                swap.move(next, lib);
                moved = true;
            }
        } finally {
            if (!moved) discard(next);
        }
    }

    /** SoLoader's unpack lock. This process unpacking right now holds it already, and the next start tries again. */
    private static FileLock hold(RandomAccessFile handle) throws IOException {
        try {
            return handle.getChannel().lock();
        } catch (OverlappingFileLockException busy) {
            throw new Refused("Messenger was unpacking its libraries");
        }
    }

    /** Takes away a copy that didn't go in, if there is one. */
    private static void discard(File next) {
        if (!next.exists()) return;
        next.setWritable(true, true);
        if (!next.delete()) android.util.Log.w("HushMessenger", "message_log_quiet_chats: can't remove an unused copy of the mute check");
    }
}
