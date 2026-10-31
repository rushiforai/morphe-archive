package io.branch.requery.android.database.sqlite;

/* loaded from: classes4.dex */
public class SQLiteFunction {
    private final r args;
    public final p callback;
    final int flags;
    public final String name;
    public final int numArgs;
    private final s result;

    public SQLiteFunction(String str, int i5, p pVar) {
        this(str, i5, pVar, 0);
    }

    private void dispatchCallback(long j11, long j12, int i5) {
        this.result.getClass();
        this.args.getClass();
        this.args.getClass();
        try {
            throw null;
        } catch (Throwable th2) {
            this.result.getClass();
            this.args.getClass();
            this.args.getClass();
            throw th2;
        }
    }

    public static native byte[] nativeGetArgBlob(long j11, int i5);

    public static native double nativeGetArgDouble(long j11, int i5);

    public static native int nativeGetArgInt(long j11, int i5);

    public static native long nativeGetArgLong(long j11, int i5);

    public static native String nativeGetArgString(long j11, int i5);

    public static native void nativeSetResultBlob(long j11, byte[] bArr);

    public static native void nativeSetResultDouble(long j11, double d5);

    public static native void nativeSetResultError(long j11, String str);

    public static native void nativeSetResultInt(long j11, int i5);

    public static native void nativeSetResultLong(long j11, long j12);

    public static native void nativeSetResultNull(long j11);

    public static native void nativeSetResultString(long j11, String str);

    public SQLiteFunction(String str, int i5, p pVar, int i11) {
        this.args = new r();
        this.result = new s();
        if (str == null) {
            throw new IllegalArgumentException("name must not be null.");
        }
        this.name = str;
        this.numArgs = i5;
        this.flags = i11;
    }
}
