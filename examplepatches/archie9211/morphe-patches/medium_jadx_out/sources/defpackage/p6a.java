package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum p6a implements o56 {
    IN(0),
    OUT(1),
    INV(2),
    STAR(3);

    public final int a;

    p6a(int i) {
        this.a = i;
    }

    public static p6a valueOf(int i) {
        if (i == 0) {
            return IN;
        }
        if (i == 1) {
            return OUT;
        }
        if (i == 2) {
            return INV;
        }
        if (i != 3) {
            return null;
        }
        return STAR;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
