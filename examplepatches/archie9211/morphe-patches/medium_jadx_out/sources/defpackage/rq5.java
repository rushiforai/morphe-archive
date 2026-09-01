package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.home.ui.home.HomeFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rq5 implements vn8 {
    public final /* synthetic */ ar5 a;
    public final /* synthetic */ gq5 b;
    public final /* synthetic */ String c;

    public rq5(ar5 ar5Var, gq5 gq5Var, String str) {
        this.a = ar5Var;
        this.b = gq5Var;
        this.c = str;
    }

    @Override // defpackage.vn8
    public final void a(UpsellInfo upsellInfo, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        upsellInfo.getClass();
        sourceParameter.getClass();
        ar5 ar5Var = this.a;
        ar5Var.d.e(upsellInfo, ar5Var.l, gp7.u(sourceParameter), ar5Var.b);
        dq5 dq5Var = (dq5) this.b;
        String str = this.c;
        str.getClass();
        HomeFragment homeFragment = dq5Var.a;
        ((p13) homeFragment.Z()).J(homeFragment.S(), upsellInfo, str, null);
    }

    @Override // defpackage.vn8
    public final void b(UpsellInfo upsellInfo, SourceParameter sourceParameter) {
        upsellInfo.getClass();
        sourceParameter.getClass();
        ar5 ar5Var = this.a;
        if (ar5Var.q) {
            return;
        }
        ar5Var.q = true;
        ar5Var.d.f(upsellInfo, ar5Var.l, gp7.u(sourceParameter), ar5Var.b);
    }

    public final void c(String str, EntityType entityType, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).j(homeFragment.S(), str, entityType, gp7.u(sourceParameter));
    }

    public final void d(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        b09.O(homeFragment.Z(), homeFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    public final void e(String str, SourceParameter sourceParameter) {
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).y(homeFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    public final void f(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).Q(homeFragment.S(), str, gp7.u(sourceParameter));
    }

    public final void g() {
        ar5 ar5Var = this.a;
        ar5Var.c.O(null);
        xpc xpcVar = ar5Var.r;
        Boolean bool = Boolean.TRUE;
        xpcVar.getClass();
        xpcVar.m(null, bool);
        if (ar5Var.k) {
            return;
        }
        ar5Var.k = true;
        slc slcVar = ar5Var.h;
        slcVar.getClass();
        slcVar.a("user.feedScrolled", nl4.ENABLE_SPRIG_EVENT_FEED_SCROLLED, fy3.a);
    }

    public final void h(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).m0(homeFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
    }

    public final void i(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).j0(homeFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    public final void j(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).p0(homeFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    public final void k(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        postShareData.getClass();
        g08Var.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).t0(homeFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
    }

    public final void l(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        HomeFragment homeFragment = ((dq5) this.b).a;
        ((p13) homeFragment.Z()).u0(homeFragment.S(), str, gp7.u(sourceParameter));
    }
}
