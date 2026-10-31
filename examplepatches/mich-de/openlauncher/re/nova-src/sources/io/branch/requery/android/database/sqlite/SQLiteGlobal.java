package io.branch.requery.android.database.sqlite;

/* loaded from: classes4.dex */
public final class SQLiteGlobal {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f61798a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static int f61799b = 0;

    /* renamed from: c, reason: collision with root package name */
    public static boolean f61800c = false;

    public static int a() {
        return nativeReleaseMemory();
    }

    public static boolean isLowRamDevice() {
        return f61800c;
    }

    private static native int nativeReleaseMemory();
}
