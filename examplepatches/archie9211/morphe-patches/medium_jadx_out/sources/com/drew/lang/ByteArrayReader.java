package com.drew.lang;

import defpackage.ay0;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ByteArrayReader extends RandomAccessReader {
    private final int _baseOffset;
    private final byte[] _buffer;

    public ByteArrayReader(byte[] bArr, int i) {
        bArr.getClass();
        if (i < 0) {
            ay0.e("Must be zero or greater");
            throw null;
        }
        this._buffer = bArr;
        this._baseOffset = i;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final byte getByte(int i) throws BufferBoundsException {
        validateIndex(i, 1);
        return this._buffer[i + this._baseOffset];
    }

    @Override // com.drew.lang.RandomAccessReader
    public final byte[] getBytes(int i, int i2) throws BufferBoundsException {
        validateIndex(i, i2);
        byte[] bArr = new byte[i2];
        System.arraycopy(this._buffer, i + this._baseOffset, bArr, 0, i2);
        return bArr;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final long getLength() {
        return this._buffer.length - this._baseOffset;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final boolean isValidIndex(int i, int i2) {
        return i2 >= 0 && i >= 0 && (((long) i) + ((long) i2)) - 1 < getLength();
    }

    @Override // com.drew.lang.RandomAccessReader
    public final int toUnshiftedOffset(int i) {
        return i + this._baseOffset;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final void validateIndex(int i, int i2) throws BufferBoundsException {
        if (!isValidIndex(i, i2)) {
            throw new BufferBoundsException(i + this._baseOffset, i2, this._buffer.length);
        }
    }

    public ByteArrayReader(byte[] bArr) {
        this(bArr, 0);
    }
}
