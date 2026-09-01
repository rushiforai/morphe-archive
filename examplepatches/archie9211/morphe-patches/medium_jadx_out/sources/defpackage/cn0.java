package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class cn0 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[npc.values().length];
        a = iArr;
        try {
            iArr[npc.LEFT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            a[npc.START.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            a[npc.RIGHT.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            a[npc.END.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            a[npc.TOP.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            a[npc.BOTTOM.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
