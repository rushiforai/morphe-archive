package org.brotli.dec;

import b.c0;
import b.u4;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes5.dex */
public class BrotliInputStream extends InputStream {
    public static final int DEFAULT_INTERNAL_BUFFER_SIZE = 256;
    private static final int END_OF_STREAM_MARKER = -1;
    private byte[] buffer;
    private int bufferOffset;
    private int remainingBufferBytes;
    private final State state;

    public BrotliInputStream(InputStream inputStream) throws IOException {
        this(inputStream, 256);
    }

    public void attachDictionaryChunk(byte[] bArr) {
        Decode.attachDictionaryChunk(this.state, bArr);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        Decode.close(this.state);
        Utils.closeInput(this.state);
    }

    public void enableEagerOutput() {
        Decode.enableEagerOutput(this.state);
    }

    public void enableLargeWindow() {
        Decode.enableLargeWindow(this.state);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.bufferOffset >= this.remainingBufferBytes) {
            byte[] bArr = this.buffer;
            int i5 = read(bArr, 0, bArr.length);
            this.remainingBufferBytes = i5;
            this.bufferOffset = 0;
            if (i5 == -1) {
                return -1;
            }
        }
        byte[] bArr2 = this.buffer;
        int i11 = this.bufferOffset;
        this.bufferOffset = i11 + 1;
        return bArr2[i11] & 255;
    }

    public BrotliInputStream(InputStream inputStream, int i5) throws IOException {
        State state = new State();
        this.state = state;
        if (i5 <= 0) {
            throw new IllegalArgumentException(c0.h(i5, "Bad buffer size:"));
        }
        if (inputStream == null) {
            throw new IllegalArgumentException("source is null");
        }
        this.buffer = new byte[i5];
        this.remainingBufferBytes = 0;
        this.bufferOffset = 0;
        try {
            state.input = inputStream;
            Decode.initState(state);
        } catch (BrotliRuntimeException e3) {
            throw new IOException("Brotli decoder initialization failed", e3);
        }
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "Bad offset: "));
        }
        if (i11 >= 0) {
            int i12 = i5 + i11;
            if (i12 > bArr.length) {
                StringBuilder sbJ = u4.j(i12, "Buffer overflow: ", " > ");
                sbJ.append(bArr.length);
                throw new IllegalArgumentException(sbJ.toString());
            }
            if (i11 == 0) {
                return 0;
            }
            int iMax = Math.max(this.remainingBufferBytes - this.bufferOffset, 0);
            if (iMax != 0) {
                iMax = Math.min(iMax, i11);
                System.arraycopy(this.buffer, this.bufferOffset, bArr, i5, iMax);
                this.bufferOffset += iMax;
                i5 += iMax;
                i11 -= iMax;
                if (i11 == 0) {
                    return iMax;
                }
            }
            try {
                State state = this.state;
                state.output = bArr;
                state.outputOffset = i5;
                state.outputLength = i11;
                state.outputUsed = 0;
                Decode.decompress(state);
                int i13 = iMax + this.state.outputUsed;
                if (i13 > 0) {
                    return i13;
                }
                return -1;
            } catch (BrotliRuntimeException e3) {
                throw new IOException("Brotli stream decoding failed", e3);
            }
        }
        throw new IllegalArgumentException(c0.h(i11, "Bad length: "));
    }
}
