package app.danielthemaniel.patches.memoryeditor.extension;

import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;

import java.io.File;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.security.SecureRandom;

/**
 * Raw access to this process's own memory through /proc/self/mem (pread/pwrite).
 *
 * No root and no native code: a process may always read/write itself. Unmapped or guard
 * pages make pread fail with EIO instead of crashing, so scanning is safe.
 *
 * Two tricks keep the editor from finding its own copies of the values it scans for:
 *   - All I/O buffers are MAP_SHARED file mappings ("rw-s"). The scanner only walks private
 *     ("rw-p") mappings, so these buffers are never scanned.
 *   - Values the editor keeps on the Java heap (result previews, freeze values, the result
 *     file stream) are XOR-ed with a per-launch random KEY, so they don't match searches.
 */
final class MemIO {
    static final long KEY = new SecureRandom().nextLong() | 1L;
    /** Returned by readX() when the address can't be read. */
    static final long FAIL = 0x8000000000000001L;

    private static FileDescriptor fd;
    private static boolean writable;
    private static ByteBuffer readBuf, writeBuf;

    private MemIO() { }

    static synchronized void init(File scratchDir) throws IOException {
        if (fd != null) return;
        // App processes are non-dumpable, which makes /proc/self/* owned by root, so even the app
        // itself gets EACCES opening /proc/self/mem. Become dumpable just for the open: access is
        // only checked at open time, so the fd keeps working after the flag is restored.
        int prevDumpable = -1;
        try {
            prevDumpable = Os.prctl(OsConstants.PR_GET_DUMPABLE, 0, 0, 0, 0);
            if (prevDumpable != 1) Os.prctl(OsConstants.PR_SET_DUMPABLE, 1, 0, 0, 0);
        } catch (ErrnoException ignored) {
        }
        try {
            try {
                fd = Os.open("/proc/self/mem", OsConstants.O_RDWR, 0);
                writable = true;
            } catch (ErrnoException rw) {
                try {
                    fd = Os.open("/proc/self/mem", OsConstants.O_RDONLY, 0);
                } catch (ErrnoException ro) {
                    throw new IOException("Cannot open /proc/self/mem (dumpable was " + prevDumpable + ")", ro);
                }
            }
        } finally {
            if (prevDumpable == 0) {
                try {
                    Os.prctl(OsConstants.PR_SET_DUMPABLE, 0, 0, 0, 0);
                } catch (ErrnoException ignored) {
                }
            }
        }
        readBuf = scratch(scratchDir, "io-read", 4096);
        writeBuf = scratch(scratchDir, "io-write", 4096);
    }

    static boolean writable() {
        return writable;
    }

    /** A direct buffer backed by a MAP_SHARED file mapping (invisible to the scanner). */
    static ByteBuffer scratch(File dir, String name, int size) throws IOException {
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        try (RandomAccessFile raf = new RandomAccessFile(new File(dir, name), "rw")) {
            raf.setLength(size);
            ByteBuffer b = raf.getChannel().map(FileChannel.MapMode.READ_WRITE, 0, size);
            b.order(ByteOrder.LITTLE_ENDIAN);
            return b;
        }
    }

    // Buffer-typed calls on purpose: ByteBuffer's covariant overrides don't exist on older ART.
    static void window(ByteBuffer b, int len) {
        Buffer x = b;
        x.clear();
        x.limit(len);
    }

    static void range(ByteBuffer b, int pos, int lim) {
        Buffer x = b;
        x.clear();
        x.limit(lim);
        x.position(pos);
    }

    /** Fills dst's remaining bytes from addr. Returns how many bytes were read (0 on failure). */
    static int read(long addr, ByteBuffer dst) {
        int total = 0;
        try {
            while (dst.hasRemaining()) {
                int n = Os.pread(fd, dst, addr + total);
                if (n <= 0) break;
                total += n;
            }
        } catch (ErrnoException | IOException | RuntimeException ignored) {
            // EIO: hit an unmapped page. Keep what we got.
        }
        return total;
    }

    /** Reads one value. Returns bits ^ KEY, or FAIL. */
    static synchronized long readX(long addr, ValueType t) {
        window(readBuf, t.size);
        if (read(addr, readBuf) < t.size) return FAIL;
        return t.get(readBuf, 0) ^ KEY;
    }

    static synchronized boolean write(long addr, ValueType t, long bits) {
        if (!writable) return false;
        window(writeBuf, 8);
        t.put(writeBuf, 0, bits);
        window(writeBuf, t.size);
        try {
            return Os.pwrite(fd, writeBuf, addr) == t.size;
        } catch (ErrnoException | IOException | RuntimeException e) {
            return false;
        }
    }
}
