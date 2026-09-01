package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class o8e {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[w9e.values().length];
        try {
            iArr[w9e.ALL_ACTIVITIES.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[w9e.CLAPS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[w9e.RESPONSES.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[w9e.HIGHLIGHTS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        a = iArr;
    }
}
