package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class ak9 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[z54.values().length];
        try {
            iArr[z54.SHOWING_LESS.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[z54.NOT_SHOWING_MORE_OR_LESS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[z54.SHOWING_MORE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[z54.CANT_SHOW_MORE_OR_LESS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[z54.ERROR.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
        int[] iArr2 = new int[bt4.values().length];
        try {
            iArr2[bt4.FOLLOWING.ordinal()] = 1;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[bt4.NOT_FOLLOWING.ordinal()] = 2;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[bt4.CANT_FOLLOW.ordinal()] = 3;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr2[bt4.ERROR.ordinal()] = 4;
        } catch (NoSuchFieldError unused9) {
        }
        b = iArr2;
        int[] iArr3 = new int[d88.values().length];
        try {
            iArr3[d88.MUTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr3[d88.NOT_MUTED.ordinal()] = 2;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr3[d88.CANT_MUTE.ordinal()] = 3;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr3[d88.ERROR.ordinal()] = 4;
        } catch (NoSuchFieldError unused13) {
        }
        c = iArr3;
    }
}
