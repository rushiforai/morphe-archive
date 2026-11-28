package app.morphe.extension.sabp;

import android.content.Context;
import android.net.Uri;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InvalidClassException;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.reflect.Field;

/**
 * The other device's position: SABP's {@code position.sabp.dat} in the book folder, last written by whichever
 * device played the book last and brought here by a folder-sync app (docs/adr/0002). SABP only reads that file for
 * a book new to its library, so eppy reads it and offers the jump. The PC (Audiobookshelf with the PC read-along
 * helper) writes its own {@code position.pc.json} instead (docs/adr/0004); of the two, the more recently played one
 * that another device wrote is offered. Part of the "Sync between devices" patch.
 */
public final class OtherDevicePosition {
    public static final String FILE = "position.sabp.dat";
    /** The PC's position: {"v":1,"file":"<audio file name>","seconds":<int>,"lastPlayed":<epoch ms>}. */
    public static final String PC_FILE = "position.pc.json";
    static final int MIN_GAP_SECONDS = 30;
    private static final String SABP = "ak.alizandro.smartaudiobookplayer.";

    public final String fileName;
    public final int seconds;
    public final long lastPlayed;
    /** "PC" for the PC's file, null for SABP's file (written by a phone or tablet). */
    public final String device;

    OtherDevicePosition(String fileName, int seconds, long lastPlayed) {
        this(fileName, seconds, lastPlayed, null);
    }

    OtherDevicePosition(String fileName, int seconds, long lastPlayed, String device) {
        this.fileName = fileName;
        this.seconds = seconds;
        this.lastPlayed = lastPlayed;
        this.device = device;
    }

    /** True when the "Sync between devices" patch is applied. */
    public static boolean enabled(Context c) {
        return "on".equals(EppyTheme.configString(c, "eppy_device_sync", "off"));
    }

    /** What the book folder's position says compared with this device: no file, written here, the same place, or an offer. */
    public static final int NONE = 0, MINE = 1, SAME_PLACE = 2, OFFER = 3;

    /**
     * OFFER when the book folder's position was written by the other device and is in another file or more than 30 s
     * from here. Who wrote it is told by its last-played stamp: this device's saves are recorded by {@link #onSaved}.
     * (Comparing with this device's last-played time doesn't work: SABP stamps it with "now" as soon as a book is
     * opened.) With no save recorded yet, only the place decides.
     */
    public static int compare(String hereFile, int hereSeconds, Long savedHere, OtherDevicePosition there) {
        if (there == null || there.fileName == null) return NONE;
        if (savedHere != null && there.lastPlayed == savedHere) return MINE;
        return !there.fileName.equals(hereFile) || Math.abs(there.seconds - hereSeconds) > MIN_GAP_SECONDS ? OFFER : SAME_PLACE;
    }

    private static android.content.SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("eppy_sync", Context.MODE_PRIVATE);
    }

    /** The last-played stamp of this device's last save of the book's position file, or null. */
    public static Long savedHere(Context c, String folderUri) {
        android.content.SharedPreferences p = prefs(c);
        return p.contains("saved:" + folderUri) ? p.getLong("saved:" + folderUri, 0) : null;
    }

    /** Hook (Sync between devices patch): SABP is about to write position.sabp.dat for this BookData. */
    public static void onSaved(Context c, Object bookData) {
        try {
            Object folder = field(bookData, "mFolderUri"), at = field(bookData, "mLastPlaybackTime");
            if (folder instanceof String && at instanceof Long) prefs(c).edit().putLong("saved:" + folder, (Long) at).apply();
        } catch (Throwable ignored) {
        }
    }

    /**
     * The book folder's position to compare with this device: see {@link #pick}. Null when there is none or it can't be
     * read. Not on the main thread.
     */
    public static OtherDevicePosition read(Context c, String folderUri) {
        return pick(readFile(c, folderUri, FILE), readFile(c, folderUri, PC_FILE), savedHere(c, folderUri));
    }

    /**
     * The more recently played of SABP's file (unless this device wrote it) and the PC's file (unless this device has
     * saved since). With neither, SABP's file, so {@link #compare} can still say it's this device's own.
     */
    static OtherDevicePosition pick(OtherDevicePosition sabp, OtherDevicePosition pc, Long savedHere) {
        boolean sabpOther = sabp != null && sabp.fileName != null && (savedHere == null || sabp.lastPlayed != savedHere);
        boolean pcOther = pc != null && pc.fileName != null && (savedHere == null || pc.lastPlayed > savedHere);
        return pcOther && (!sabpOther || pc.lastPlayed > sabp.lastPlayed) ? pc : sabp;
    }

    private static OtherDevicePosition readFile(Context c, String folderUri, String name) {
        Uri uri = app.morphe.extension.sabp.read.SpeechSync.fileUri(folderUri, name);
        try (InputStream in = "file".equals(uri.getScheme()) ? new FileInputStream(uri.getPath()) : c.getContentResolver().openInputStream(uri)) {
            return in == null ? null : FILE.equals(name) ? parse(in) : parsePc(in);
        } catch (FileNotFoundException e) {
            return null;
        } catch (Throwable t) {
            EppyDiag.log("sync", name + " unreadable: " + t.getClass().getSimpleName());
            return null;
        }
    }

    /** Parses the PC's position file; null if it isn't one this version knows. */
    static OtherDevicePosition parsePc(InputStream in) throws Exception {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        byte[] buf = new byte[4096];
        int r;
        while ((r = in.read(buf)) > 0 && out.size() < 65536) out.write(buf, 0, r);
        org.json.JSONObject o = new org.json.JSONObject(out.toString("UTF-8"));
        if (o.optInt("v", 0) != 1) return null;
        String file = o.optString("file", "");
        long at = o.optLong("lastPlayed", 0);
        if (file.isEmpty() || at <= 0) return null;
        return new OtherDevicePosition(file, Math.max(0, o.optInt("seconds", 0)), at, "PC");
    }

    /** Parses SABP's BookDataBackup (Java serialization), or returns null if the file holds something else. */
    static OtherDevicePosition parse(InputStream in) throws Exception {
        try (ObjectInputStream o = new ObjectInputStream(in) {
            @Override
            protected Class<?> resolveClass(ObjectStreamClass d) throws IOException, ClassNotFoundException {
                // The file arrives from another device: only SABP's own classes and plain Java values.
                if (!allowed(d.getName())) throw new InvalidClassException(d.getName(), "not allowed in " + FILE);
                return Class.forName(d.getName(), false, OtherDevicePosition.class.getClassLoader());
            }
        }) {
            Object b = o.readObject();
            if (b == null || !b.getClass().getName().equals(SABP + "BookDataBackup")) return null;
            Object file = field(b, "mFileName"), pos = field(b, "mFilePosition"), at = field(b, "mLastPlaybackTime");
            if (!(file instanceof String) || !(pos instanceof Integer) || !(at instanceof Long)) return null;
            return new OtherDevicePosition((String) file, Math.max(0, (Integer) pos), (Long) at);
        }
    }

    static boolean allowed(String name) {
        if (name.startsWith(SABP) || name.startsWith("[L" + SABP)) return true;
        if (name.length() == 2 && name.charAt(0) == '[' && "ZBCSIJFD".indexOf(name.charAt(1)) >= 0) return true;
        switch (name) {
            case "java.lang.Enum":
            case "java.lang.Number":
            case "java.lang.Integer":
            case "java.lang.Long":
            case "java.lang.Float":
            case "java.lang.Double":
            case "java.lang.Boolean":
            case "java.util.Date":
            case "java.util.ArrayList":
                return true;
            default:
                return false;
        }
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
}
