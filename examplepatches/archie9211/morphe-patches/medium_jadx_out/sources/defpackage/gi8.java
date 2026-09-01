package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gi8 extends m43 {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gi8(hec hecVar, int i) {
        super(hecVar);
        this.c = i;
    }

    @Override // defpackage.l43, defpackage.mn6
    public final boolean k0() {
        switch (this.c) {
            case 0:
                return false;
            default:
                return true;
        }
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        switch (this.c) {
            case 0:
                return new gi8(hecVar, 0);
            default:
                return new gi8(hecVar, 1);
        }
    }
}
