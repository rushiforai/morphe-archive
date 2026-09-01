package defpackage;

import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ui implements e9d {
    public final /* synthetic */ olb a;
    public final /* synthetic */ ej b;

    public ui(ej ejVar, olb olbVar) {
        this.a = olbVar;
        this.b = ejVar;
    }

    @Override // defpackage.e9d
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        ej ejVar = this.b;
        if (z) {
            vx0.c0(f76.F(ejVar), null, null, new cj(ejVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(ejVar), null, null, new cj(ejVar, str, sourceParameter, n92Var, 1), 3);
        }
    }

    @Override // defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        String strU = gp7.u(sourceParameter);
        AllSuggestedTagsFragment allSuggestedTagsFragment = (AllSuggestedTagsFragment) this.a.b;
        ((p13) allSuggestedTagsFragment.Z()).N(allSuggestedTagsFragment.S(), str, strU);
    }

    @Override // defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        ej ejVar = this.b;
        if (ejVar.i.add(str)) {
            ejVar.f.g(str, ejVar.b, gp7.u(sourceParameter), ejVar.j);
        }
    }
}
