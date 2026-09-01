package com.drew.lang;

import java.io.IOException;
import java.io.RandomAccessFile;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RandomAccessFileReader extends RandomAccessReader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final int _baseOffset;
    private int _currentIndex;
    private final RandomAccessFile _file;
    private final long _length;

    public RandomAccessFileReader(RandomAccessFile randomAccessFile, int i) {
        randomAccessFile.getClass();
        this._file = randomAccessFile;
        this._baseOffset = i;
        this._length = randomAccessFile.length();
    }

    private void seek(int i) throws IOException {
        if (i == this._currentIndex) {
            return;
        }
        this._file.seek(i);
        this._currentIndex = i;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final byte getByte(int i) throws IOException {
        if (i != this._currentIndex) {
            seek(i);
        }
        int i2 = this._file.read();
        if (i2 < 0) {
            throw new BufferBoundsException("Unexpected end of file encountered.");
        }
        this._currentIndex++;
        return (byte) i2;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final byte[] getBytes(int i, int i2) throws IOException {
        validateIndex(i, i2);
        if (i != this._currentIndex) {
            seek(i);
        }
        byte[] bArr = new byte[i2];
        int i3 = this._file.read(bArr);
        this._currentIndex += i3;
        if (i3 == i2) {
            return bArr;
        }
        throw new BufferBoundsException("Unexpected end of file encountered.");
    }

    @Override // com.drew.lang.RandomAccessReader
    public final long getLength() {
        return this._length;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final boolean isValidIndex(int i, int i2) {
        return i2 >= 0 && i >= 0 && (((long) i) + ((long) i2)) - 1 < this._length;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final int toUnshiftedOffset(int i) {
        return i + this._baseOffset;
    }

    @Override // com.drew.lang.RandomAccessReader
    public final void validateIndex(int i, int i2) throws BufferBoundsException {
        if (!isValidIndex(i, i2)) {
            throw new BufferBoundsException(i, i2, this._length);
        }
    }

    public RandomAccessFileReader(RandomAccessFile randomAccessFile) {
        this(randomAccessFile, 0);
    }
}
