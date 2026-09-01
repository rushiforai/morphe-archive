package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum g7a implements o56 {
    INTERNAL(0),
    PRIVATE(1),
    PROTECTED(2),
    PUBLIC(3),
    PRIVATE_TO_THIS(4),
    LOCAL(5);

    public final int a;

    g7a(int i) {
        this.a = i;
    }

    public static g7a valueOf(int i) {
        if (i == 0) {
            return INTERNAL;
        }
        if (i == 1) {
            return PRIVATE;
        }
        if (i == 2) {
            return PROTECTED;
        }
        if (i == 3) {
            return PUBLIC;
        }
        if (i == 4) {
            return PRIVATE_TO_THIS;
        }
        if (i != 5) {
            return null;
        }
        return LOCAL;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
