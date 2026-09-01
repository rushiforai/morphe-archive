package defpackage;

import com.medium.refinerecommendations.RefineRecommendationsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class by4 implements e9d {
    public final /* synthetic */ uza a;
    public final /* synthetic */ sza b;

    public by4(sza szaVar, uza uzaVar) {
        this.a = uzaVar;
        this.b = szaVar;
    }

    @Override // defpackage.e9d
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        sza szaVar = this.b;
        if (z) {
            vx0.c0(f76.F(szaVar), null, null, new oza(szaVar, str, sourceParameter, n92Var, 1), 3);
        } else {
            vx0.c0(f76.F(szaVar), null, null, new oza(szaVar, str, sourceParameter, n92Var, 3), 3);
        }
    }

    @Override // defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).N(refineRecommendationsFragment.S(), str, strU);
    }

    @Override // defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        sza szaVar = this.b;
        if (szaVar.u.add(str)) {
            szaVar.e.g(str, szaVar.b, gp7.u(sourceParameter), szaVar.n);
        }
    }
}
