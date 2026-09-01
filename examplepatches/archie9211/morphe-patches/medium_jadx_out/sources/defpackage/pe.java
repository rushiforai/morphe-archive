package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.refinerecommendations.following.seeall.collections.AllFollowedCollectionsFragment;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pe implements cs1 {
    public final /* synthetic */ ke a;
    public final /* synthetic */ ze b;

    public pe(ke keVar, ze zeVar) {
        this.a = keVar;
        this.b = zeVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllFollowingCollectionScreen doesn't support muting publications");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        ze zeVar = this.b;
        if (z) {
            vx0.c0(f76.F(zeVar), null, null, new ra((que) zeVar, str, sourceParameter, (n92) null, 2), 3);
        } else {
            vx0.c0(f76.F(zeVar), null, null, new ra((que) zeVar, str, sourceParameter, (n92) null, 3), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllFollowedCollectionsFragment allFollowedCollectionsFragment = this.a.a;
        ((p13) allFollowedCollectionsFragment.Z()).y(allFollowedCollectionsFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        ze zeVar = this.b;
        Set linkedHashSet = (Set) zeVar.c.a("collection_ids_presented");
        if (linkedHashSet == null) {
            linkedHashSet = new LinkedHashSet();
        }
        if (linkedHashSet.add(str)) {
            zeVar.g.g(str, zeVar.b, gp7.u(sourceParameter), zeVar.k);
        }
    }
}
