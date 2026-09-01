package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p1d implements cs1 {
    public final /* synthetic */ pkf a;
    public final /* synthetic */ j2d b;

    public p1d(j2d j2dVar, pkf pkfVar) {
        this.a = pkfVar;
        this.b = j2dVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "SuggestionsScreen doesn't support muting publications");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        j2d j2dVar = this.b;
        if (z) {
            vx0.c0(f76.F(j2dVar), null, null, new g2d(j2dVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(j2dVar), null, null, new g2d(j2dVar, str, sourceParameter, n92Var, 3), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        ((uza) this.a.a).a(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        j2d j2dVar = this.b;
        if (j2dVar.s.add(str)) {
            j2dVar.k.g(str, j2dVar.b, gp7.u(sourceParameter), j2dVar.o);
        }
    }
}
