package app.template.extension.aare;

import android.os.Binder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * The helper Shizuku runs with adb-level (shell) rights, in its own process, so AARE can read
 * WhatsApp's voice notes without "All files access". It answers one question only: "the voice
 * message received at this time, lasting this long?", with at most that one file (PTT-… in
 * WhatsApp's voice note folders), read-only. AARE never gets a list, a path or any other file:
 * sent voice notes and other chats' stay out of its reach (VoiceNoteMatch decides).
 *
 * Plain Binder protocol, no AIDL: see {@link VoiceNotesAccess} for the client side.
 */
@SuppressWarnings("unused")
public class VoiceNotesShell extends Binder {
    static final String DESCRIPTOR = "app.template.extension.aare.VoiceNotesShell";

    /**
     * In: message time (ms), stated duration (ms, -1 if none), then the tokens of recordings already
     * played for this text (count, then each). Out: 1, a token and a read-only ParcelFileDescriptor,
     * or 0 if no file is that message. A token is a hash of the file, not its name.
     */
    static final int TRANSACTION_FIND = FIRST_CALL_TRANSACTION + 3;

    /** Shizuku's user-service teardown call ("void destroy() = 16777114" in AIDL terms). */
    static final int TRANSACTION_DESTROY = FIRST_CALL_TRANSACTION + 16777114;

    /** Main user (0): the phone owner's shared storage. */
    private static final String STORAGE = "/storage/emulated/0";

    /** WhatsApp and WhatsApp Business voice note folders, current and legacy locations. */
    static final String[] FOLDERS = {
            STORAGE + "/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Voice Notes",
            STORAGE + "/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/WhatsApp Business Voice Notes",
            STORAGE + "/WhatsApp/Media/WhatsApp Voice Notes",
            STORAGE + "/WhatsApp Business/Media/WhatsApp Business Voice Notes",
    };

    /** How many weekly folders (newest first) are searched. */
    private static final int WEEKS = 3;

    public VoiceNotesShell() {
    }

    @Override
    protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        switch (code) {
            case TRANSACTION_FIND: {
                data.enforceInterface(DESCRIPTOR);
                long messageTimeMs = data.readLong();
                long statedMs = data.readLong();
                int n = Math.min(data.readInt(), 32);
                java.util.Set<String> used = new java.util.HashSet<>();
                for (int i = 0; i < n; i++) used.add(data.readString());
                File found = find(messageTimeMs, statedMs, used);
                ParcelFileDescriptor pfd = null;
                if (found != null) {
                    try {
                        pfd = ParcelFileDescriptor.open(found, ParcelFileDescriptor.MODE_READ_ONLY);
                    } catch (IOException | SecurityException ignored) {
                    }
                }
                reply.writeNoException();
                if (pfd == null) {
                    reply.writeInt(0);
                } else {
                    reply.writeInt(1);
                    reply.writeString(token(found));
                    pfd.writeToParcel(reply, android.os.Parcelable.PARCELABLE_WRITE_RETURN_VALUE);
                }
                return true;
            }
            case TRANSACTION_DESTROY:
                System.exit(0);
                return true;
            default:
                return super.onTransact(code, data, reply, flags);
        }
    }

    private static List<File> list() {
        List<File> files = new ArrayList<>();
        for (String folder : FOLDERS) {
            File[] weeks = new File(folder).listFiles(File::isDirectory);
            if (weeks == null) continue;
            Arrays.sort(weeks, (a, b) -> b.getName().compareTo(a.getName()));
            for (int i = 0; i < Math.min(WEEKS, weeks.length); i++) {
                File[] notes = weeks[i].listFiles((dir, name) -> name.startsWith("PTT-"));
                if (notes != null) files.addAll(Arrays.asList(notes));
            }
        }
        return files;
    }

    /** The voice note that is this message, or null: see VoiceNoteMatch. */
    private static File find(long messageTimeMs, long statedMs, java.util.Set<String> used) {
        List<File> files = new ArrayList<>();
        for (File f : list()) {
            try {
                File c = f.getCanonicalFile();
                File week = c.getParentFile();
                File folder = week == null ? null : week.getParentFile();
                // A link out of the voice note folders is never followed.
                if (!c.isFile() || !c.getName().startsWith("PTT-") || folder == null || !isVoiceFolder(folder)) continue;
                if (used.contains(token(c))) continue;
                files.add(c);
            } catch (IOException | SecurityException ignored) {
            }
        }
        long[] modified = new long[files.size()];
        long[] sizes = new long[files.size()];
        for (int i = 0; i < files.size(); i++) {
            modified[i] = files.get(i).lastModified();
            sizes[i] = files.get(i).length();
        }
        for (int i : VoiceNoteMatch.candidates(modified, sizes, messageTimeMs)) {
            File f = files.get(i);
            if (VoiceNoteMatch.lengthMatches(durationMs(f), statedMs)) return f;
        }
        return null;
    }

    /** An Ogg Opus file's length, or -1. */
    private static long durationMs(File f) {
        try (java.io.RandomAccessFile raf = new java.io.RandomAccessFile(f, "r")) {
            long len = raf.length();
            byte[] head = new byte[(int) Math.min(len, 4096)];
            raf.readFully(head);
            int tailLen = (int) Math.min(len, 65536);
            byte[] tail = new byte[tailLen];
            raf.seek(len - tailLen);
            raf.readFully(tail);
            return VoiceNoteMatch.oggOpusDurationMs(head, tail);
        } catch (IOException | SecurityException e) {
            return -1;
        }
    }

    /** Stands for a file without naming it: lets AARE avoid playing one recording twice. */
    private static String token(File f) {
        try {
            byte[] h = java.security.MessageDigest.getInstance("SHA-256")
                    .digest(f.getPath().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder b = new StringBuilder();
            for (int i = 0; i < 8; i++) b.append(String.format("%02x", h[i]));
            return b.toString();
        } catch (Exception e) {
            return "";
        }
    }

    private static boolean isVoiceFolder(File folder) throws IOException {
        String canonical = folder.getCanonicalPath();
        for (String f : FOLDERS) {
            if (new File(f).getCanonicalPath().equals(canonical)) return true;
        }
        return false;
    }
}
