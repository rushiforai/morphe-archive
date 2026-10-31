package b;

import android.webkit.ConsoleMessage;

/* loaded from: classes.dex */
public abstract /* synthetic */ class qb {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f15986a;

    static {
        int[] iArr = new int[ConsoleMessage.MessageLevel.values().length];
        try {
            iArr[ConsoleMessage.MessageLevel.ERROR.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ConsoleMessage.MessageLevel.WARNING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[ConsoleMessage.MessageLevel.DEBUG.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        f15986a = iArr;
    }
}
