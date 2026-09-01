package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class scf implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ddf b;
    public final /* synthetic */ SourceParameter c;

    public /* synthetic */ scf(ddf ddfVar, SourceParameter sourceParameter, int i) {
        this.a = i;
        this.b = ddfVar;
        this.c = sourceParameter;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        SourceParameter sourceParameter = this.c;
        ddf ddfVar = this.b;
        switch (i) {
            case 0:
                ddfVar.a(sourceParameter);
                break;
            case 1:
                ddfVar.b(sourceParameter);
                break;
            case 2:
                sourceParameter.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ddfVar.b.a;
                yourFollowingFeedFragment.Z();
                Context contextS = yourFollowingFeedFragment.S();
                String strU = gp7.u(sourceParameter);
                RefineRecommendationsTab refineRecommendationsTab = RefineRecommendationsTab.Suggestions;
                RefineRecommendationsFilter refineRecommendationsFilter = RefineRecommendationsFilter.TAGS;
                refineRecommendationsTab.getClass();
                refineRecommendationsFilter.getClass();
                Bundle bundle = new Bundle();
                bundle.putParcelable("bundle_info", new RefineRecommendationsFragment.BundleInfo(refineRecommendationsTab, refineRecommendationsFilter, strU));
                m4.w(contextS, R.id.refineRecommendationsFragment, bundle, null, 12);
                break;
            case 3:
                ddfVar.b(sourceParameter);
                break;
            default:
                ddfVar.a(sourceParameter);
                break;
        }
        return c1eVar;
    }
}
