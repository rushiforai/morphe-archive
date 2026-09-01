package defpackage;

import com.medium.refinerecommendations.RefineRecommendationsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r1d implements e9d {
    public final /* synthetic */ pkf a;
    public final /* synthetic */ j2d b;

    public r1d(j2d j2dVar, pkf pkfVar) {
        this.a = pkfVar;
        this.b = j2dVar;
    }

    @Override // defpackage.e9d
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        j2d j2dVar = this.b;
        if (z) {
            vx0.c0(f76.F(j2dVar), null, null, new g2d(j2dVar, str, sourceParameter, n92Var, 1), 3);
        } else {
            vx0.c0(f76.F(j2dVar), null, null, new g2d(j2dVar, str, sourceParameter, n92Var, 2), 3);
        }
    }

    @Override // defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        RefineRecommendationsFragment refineRecommendationsFragment = ((uza) this.a.a).a;
        ((p13) refineRecommendationsFragment.Z()).N(refineRecommendationsFragment.S(), str, strU);
    }

    @Override // defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        j2d j2dVar = this.b;
        if (j2dVar.t.add(str)) {
            j2dVar.l.g(str, j2dVar.b, gp7.u(sourceParameter), j2dVar.o);
        }
    }
}
