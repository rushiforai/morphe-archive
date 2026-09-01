package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kec extends m43 {
    public final uvd c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kec(hec hecVar, uvd uvdVar) {
        super(hecVar);
        uvdVar.getClass();
        this.c = uvdVar;
    }

    @Override // defpackage.l43, defpackage.mn6
    public final uvd i0() {
        return this.c;
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        return new kec(hecVar, this.c);
    }
}
