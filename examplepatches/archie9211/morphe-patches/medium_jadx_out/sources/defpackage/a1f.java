package defpackage;

import com.apollographql.apollo.exception.DefaultApolloException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a1f implements g00, n00 {
    public final zw2 a;

    public a1f(zw2 zw2Var) {
        this.a = zw2Var;
    }

    @Override // defpackage.g00
    public final bo4 a(h00 h00Var, ad adVar) {
        h00Var.getClass();
        hv8 hv8Var = h00Var.a;
        s44 s44Var = h00Var.c;
        pxe pxeVar = (pxe) s44Var.d(pxe.b);
        if (pxeVar == null) {
            return adVar.n(h00Var);
        }
        n92 n92Var = null;
        if (!(hv8Var instanceof uqa)) {
            ygf.f("It's impossible to watch a mutation or subscription");
            return null;
        }
        q44 q44VarD = s44Var.d(yl2.d);
        q44VarD.getClass();
        yl2 yl2Var = (yl2) q44VarD;
        rya ryaVar = new rya();
        sqa sqaVar = pxeVar.a;
        zw2 zw2Var = this.a;
        ryaVar.a = sqaVar != null ? kp7.k(kp7.p(hv8Var, sqaVar, yl2Var, zw2Var.b).values()) : null;
        z0f z0fVar = new z0f(new pja(new xwc(zw2Var.e, new a74(2, 9, n92Var)), ryaVar, 13), h00Var, adVar, ryaVar, this, yl2Var);
        DefaultApolloException defaultApolloException = b1f.a;
        return new u50(12, new cfd(z0fVar, n92Var, 23));
    }
}
