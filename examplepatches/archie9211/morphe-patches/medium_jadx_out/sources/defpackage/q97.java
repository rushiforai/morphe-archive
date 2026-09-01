package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class q97 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[SusiOperation.values().length];
        try {
            iArr[SusiOperation.LOGIN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[SusiOperation.REGISTER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[a14.values().length];
        try {
            iArr2[a14.USER_USERNAME_UNAVAILABLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[a14.USER_EMAIL_BLOCKED.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[a14.USER_EMAIL_UNAVAILABLE.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[a14.USER_CREATION_RATE_LIMITED.ordinal()] = 4;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[a14.AUTH_TOKEN_EXPIRED.ordinal()] = 5;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[a14.AUTH_TOKEN_NOT_FOUND.ordinal()] = 6;
        } catch (NoSuchFieldError unused8) {
        }
        b = iArr2;
    }
}
