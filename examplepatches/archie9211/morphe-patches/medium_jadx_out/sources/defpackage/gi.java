package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.refinerecommendations.suggestions.seeall.publications.AllSuggestionsPublicationsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gi implements cs1 {
    public final /* synthetic */ fi a;
    public final /* synthetic */ si b;

    public gi(fi fiVar, si siVar) {
        this.a = fiVar;
        this.b = siVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllSuggestionsPublicationsScreen doesn't support muting publications");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        si siVar = this.b;
        if (z) {
            vx0.c0(f76.F(siVar), null, null, new pi(siVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(siVar), null, null, new pi(siVar, str, sourceParameter, n92Var, 1), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllSuggestionsPublicationsFragment allSuggestionsPublicationsFragment = ((di) this.a).a;
        ((p13) allSuggestionsPublicationsFragment.Z()).y(allSuggestionsPublicationsFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        si siVar = this.b;
        if (siVar.m.add(str)) {
            siVar.f.g(str, siVar.b, gp7.u(sourceParameter), siVar.h);
        }
    }
}
