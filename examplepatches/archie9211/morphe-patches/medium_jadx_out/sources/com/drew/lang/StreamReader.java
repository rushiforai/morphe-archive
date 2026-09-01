package com.drew.lang;

import defpackage.ay0;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class StreamReader extends SequentialReader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private long _pos;
    private final InputStream _stream;

    public StreamReader(InputStream inputStream) {
        inputStream.getClass();
        this._stream = inputStream;
        this._pos = 0L;
    }

    private long skipInternal(long j) throws IOException {
        long j2 = 0;
        while (j2 != j) {
            long jSkip = this._stream.skip(j - j2);
            j2 += jSkip;
            if (jSkip == 0) {
                break;
            }
        }
        this._pos += j2;
        return j2;
    }

    @Override // com.drew.lang.SequentialReader
    public final int available() {
        try {
            return this._stream.available();
        } catch (IOException unused) {
            return 0;
        }
    }

    @Override // com.drew.lang.SequentialReader
    public final byte getByte() throws IOException {
        int i = this._stream.read();
        if (i == -1) {
            throw new EOFException("End of data reached.");
        }
        this._pos++;
        return (byte) i;
    }

    @Override // com.drew.lang.SequentialReader
    public final void getBytes(byte[] bArr, int i, int i2) throws IOException {
        int i3 = 0;
        while (i3 != i2) {
            int i4 = this._stream.read(bArr, i + i3, i2 - i3);
            if (i4 == -1) {
                throw new EOFException("End of data reached.");
            }
            i3 += i4;
        }
        this._pos += (long) i3;
    }

    @Override // com.drew.lang.SequentialReader
    public final long getPosition() {
        return this._pos;
    }

    @Override // com.drew.lang.SequentialReader
    public final void skip(long j) throws IOException {
        if (j < 0) {
            ay0.e("n must be zero or greater.");
            return;
        }
        long jSkipInternal = skipInternal(j);
        if (jSkipInternal != j) {
            throw new EOFException(String.format("Unable to skip. Requested %d bytes but only %d remained.", Long.valueOf(j), Long.valueOf(jSkipInternal)));
        }
    }

    @Override // com.drew.lang.SequentialReader
    public final boolean trySkip(long j) {
        if (j >= 0) {
            return skipInternal(j) == j;
        }
        ay0.e("n must be zero or greater.");
        return false;
    }

    @Override // com.drew.lang.SequentialReader
    public final byte[] getBytes(int i) throws IOException {
        try {
            byte[] bArr = new byte[i];
            getBytes(bArr, 0, i);
            return bArr;
        } catch (OutOfMemoryError unused) {
            throw new EOFException("End of data reached.");
        }
    }
}
