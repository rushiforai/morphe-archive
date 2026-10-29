package app.template.extension.onedm;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

/**
 * Drop-in write-buffered {@link RandomAccessFile} subclass for 1DM 20.0's AdBlocker binary
 * compiler ({@code i.j12} {@code abcfp.bin}, {@code abnhp.bin}, and {@code abnfp.bin} writers).
 *
 * <p>Stock {@code j12} performs 1.3M+ unbuffered {@code write(...)} and {@code getFilePointer()}
 * JNI syscalls when serializing ~1.22M compiled rules to flash storage, plus 4x 1-byte
 * {@code write(int)} syscalls per bucket-index slot. Coalescing sequential writes into a 64 KB
 * buffer and tracking {@code diskPos + bufCount} in memory eliminates ~99.9% of syscalls while
 * producing bit-for-bit identical {@code ab*.bin} output.
 *
 * <p>IMPORTANT: Only wrap {@code RandomAccessFile} instances that close before external readers
 * inspect the file ({@code abcfp.bin.tmp}, {@code abnhp.bin.tmp}, {@code abnfp.bin.tmp}). Never
 * wrap {@code ab_bucket_index_*.tmp} ({@code file5}), which is read via {@code FileInputStream}
 * before its {@code RandomAccessFile} closes; for {@code file5}, use {@link #writeIntAtIndex}.
 */
@SuppressWarnings("unused")
public final class BufferedRandomAccessFile extends RandomAccessFile {

    private static final int BUFFER_SIZE = 65536; // 64 KB sequential flush block

    private static final ThreadLocal<byte[]> TL_INT32 = new ThreadLocal<byte[]>() {
        @Override
        protected byte[] initialValue() {
            return new byte[4];
        }
    };

    private final byte[] buf = new byte[BUFFER_SIZE];
    private int bufCount = 0;
    private long diskPos = 0L;

    public BufferedRandomAccessFile(File file, String mode) throws FileNotFoundException {
        super(file, mode);
    }

    public BufferedRandomAccessFile(String name, String mode) throws FileNotFoundException {
        super(name, mode);
    }

    /**
     * Replaces {@code i.j12}'s 4x 1-byte {@code write(int)} syscalls in {@code m1526}
     * ({@code \u06e6\u06d8\u06e6(RandomAccessFile, int, int)}) with a single 4-byte OS write,
     * keeping {@code ab_bucket_index_*.tmp} immediately visible on disk to {@code File.length()}
     * and {@code FileInputStream} without heap allocations.
     */
    public static void writeIntAtIndex(RandomAccessFile raf, int index, int value) throws IOException {
        raf.seek(((long) index) * 4L);
        byte[] b = TL_INT32.get();
        b[0] = (byte) (value >>> 24);
        b[1] = (byte) (value >>> 16);
        b[2] = (byte) (value >>> 8);
        b[3] = (byte) value;
        raf.write(b, 0, 4);
    }

    private void flushBuffer() throws IOException {
        if (bufCount > 0) {
            super.write(buf, 0, bufCount);
            diskPos += bufCount;
            bufCount = 0;
        }
    }

    @Override
    public void write(int b) throws IOException {
        if (bufCount >= BUFFER_SIZE) {
            flushBuffer();
        }
        buf[bufCount++] = (byte) b;
    }

    @Override
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override
    public void write(byte[] b, int off, int len) throws IOException {
        if (len <= 0) {
            return;
        }
        if (len >= BUFFER_SIZE) {
            flushBuffer();
            super.write(b, off, len);
            diskPos += len;
            return;
        }
        if (bufCount + len > BUFFER_SIZE) {
            flushBuffer();
        }
        System.arraycopy(b, off, buf, bufCount, len);
        bufCount += len;
    }

    @Override
    public long getFilePointer() throws IOException {
        return diskPos + bufCount;
    }

    @Override
    public void seek(long pos) throws IOException {
        if (pos == diskPos + bufCount) {
            return;
        }
        flushBuffer();
        super.seek(pos);
        diskPos = pos;
    }

    @Override
    public void setLength(long newLength) throws IOException {
        bufCount = 0;
        super.setLength(newLength);
        diskPos = super.getFilePointer();
    }

    @Override
    public long length() throws IOException {
        flushBuffer();
        return super.length();
    }

    @Override
    public int read() throws IOException {
        flushBuffer();
        int r = super.read();
        if (r >= 0) {
            diskPos++;
        }
        return r;
    }

    @Override
    public int read(byte[] b) throws IOException {
        return read(b, 0, b.length);
    }

    @Override
    public int read(byte[] b, int off, int len) throws IOException {
        flushBuffer();
        int n = super.read(b, off, len);
        if (n > 0) {
            diskPos += n;
        }
        return n;
    }

    @Override
    public int skipBytes(int n) throws IOException {
        if (n <= 0) {
            return 0;
        }
        flushBuffer();
        int skipped = super.skipBytes(n);
        if (skipped > 0) {
            diskPos += skipped;
        }
        return skipped;
    }

    @Override
    public void close() throws IOException {
        try {
            flushBuffer();
        } finally {
            super.close();
        }
    }
}
