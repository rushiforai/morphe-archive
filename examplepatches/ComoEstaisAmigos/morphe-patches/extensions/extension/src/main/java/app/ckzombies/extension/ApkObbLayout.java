package app.ckzombies.extension;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.Charset;

/**
 * Where the packed OBB sits inside the APK, and how native resdlEvent numbers map onto it.
 *
 * The OBB is not a zip. It is six files laid end to end: four CBigFile_v2 FGIB sections
 * (zombsniper.big, en.big, wvga.big, vga.big) and two raw 3GPs. The engine never scans for
 * FGIB. Java's SPECIAL_RES_FILESIZE_ARRAY is the index, and FileMgr opens each name as its
 * own combine slice: event 100 is the prefix sum (start), 102 is that slot's length, 101 is
 * the exclusive end. When the "file" is the APK, 100 and 101 have to start at the STORED
 * asset's payload, not at byte 0 (PK local header). 102 stays a length.
 *
 * AssetManager.openFd can report a start offset of 0 on some OEMs even when the bytes still
 * live in the APK, so the zip central directory is the source of truth. CBigFile_v2::Load
 * rejects anything whose first four bytes are not FGIB with major version at least 2.
 */
public final class ApkObbLayout {

    public static final int EVENT_START = 100;
    public static final int EVENT_END = 101;
    public static final int EVENT_LENGTH = 102;

    static final int LOCAL_SIG = 0x04034b50;
    static final int CENTRAL_SIG = 0x02014b50;
    static final int EOCD_SIG = 0x06054b50;
    static final int STORED = 0;
    static final int FGIB_B0 = 0x46;
    static final int FGIB_B1 = 0x47;
    static final int FGIB_B2 = 0x49;
    static final int FGIB_B3 = 0x42;
    static final int MIN_FGIB_VERSION = 2;
    private static final int MAX_ZIP_COMMENT = 65535;
    private static final Charset ZIP_NAME = Charset.forName("UTF-8");

    private ApkObbLayout() {
    }

    public static int adjustEvent(int event, int value, int base) {
        if (event == EVENT_START || event == EVENT_END) {
            return value + base;
        }
        return value;
    }

    /** True when [file] at [offset] is an FGIB section the loader will accept. */
    public static boolean isFgib(File file, long offset) {
        if (file == null || offset < 0) {
            return false;
        }
        RandomAccessFile raf = null;
        try {
            raf = new RandomAccessFile(file, "r");
            if (offset + 5 > raf.length()) {
                return false;
            }
            raf.seek(offset);
            byte[] head = new byte[5];
            raf.readFully(head);
            return (head[0] & 0xff) == FGIB_B0
                    && (head[1] & 0xff) == FGIB_B1
                    && (head[2] & 0xff) == FGIB_B2
                    && (head[3] & 0xff) == FGIB_B3
                    && (head[4] & 0xff) >= MIN_FGIB_VERSION;
        } catch (IOException ignored) {
            return false;
        } finally {
            closeQuietly(raf);
        }
    }

    /**
     * Payload offset of a STORED zip entry, or -1. Uses the local header's own name and extra
     * lengths, which can differ from the central directory extra.
     */
    public static long storedPayloadOffset(File zip, String entryName) {
        if (zip == null || entryName == null || entryName.length() == 0) {
            return -1L;
        }
        RandomAccessFile raf = null;
        try {
            raf = new RandomAccessFile(zip, "r");
            long length = raf.length();
            if (length < 22L) {
                return -1L;
            }
            int scan = (int) Math.min(length, 22L + MAX_ZIP_COMMENT);
            byte[] tail = new byte[scan];
            raf.seek(length - scan);
            raf.readFully(tail);
            int eocd = -1;
            for (int i = tail.length - 22; i >= 0; i--) {
                if (leInt(tail, i) == EOCD_SIG) {
                    eocd = i;
                    break;
                }
            }
            if (eocd < 0) {
                return -1L;
            }
            long cdSize = leInt(tail, eocd + 12) & 0xffffffffL;
            long cdOff = leInt(tail, eocd + 16) & 0xffffffffL;
            if (cdSize > Integer.MAX_VALUE || cdOff == 0xffffffffL) {
                return -1L;
            }
            if (cdOff + cdSize > length) {
                return -1L;
            }
            byte[] cd = new byte[(int) cdSize];
            raf.seek(cdOff);
            raf.readFully(cd);
            int p = 0;
            while (p + 46 <= cd.length) {
                if (leInt(cd, p) != CENTRAL_SIG) {
                    break;
                }
                int method = leShort(cd, p + 10);
                int nameLen = leShort(cd, p + 28);
                int extraLen = leShort(cd, p + 30);
                int commentLen = leShort(cd, p + 32);
                long localOff = leInt(cd, p + 42) & 0xffffffffL;
                int rec = 46 + nameLen + extraLen + commentLen;
                if (p + rec > cd.length) {
                    break;
                }
                String name = new String(cd, p + 46, nameLen, ZIP_NAME);
                p += rec;
                if (!entryName.equals(name)) {
                    continue;
                }
                if (method != STORED || localOff == 0xffffffffL) {
                    return -1L;
                }
                return localPayloadOffset(raf, localOff);
            }
            return -1L;
        } catch (IOException ignored) {
            return -1L;
        } finally {
            closeQuietly(raf);
        }
    }

    static long localPayloadOffset(RandomAccessFile raf, long localOff) throws IOException {
        byte[] loc = new byte[30];
        raf.seek(localOff);
        raf.readFully(loc);
        if (leInt(loc, 0) != LOCAL_SIG) {
            return -1L;
        }
        int nameLen = leShort(loc, 26);
        int extraLen = leShort(loc, 28);
        return localOff + 30L + nameLen + extraLen;
    }

    static int leShort(byte[] data, int off) {
        return (data[off] & 0xff) | ((data[off + 1] & 0xff) << 8);
    }

    static int leInt(byte[] data, int off) {
        return (data[off] & 0xff)
                | ((data[off + 1] & 0xff) << 8)
                | ((data[off + 2] & 0xff) << 16)
                | ((data[off + 3] & 0xff) << 24);
    }

    private static void closeQuietly(RandomAccessFile raf) {
        if (raf == null) {
            return;
        }
        try {
            raf.close();
        } catch (IOException ignored) {
        }
    }
}
