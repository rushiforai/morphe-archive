package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uya implements pta {
    public final /* synthetic */ uza a;

    public uya(uza uzaVar) {
        this.a = uzaVar;
    }

    @Override // defpackage.pta
    public final void K(String str, String str2, String str3) throws PendingIntent.CanceledException {
        str2.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).p0(refineRecommendationsFragment.S(), str, str2, str3);
    }

    @Override // defpackage.pta
    public final void M(String str, String str2) throws PendingIntent.CanceledException {
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).u0(refineRecommendationsFragment.S(), str, str2);
    }

    @Override // defpackage.pta
    public final void N(String str, EntityType entityType, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).j(refineRecommendationsFragment.S(), str, entityType, gp7.u(sourceParameter));
    }

    @Override // defpackage.pta
    public final void O(PostShareData postShareData, String str, String str2, String str3) throws PendingIntent.CanceledException {
        postShareData.getClass();
        str.getClass();
        str3.getClass();
        SourceParameter sourceParameter = new SourceParameter(str2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).t0(refineRecommendationsFragment.S(), postShareData, str, gp7.u(sourceParameter), str3);
    }

    @Override // defpackage.pta
    public final void b(String str, String str2) {
        str.getClass();
        this.a.b(str, str2);
    }

    @Override // defpackage.pta
    public final void c(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        b09.O(refineRecommendationsFragment.Z(), refineRecommendationsFragment.S(), str, str2, null, null, null, 120);
    }

    @Override // defpackage.pta
    public final void e(CatalogItemType catalogItemType, String str, String str2) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).m0(refineRecommendationsFragment.S(), CatalogItemType.POST, str, str2);
    }

    @Override // defpackage.pta
    public final void g(String str, String str2, String str3) throws PendingIntent.CanceledException {
        SourceParameter sourceParameter = new SourceParameter(str3, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        ((p13) refineRecommendationsFragment.Z()).j0(refineRecommendationsFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.pta
    public final void i() {
        RefineRecommendationsFragment refineRecommendationsFragment = this.a.a;
        refineRecommendationsFragment.Z();
        m4.i(refineRecommendationsFragment.S()).b.m(R.id.homeFragment, false);
    }

    @Override // defpackage.pta
    public final void j(String str, String str2) {
        this.a.a(str, str2);
    }
}
