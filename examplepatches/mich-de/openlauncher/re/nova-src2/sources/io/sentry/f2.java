package io.sentry;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class f2 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f67222a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int[] f67223b;

    static {
        int[] iArr = new int[io.sentry.rrweb.c.values().length];
        f67223b = iArr;
        try {
            iArr[io.sentry.rrweb.c.IncrementalSnapshot.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f67223b[io.sentry.rrweb.c.Meta.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f67223b[io.sentry.rrweb.c.Custom.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        int[] iArr2 = new int[io.sentry.rrweb.d.values().length];
        f67222a = iArr2;
        try {
            iArr2[io.sentry.rrweb.d.MouseInteraction.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            f67222a[io.sentry.rrweb.d.TouchMove.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
