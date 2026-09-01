package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.refinerecommendations.muted.seeall.collections.AllMutedCollectionsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hg implements cs1 {
    public final /* synthetic */ fg a;
    public final /* synthetic */ ug b;

    public hg(fg fgVar, ug ugVar) {
        this.a = fgVar;
        this.b = ugVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        ug ugVar = this.b;
        if (z) {
            vx0.c0(f76.F(ugVar), null, null, new sg(ugVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(ugVar), null, null, new sg(ugVar, str, sourceParameter, n92Var, 1), 3);
        }
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllMutedCollectionScreen doesn't support following publications");
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllMutedCollectionsFragment allMutedCollectionsFragment = this.a.a;
        ((p13) allMutedCollectionsFragment.Z()).y(allMutedCollectionsFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        ug ugVar = this.b;
        if (ugVar.i.add(str)) {
            ugVar.f.g(str, ugVar.b, gp7.u(sourceParameter), ugVar.j);
        }
    }
}
