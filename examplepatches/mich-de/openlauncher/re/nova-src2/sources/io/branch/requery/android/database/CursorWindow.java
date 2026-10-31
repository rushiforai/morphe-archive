package io.branch.requery.android.database;

import android.database.CharArrayBuffer;

/* loaded from: classes4.dex */
public class CursorWindow extends io.branch.requery.android.database.sqlite.b {
    private static final int WINDOW_SIZE_KB = 2048;
    private static final int sDefaultCursorWindowSize = 2097152;
    private final String mName;
    private int mStartPos;
    public long mWindowPtr;
    private final int mWindowSizeBytes;

    public CursorWindow(String str) {
        this(str, sDefaultCursorWindowSize);
    }

    private void dispose() {
        long j11 = this.mWindowPtr;
        if (j11 != 0) {
            nativeDispose(j11);
            this.mWindowPtr = 0L;
        }
    }

    private static native boolean nativeAllocRow(long j11);

    private static native void nativeClear(long j11);

    private static native long nativeCreate(String str, int i5);

    private static native void nativeDispose(long j11);

    private static native void nativeFreeLastRow(long j11);

    private static native byte[] nativeGetBlob(long j11, int i5, int i11);

    private static native double nativeGetDouble(long j11, int i5, int i11);

    private static native long nativeGetLong(long j11, int i5, int i11);

    private static native String nativeGetName(long j11);

    private static native int nativeGetNumRows(long j11);

    private static native String nativeGetString(long j11, int i5, int i11);

    private static native int nativeGetType(long j11, int i5, int i11);

    private static native boolean nativePutBlob(long j11, byte[] bArr, int i5, int i11);

    private static native boolean nativePutDouble(long j11, double d5, int i5, int i11);

    private static native boolean nativePutLong(long j11, long j12, int i5, int i11);

    private static native boolean nativePutNull(long j11, int i5, int i11);

    private static native boolean nativePutString(long j11, String str, int i5, int i11);

    private static native boolean nativeSetNumColumns(long j11, int i5);

    public boolean allocRow() {
        return nativeAllocRow(this.mWindowPtr);
    }

    public void clear() {
        this.mStartPos = 0;
        nativeClear(this.mWindowPtr);
    }

    public void copyStringToBuffer(int i5, int i11, CharArrayBuffer charArrayBuffer) {
        if (charArrayBuffer == null) {
            throw new IllegalArgumentException("CharArrayBuffer should not be null");
        }
        char[] charArray = getString(i5, i11).toCharArray();
        charArrayBuffer.data = charArray;
        charArrayBuffer.sizeCopied = charArray.length;
    }

    public void finalize() throws Throwable {
        try {
            dispose();
        } finally {
            super.finalize();
        }
    }

    public void freeLastRow() {
        nativeFreeLastRow(this.mWindowPtr);
    }

    public byte[] getBlob(int i5, int i11) {
        return nativeGetBlob(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public double getDouble(int i5, int i11) {
        return nativeGetDouble(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public float getFloat(int i5, int i11) {
        return (float) getDouble(i5, i11);
    }

    public int getInt(int i5, int i11) {
        return (int) getLong(i5, i11);
    }

    public long getLong(int i5, int i11) {
        return nativeGetLong(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public String getName() {
        return this.mName;
    }

    public int getNumRows() {
        return nativeGetNumRows(this.mWindowPtr);
    }

    public short getShort(int i5, int i11) {
        return (short) getLong(i5, i11);
    }

    public int getStartPosition() {
        return this.mStartPos;
    }

    public String getString(int i5, int i11) {
        return nativeGetString(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public int getType(int i5, int i11) {
        return nativeGetType(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public int getWindowSizeBytes() {
        return this.mWindowSizeBytes;
    }

    @Override // io.branch.requery.android.database.sqlite.b
    public void onAllReferencesReleased() {
        dispose();
    }

    public boolean putBlob(byte[] bArr, int i5, int i11) {
        return nativePutBlob(this.mWindowPtr, bArr, i5 - this.mStartPos, i11);
    }

    public boolean putDouble(double d5, int i5, int i11) {
        return nativePutDouble(this.mWindowPtr, d5, i5 - this.mStartPos, i11);
    }

    public boolean putLong(long j11, int i5, int i11) {
        return nativePutLong(this.mWindowPtr, j11, i5 - this.mStartPos, i11);
    }

    public boolean putNull(int i5, int i11) {
        return nativePutNull(this.mWindowPtr, i5 - this.mStartPos, i11);
    }

    public boolean putString(String str, int i5, int i11) {
        return nativePutString(this.mWindowPtr, str, i5 - this.mStartPos, i11);
    }

    public boolean setNumColumns(int i5) {
        return nativeSetNumColumns(this.mWindowPtr, i5);
    }

    public void setStartPosition(int i5) {
        this.mStartPos = i5;
    }

    public String toString() {
        return getName() + " {" + Long.toHexString(this.mWindowPtr) + "}";
    }

    public CursorWindow(String str, int i5) {
        this.mStartPos = 0;
        this.mWindowSizeBytes = i5;
        str = (str == null || str.length() == 0) ? "<unnamed>" : str;
        this.mName = str;
        long jNativeCreate = nativeCreate(str, i5);
        this.mWindowPtr = jNativeCreate;
        if (jNativeCreate != 0) {
            return;
        }
        throw new CursorWindowAllocationException("Cursor window allocation of " + (i5 / 1024) + " kb failed. ");
    }
}
