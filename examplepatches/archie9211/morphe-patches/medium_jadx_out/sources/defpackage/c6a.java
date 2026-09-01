package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum c6a implements o56 {
    FINAL(0),
    OPEN(1),
    ABSTRACT(2),
    SEALED(3);

    public final int a;

    c6a(int i) {
        this.a = i;
    }

    public static c6a valueOf(int i) {
        if (i == 0) {
            return FINAL;
        }
        if (i == 1) {
            return OPEN;
        }
        if (i == 2) {
            return ABSTRACT;
        }
        if (i != 3) {
            return null;
        }
        return SEALED;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
