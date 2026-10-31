package io.sentry.android.core.internal.gestures;

/* loaded from: classes4.dex */
public abstract /* synthetic */ class c {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f66907a;

    static {
        int[] iArr = new int[d.values().length];
        f66907a = iArr;
        try {
            iArr[d.Click.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f66907a[d.Scroll.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f66907a[d.Swipe.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            f66907a[d.Unknown.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
    }
}
