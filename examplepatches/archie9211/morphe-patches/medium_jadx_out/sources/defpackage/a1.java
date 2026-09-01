package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class a1 implements gb2 {
    public final hb2 a;

    public a1(hb2 hb2Var) {
        this.a = hb2Var;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public /* bridge */ ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return this.a;
    }

    @Override // defpackage.ib2
    public final /* bridge */ ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public /* bridge */ gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }
}
