package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum r5a implements o56 {
    RETURNS_CONSTANT(0),
    CALLS(1),
    RETURNS_NOT_NULL(2);

    public final int a;

    r5a(int i) {
        this.a = i;
    }

    public static r5a valueOf(int i) {
        if (i == 0) {
            return RETURNS_CONSTANT;
        }
        if (i == 1) {
            return CALLS;
        }
        if (i != 2) {
            return null;
        }
        return RETURNS_NOT_NULL;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
