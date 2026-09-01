package defpackage;

import com.medium.android.data.preferences.DarkMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class q2c {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[x2c.values().length];
        try {
            iArr[x2c.X.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[x2c.FACEBOOK.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[DarkMode.values().length];
        try {
            iArr2[DarkMode.LIGHT.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[DarkMode.DARK.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[DarkMode.FOLLOW_SYSTEM.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[DarkMode.AUTO_BATTERY.ordinal()] = 4;
        } catch (NoSuchFieldError unused6) {
        }
        b = iArr2;
        int[] iArr3 = new int[zw7.values().length];
        try {
            iArr3[zw7.REGULAR.ordinal()] = 1;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr3[zw7.PREMIUM.ordinal()] = 2;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr3[zw7.NOT_A_MEMBER.ordinal()] = 3;
        } catch (NoSuchFieldError unused9) {
        }
        c = iArr3;
    }
}
