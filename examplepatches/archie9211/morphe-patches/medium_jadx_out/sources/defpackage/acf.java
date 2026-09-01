package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class acf {
    public final /* synthetic */ YourFollowingFeedFragment a;

    public acf(YourFollowingFeedFragment yourFollowingFeedFragment) {
        this.a = yourFollowingFeedFragment;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        YourFollowingFeedFragment yourFollowingFeedFragment = this.a;
        ((p13) yourFollowingFeedFragment.Z()).y(yourFollowingFeedFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }
}
