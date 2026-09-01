package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.refinerecommendations.RefineRecommendationsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uza implements vya {
    public final /* synthetic */ RefineRecommendationsFragment a;

    public uza(RefineRecommendationsFragment refineRecommendationsFragment) {
        this.a = refineRecommendationsFragment;
    }

    public final void a(String str, String str2) {
        str.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a;
        ((p13) refineRecommendationsFragment.Z()).y(refineRecommendationsFragment.S(), new PublicationReference.Id(str), str2, PublicationTab.Home.INSTANCE);
    }

    public final void b(String str, String str2) {
        str.getClass();
        RefineRecommendationsFragment refineRecommendationsFragment = this.a;
        ((p13) refineRecommendationsFragment.Z()).Q(refineRecommendationsFragment.S(), str, str2);
    }
}
