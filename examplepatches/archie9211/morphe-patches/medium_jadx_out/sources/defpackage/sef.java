package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.share.PostShareData;
import com.medium.android.digest.ui.digesthistory.DigestHistoryDialogFragment;
import com.medium.android.digest.ui.settings.c;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.yourlibrary.YourLibraryFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sef implements uef {
    public final /* synthetic */ YourLibraryFragment a;

    public sef(YourLibraryFragment yourLibraryFragment) {
        this.a = yourLibraryFragment;
    }

    @Override // defpackage.pta
    public final void K(String str, String str2, String str3) throws PendingIntent.CanceledException {
        str2.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).p0(yourLibraryFragment.S(), str, str2, str3);
    }

    @Override // defpackage.pta
    public final void M(String str, String str2) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).u0(yourLibraryFragment.S(), str, str2);
    }

    @Override // defpackage.pta
    public final void N(String str, EntityType entityType, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).j(yourLibraryFragment.S(), str, entityType, gp7.u(sourceParameter));
    }

    @Override // defpackage.pta
    public final void O(PostShareData postShareData, String str, String str2, String str3) throws PendingIntent.CanceledException {
        postShareData.getClass();
        str.getClass();
        str3.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).t0(yourLibraryFragment.S(), postShareData, str, str2, str3);
    }

    @Override // defpackage.uef
    public final void a(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        yourLibraryFragment.Z();
        m4.w(yourLibraryFragment.S(), R.id.digestSettingsFragment, c.a(gp7.u(sourceParameter)), null, 12);
    }

    @Override // defpackage.pta
    public final void b(String str, String str2) {
        str.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).Q(yourLibraryFragment.S(), str, str2);
    }

    @Override // defpackage.pta
    public final void c(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        b09.O(yourLibraryFragment.Z(), yourLibraryFragment.S(), str, str2, null, null, null, 120);
    }

    @Override // defpackage.uef
    public final void d(String str, String str2) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).h0(yourLibraryFragment.S(), str, str2);
    }

    @Override // defpackage.pta
    public final void e(CatalogItemType catalogItemType, String str, String str2) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).m0(yourLibraryFragment.S(), catalogItemType, str, str2);
    }

    @Override // defpackage.uef
    public final void f(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).w0(yourLibraryFragment.S(), str, str2);
    }

    @Override // defpackage.pta
    public final void g(String str, String str2, String str3) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).j0(yourLibraryFragment.S(), str, str2, str3);
    }

    @Override // defpackage.uef
    public final void h(SourceParameter sourceParameter, String str, String str2, String str3) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        str3.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        yourLibraryFragment.Z();
        Context contextS = yourLibraryFragment.S();
        String strU = gp7.u(sourceParameter);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new DigestHistoryDialogFragment.BundleInfo(str, str2, strU, str3));
        m4.w(contextS, R.id.digestHistoryDialogFragment, bundle, null, 12);
    }

    @Override // defpackage.pta
    public final void i() {
        YourLibraryFragment yourLibraryFragment = this.a;
        yourLibraryFragment.Z();
        m4.i(yourLibraryFragment.S()).b.m(R.id.homeFragment, false);
    }

    @Override // defpackage.pta
    public final void j(String str, String str2) {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).y(yourLibraryFragment.S(), new PublicationReference.Id(str), str2, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.uef
    public final void k(String str, String str2, String str3) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        b09.O(yourLibraryFragment.Z(), yourLibraryFragment.S(), str, str3, str2, null, null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
    }

    @Override // defpackage.uef
    public final void l(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).C(yourLibraryFragment.S(), gp7.u(sourceParameter));
    }

    @Override // defpackage.uef
    public final void m(String str) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).g0(yourLibraryFragment.S(), str);
    }

    @Override // defpackage.uef
    public final void n() {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).d0(yourLibraryFragment.S());
    }

    @Override // defpackage.uef
    public final void s(UpsellInfo upsellInfo, String str) throws PendingIntent.CanceledException {
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).J(yourLibraryFragment.S(), upsellInfo, str, null);
    }

    @Override // defpackage.uef
    public final void v(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        b09.K(yourLibraryFragment.Z(), yourLibraryFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.uef
    public final void w(String str, String str2) {
        str.getClass();
        YourLibraryFragment yourLibraryFragment = this.a;
        ((p13) yourLibraryFragment.Z()).c(yourLibraryFragment.S(), str, str2);
    }

    @Override // defpackage.uef
    public final void x(eg1 eg1Var) {
        eg1Var.getClass();
        j7c.a(this.a.S(), eg1Var);
    }
}
