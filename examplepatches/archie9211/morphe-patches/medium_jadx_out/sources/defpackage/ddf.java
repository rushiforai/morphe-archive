package defpackage;

import android.content.Context;
import android.os.Bundle;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ddf {
    public final /* synthetic */ ref a;
    public final /* synthetic */ acf b;

    public ddf(ref refVar, acf acfVar) {
        this.a = refVar;
        this.b = acfVar;
    }

    public final void a(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YourFollowingFeedFragment yourFollowingFeedFragment = this.b.a;
        ((p13) yourFollowingFeedFragment.Z()).m(yourFollowingFeedFragment.S(), gp7.u(sourceParameter), true);
    }

    public final void b(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        YourFollowingFeedFragment yourFollowingFeedFragment = this.b.a;
        yourFollowingFeedFragment.Z();
        Context contextS = yourFollowingFeedFragment.S();
        String strU = gp7.u(sourceParameter);
        RefineRecommendationsTab refineRecommendationsTab = RefineRecommendationsTab.Suggestions;
        RefineRecommendationsFilter refineRecommendationsFilter = RefineRecommendationsFilter.ALL;
        refineRecommendationsTab.getClass();
        refineRecommendationsFilter.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable(uuLAxLN.xQyOpXPPQ, new RefineRecommendationsFragment.BundleInfo(refineRecommendationsTab, refineRecommendationsFilter, strU));
        m4.w(contextS, R.id.refineRecommendationsFragment, bundle, null, 12);
    }
}
