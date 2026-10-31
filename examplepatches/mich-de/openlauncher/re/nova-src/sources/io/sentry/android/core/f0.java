package io.sentry.android.core;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f66873a;

    static {
        int[] iArr = new int[io.sentry.c0.values().length];
        f66873a = iArr;
        try {
            iArr[io.sentry.c0.DISCONNECTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f66873a[io.sentry.c0.CONNECTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
    }
}
