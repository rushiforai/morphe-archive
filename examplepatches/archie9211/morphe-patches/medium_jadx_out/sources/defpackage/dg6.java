package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum dg6 implements o56 {
    NONE(0),
    INTERNAL_TO_CLASS_ID(1),
    DESC_TO_CLASS_ID(2);

    public final int a;

    dg6(int i) {
        this.a = i;
    }

    public static dg6 valueOf(int i) {
        if (i == 0) {
            return NONE;
        }
        if (i == 1) {
            return INTERNAL_TO_CLASS_ID;
        }
        if (i != 2) {
            return null;
        }
        return DESC_TO_CLASS_ID;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
