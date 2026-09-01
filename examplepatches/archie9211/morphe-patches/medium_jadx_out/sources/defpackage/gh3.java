package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class gh3 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[dne.values().length];
        try {
            iArr[dne.SMALLEST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[dne.SMALLER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[dne.SMALL.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[dne.NORMAL.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[dne.LARGE.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[dne.LARGER.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[dne.LARGEST.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        a = iArr;
        int[] iArr2 = new int[zy4.values().length];
        try {
            iArr2[zy4.DEFAULT.ordinal()] = 1;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr2[zy4.OPEN_DYSLEXIC.ordinal()] = 2;
        } catch (NoSuchFieldError unused9) {
        }
        b = iArr2;
        int[] iArr3 = new int[DarkMode.values().length];
        try {
            iArr3[DarkMode.LIGHT.ordinal()] = 1;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr3[DarkMode.DARK.ordinal()] = 2;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr3[DarkMode.FOLLOW_SYSTEM.ordinal()] = 3;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr3[DarkMode.AUTO_BATTERY.ordinal()] = 4;
        } catch (NoSuchFieldError unused13) {
        }
        c = iArr3;
    }
}
