package com.drew.lang;

import defpackage.ay0;
import java.io.EOFException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SequentialByteArrayReader extends SequentialReader {
    private final byte[] _bytes;
    private int _index;

    public SequentialByteArrayReader(byte[] bArr, int i) {
        bArr.getClass();
        this._bytes = bArr;
        this._index = i;
    }

    @Override // com.drew.lang.SequentialReader
    public final int available() {
        return this._bytes.length - this._index;
    }

    @Override // com.drew.lang.SequentialReader
    public final byte getByte() throws EOFException {
        int i = this._index;
        byte[] bArr = this._bytes;
        if (i >= bArr.length) {
            throw new EOFException("End of data reached.");
        }
        this._index = i + 1;
        return bArr[i];
    }

    @Override // com.drew.lang.SequentialReader
    public final byte[] getBytes(int i) throws EOFException {
        int i2 = this._index;
        long j = ((long) i2) + ((long) i);
        byte[] bArr = this._bytes;
        if (j > bArr.length) {
            throw new EOFException("End of data reached.");
        }
        byte[] bArr2 = new byte[i];
        System.arraycopy(bArr, i2, bArr2, 0, i);
        this._index += i;
        return bArr2;
    }

    @Override // com.drew.lang.SequentialReader
    public final long getPosition() {
        return this._index;
    }

    @Override // com.drew.lang.SequentialReader
    public final void skip(long j) throws EOFException {
        if (j < 0) {
            ay0.e("n must be zero or greater.");
            return;
        }
        int i = this._index;
        if (((long) i) + j > this._bytes.length) {
            throw new EOFException("End of data reached.");
        }
        this._index = (int) (((long) i) + j);
    }

    @Override // com.drew.lang.SequentialReader
    public final boolean trySkip(long j) {
        if (j < 0) {
            ay0.e("n must be zero or greater.");
            return false;
        }
        int i = this._index;
        long j2 = ((long) i) + j;
        byte[] bArr = this._bytes;
        if (j2 > bArr.length) {
            this._index = bArr.length;
            return false;
        }
        this._index = (int) (((long) i) + j);
        return true;
    }

    public SequentialByteArrayReader(byte[] bArr) {
        this(bArr, 0);
    }

    @Override // com.drew.lang.SequentialReader
    public final void getBytes(byte[] bArr, int i, int i2) throws EOFException {
        int i3 = this._index;
        long j = ((long) i3) + ((long) i2);
        byte[] bArr2 = this._bytes;
        if (j <= bArr2.length) {
            System.arraycopy(bArr2, i3, bArr, i, i2);
            this._index += i2;
            return;
        }
        throw new EOFException("End of data reached.");
    }
}
