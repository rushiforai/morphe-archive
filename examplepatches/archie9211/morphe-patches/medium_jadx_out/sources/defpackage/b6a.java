package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum b6a implements o56 {
    DECLARATION(0),
    FAKE_OVERRIDE(1),
    DELEGATION(2),
    SYNTHESIZED(3);

    public final int a;

    b6a(int i) {
        this.a = i;
    }

    public static b6a valueOf(int i) {
        if (i == 0) {
            return DECLARATION;
        }
        if (i == 1) {
            return FAKE_OVERRIDE;
        }
        if (i == 2) {
            return DELEGATION;
        }
        if (i != 3) {
            return null;
        }
        return SYNTHESIZED;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
