package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract /* synthetic */ class q83 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[qn1.values().length];
        try {
            iArr[qn1.CLASS.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[qn1.INTERFACE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[qn1.ENUM_CLASS.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[qn1.OBJECT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[qn1.ANNOTATION_CLASS.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[qn1.ENUM_ENTRY.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
    }
}
