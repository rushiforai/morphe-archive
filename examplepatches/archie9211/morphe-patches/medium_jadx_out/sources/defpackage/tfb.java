package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseReference;
import com.medium.android.responses.ResponsesFragment;
import com.medium.reader.R;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tfb implements xfb {
    public final /* synthetic */ ResponsesFragment a;

    public tfb(ResponsesFragment responsesFragment) {
        this.a = responsesFragment;
    }

    @Override // defpackage.xfb
    public final void F(String str, String str2) {
        str.getClass();
        ResponsesFragment responsesFragment = this.a;
        ((p13) responsesFragment.Z()).Q(responsesFragment.S(), str, str2);
    }

    @Override // defpackage.xfb
    public final void G(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        ResponsesFragment responsesFragment = this.a;
        b09.K(responsesFragment.Z(), responsesFragment.S(), new EditPostReference.ExistingPost(str), str2);
    }

    @Override // defpackage.xfb
    public final void J(ResponsesReference.Post post, String str) {
        ResponsesFragment responsesFragment = this.a;
        ((p13) responsesFragment.Z()).E(responsesFragment.S(), post, str, false);
    }

    @Override // defpackage.xfb
    public final void a() {
        k40.X(this.a).f();
    }

    @Override // defpackage.xfb
    public final void b(String str, String str2) {
        ResponsesFragment responsesFragment = this.a;
        py2 py2Var = responsesFragment.u0;
        if (py2Var != null) {
            py2Var.a(responsesFragment.S(), Uri.parse(str), str2, null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }

    @Override // defpackage.xfb
    public final void c(String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        ResponsesFragment responsesFragment = this.a;
        b09.O(responsesFragment.Z(), responsesFragment.S(), str, str2, null, null, null, 120);
    }

    @Override // defpackage.xfb
    public final void e(String str, String str2) {
        str.getClass();
        str2.getClass();
        ResponsesFragment responsesFragment = this.a;
        py2 py2Var = responsesFragment.u0;
        if (py2Var == null) {
            g76.g0("deepLinkHandler");
            throw null;
        }
        Context contextS = responsesFragment.S();
        if (responsesFragment.v0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        pt5 pt5Var = new pt5();
        pt5Var.h("https");
        i03 i03Var = i03.a;
        pt5Var.e("medium.com");
        pt5Var.a("p");
        pt5Var.a(str);
        pt5Var.a("info");
        pt5Var.b("source", str2);
        py2Var.a(contextS, Uri.parse(muc.l0(pt5Var.c().i, "/")), str2, null);
    }

    @Override // defpackage.xfb
    public final void f(String str, String str2, String str3, String str4, boolean z) throws PendingIntent.CanceledException {
        b09.I(str, str2, str3);
        ResponsesFragment responsesFragment = this.a;
        ((p13) responsesFragment.Z()).q0(responsesFragment.S(), str, str2, str3, z, str4);
    }

    @Override // defpackage.xfb
    public final void g(String str) {
        ResponsesFragment responsesFragment = this.a;
        py2 py2Var = responsesFragment.u0;
        if (py2Var == null) {
            g76.g0(MaAxRJinch.olmmxYw);
            throw null;
        }
        Context contextS = responsesFragment.S();
        if (responsesFragment.v0 != null) {
            py2Var.a(contextS, Uri.parse(i03.t), str, null);
        } else {
            g76.g0("mediumUris");
            throw null;
        }
    }

    @Override // defpackage.xfb
    public final void d(String str) {
        str.getClass();
        ResponsesFragment responsesFragment = this.a;
        py2 py2Var = responsesFragment.u0;
        if (py2Var != null) {
            Context contextS = responsesFragment.S();
            if (responsesFragment.v0 != null) {
                py2Var.a(contextS, Uri.parse(i03.w), str, null);
                return;
            } else {
                g76.g0(gYpYQDQkhfs.UyDG);
                throw null;
            }
        }
        g76.g0("deepLinkHandler");
        throw null;
    }

    @Override // defpackage.xfb
    public final void h(String str, String str2, String str3, String str4, boolean z) throws PendingIntent.CanceledException {
        b09.I(str, str2, str3);
        ResponsesFragment responsesFragment = this.a;
        responsesFragment.Z();
        Context contextS = responsesFragment.S();
        ReportResponseReference.Catalog catalog = new ReportResponseReference.Catalog(str, z, str3);
        Bundle bundle = new Bundle();
        bundle.putParcelable(MaAxRJinch.yzgRK, new ReportResponseDialogFragment.BundleInfo(catalog, str2, str4));
        m4.w(contextS, R.id.reportResponseDialogFragment, bundle, null, 12);
    }
}
