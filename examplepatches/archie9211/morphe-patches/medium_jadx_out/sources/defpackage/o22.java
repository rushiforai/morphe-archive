package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o22 implements kv8, gb2 {
    public static final fa4 b = new fa4(14);
    public final p65 a;

    public o22(p65 p65Var) {
        this.a = p65Var;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final /* bridge */ ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return b;
    }

    @Override // defpackage.ib2
    public final /* bridge */ ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final /* bridge */ gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }

    @Override // defpackage.kv8
    public final List s(Integer num) {
        return this.a.F();
    }

    @Override // defpackage.kv8
    public final boolean u() {
        return this.a.C;
    }
}
