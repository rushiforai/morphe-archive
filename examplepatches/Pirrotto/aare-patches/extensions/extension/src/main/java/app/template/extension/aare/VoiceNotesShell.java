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
 * WhatsApp's voice notes without "All files access". It only lists and opens received voice notes
 * (PTT-… files) of WhatsApp's voice note folders: no other path is accepted.
 *
 * Plain Binder protocol, no AIDL: see {@link VoiceNotesAccess} for the client side.
 */
@SuppressWarnings("unused")
public class VoiceNotesShell extends Binder {
    static final String DESCRIPTOR = "app.template.extension.aare.VoiceNotesShell";

    /** Lists the recent voice notes: count, then path, last modified, size for each. */
    static final int TRANSACTION_LIST = FIRST_CALL_TRANSACTION + 1;

    /** Opens one voice note read-only: a ParcelFileDescriptor, or nothing if refused. */
    static final int TRANSACTION_OPEN = FIRST_CALL_TRANSACTION + 2;

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
            case TRANSACTION_LIST: {
                data.enforceInterface(DESCRIPTOR);
                List<File> files = list();
                reply.writeNoException();
                reply.writeInt(files.size());
                for (File f : files) {
                    reply.writeString(f.getAbsolutePath());
                    reply.writeLong(f.lastModified());
                    reply.writeLong(f.length());
                }
                return true;
            }
            case TRANSACTION_OPEN: {
                data.enforceInterface(DESCRIPTOR);
                String path = data.readString();
                ParcelFileDescriptor pfd = open(path);
                reply.writeNoException();
                if (pfd == null) {
                    reply.writeInt(0);
                } else {
                    reply.writeInt(1);
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

    /** Opens [path] only if it is a received voice note inside one of [FOLDERS]. */
    private static ParcelFileDescriptor open(String path) {
        if (path == null) return null;
        try {
            File file = new File(path).getCanonicalFile();
            if (!file.getName().startsWith("PTT-") || !file.isFile()) return null;
            File week = file.getParentFile();
            File folder = week == null ? null : week.getParentFile();
            if (folder == null || !isVoiceFolder(folder)) return null;
            return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (IOException | SecurityException e) {
            return null;
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
