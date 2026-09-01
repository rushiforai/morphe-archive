package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class vk7 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[wp6.values().length];
        try {
            iArr[wp6.LookaheadMeasuring.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[wp6.Measuring.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[wp6.LookaheadLayingOut.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[wp6.LayingOut.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[wp6.Idle.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
