package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.search.ui.main.SearchFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class htb implements jtb {
    public final /* synthetic */ SearchFragment a;

    public htb(SearchFragment searchFragment) {
        this.a = searchFragment;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        SearchFragment searchFragment = this.a;
        ((p13) searchFragment.Z()).y(searchFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }
}
