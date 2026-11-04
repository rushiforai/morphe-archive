package app.tikkamasalla.stremio.oneahead.demux;

/**
 * Buffered cursor over a {@link RangeSource}. A skip past the buffer simply moves the cursor, so
 * the rest of a large video frame is not fetched; the number of requests never exceeds what
 * contiguous reading at the same chunk size would need.
 */
final class RangeInput {
    private static final int MAX_BUFFER = 16 * 1024 * 1024;

    final RangeSource source;
    private byte[] buf;
    private long bufPos;
    private int bufLen;
    private long pos;
    private int chunk;
    private long softEnd = -1;

    RangeInput(RangeSource source, int chunk) {
        this.source = source;
        setChunk(chunk);
    }

    void setChunk(int size) {
        chunk = size;
        // A larger buffer than the chunk stays, and is only ever filled one chunk at a time.
        if (buf == null || buf.length < size) {
            byte[] bigger = new byte[size];
            if (buf != null && bufLen > 0) System.arraycopy(buf, 0, bigger, 0, bufLen);
            buf = bigger;
        }
    }

    /** A read does not ask past this position (it may still pass it when more is really needed). */
    void setSoftEnd(long position) {
        softEnd = position;
    }

    long pos() {
        return pos;
    }

    void seek(long position) {
        pos = position;
    }

    void skip(long bytes) {
        pos += bytes;
    }

    byte[] buf() {
        return buf;
    }

    /** Offset of the cursor in {@link #buf()}; valid after a successful ensure. */
    int off() {
        return (int) (pos - bufPos);
    }

    /** Bytes available at the cursor after a call to ensure. */
    int buffered() {
        return pos >= bufPos && pos < bufPos + bufLen ? (int) (bufPos + bufLen - pos) : 0;
    }

    /** Makes n bytes available at the cursor. False when the file ends first. */
    boolean ensure(int n) throws DemuxException {
        int have = buffered();
        if (have >= n) return true;
        if (n > MAX_BUFFER) throw new DemuxException(DemuxException.Kind.MALFORMED, "element too large: " + n);
        if (have > 0) System.arraycopy(buf, off(), buf, 0, have);
        bufPos = pos;
        bufLen = have;
        if (n > buf.length) {
            byte[] bigger = new byte[n];
            System.arraycopy(buf, 0, bigger, 0, have);
            buf = bigger;
        }
        while (bufLen < n) {
            long at = bufPos + bufLen;
            int want = Math.min(Math.max(n - bufLen, chunk), buf.length - bufLen);
            if (softEnd > at) want = (int) Math.min(want, Math.max(n - bufLen, softEnd - at));
            int got = source.read(at, buf, bufLen, want);
            if (got <= 0) return false;
            bufLen += got;
        }
        return true;
    }

    /** Reads n bytes into a new array without growing the shared buffer. Null when the file ends first. */
    byte[] readBytes(int n) throws DemuxException {
        byte[] out = new byte[n];
        int done = Math.min(buffered(), n);
        if (done > 0) System.arraycopy(buf, off(), out, 0, done);
        while (done < n) {
            int got = source.read(pos + done, out, done, n - done);
            if (got <= 0) return null;
            done += got;
        }
        pos += n;
        return out;
    }
}
