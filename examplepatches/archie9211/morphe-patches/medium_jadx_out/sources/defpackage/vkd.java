package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class vkd {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[DarkMode.values().length];
        try {
            iArr[DarkMode.DARK.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[DarkMode.LIGHT.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[DarkMode.FOLLOW_SYSTEM.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[DarkMode.AUTO_BATTERY.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
