package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.explore.ui.ExploreFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b64 {
    public final /* synthetic */ ExploreFragment a;

    public b64(ExploreFragment exploreFragment) {
        this.a = exploreFragment;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        ExploreFragment exploreFragment = this.a;
        ((p13) exploreFragment.Z()).y(exploreFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }
}
