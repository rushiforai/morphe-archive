package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class c {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[cd6.values().length];
        try {
            iArr[cd6.NULL.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[cd6.BOOLEAN.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[cd6.LONG.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[cd6.NUMBER.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[cd6.STRING.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[cd6.BEGIN_OBJECT.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[cd6.BEGIN_ARRAY.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        a = iArr;
    }
}
