package io.sentry.android.core;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class r {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f67063a;

    static {
        int[] iArr = new int[io.sentry.c0.values().length];
        f67063a = iArr;
        try {
            iArr[io.sentry.c0.CONNECTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f67063a[io.sentry.c0.UNKNOWN.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f67063a[io.sentry.c0.NO_PERMISSION.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
