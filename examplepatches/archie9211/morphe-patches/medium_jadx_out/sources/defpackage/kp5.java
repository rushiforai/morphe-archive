package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.share.RepostShareData;
import com.medium.android.home.ui.home.HomeFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kp5 implements k8b {
    public final /* synthetic */ rq5 a;
    public final /* synthetic */ Context b;
    public final /* synthetic */ bq5 c;

    public kp5(rq5 rq5Var, Context context, bq5 bq5Var) {
        this.a = rq5Var;
        this.b = context;
        this.c = bq5Var;
    }

    @Override // defpackage.k8b
    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        bq5 bq5Var = this.c;
        vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.k8b
    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        bq5 bq5Var = this.c;
        vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.k8b
    public final void c(String str, String str2, g08 g08Var) {
        g08Var.getClass();
        throw new UnsupportedOperationException("Editing a repost note is not supported.");
    }

    @Override // defpackage.k8b
    public final void d(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        bq5 bq5Var = this.c;
        vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.k8b
    public final void e(String str, boolean z, g08 g08Var) {
        g08Var.getClass();
        throw new UnsupportedOperationException("Deleting a repost is not supported.");
    }

    @Override // defpackage.k8b
    public final void f(Uri uri, SourceParameter sourceParameter) {
        uri.getClass();
        sourceParameter.getClass();
        rq5 rq5Var = this.a;
        rq5Var.getClass();
        HomeFragment homeFragment = ((dq5) rq5Var.b).a;
        py2 py2Var = homeFragment.w0;
        if (py2Var != null) {
            py2Var.a(homeFragment.S(), uri, gp7.u(sourceParameter), null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }

    @Override // defpackage.k8b
    public final void g(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str2.getClass();
        sourceParameter.getClass();
        rq5 rq5Var = this.a;
        rq5Var.getClass();
        HomeFragment homeFragment = ((dq5) rq5Var.b).a;
        ((p13) homeFragment.Z()).r0(homeFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.k8b
    public final void h(String str, g08 g08Var) {
        g08Var.getClass();
        throw new UnsupportedOperationException("Adding a note to a repost is not supported.");
    }

    @Override // defpackage.k8b
    public final void i(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        this.a.h(str, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void j(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        this.a.d(str, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void k(RepostShareData repostShareData, g08 g08Var) throws PendingIntent.CanceledException {
        repostShareData.getClass();
        g08Var.getClass();
        if (repostShareData.getNote() != null) {
            j7c.c(this.b, repostShareData);
        } else {
            this.a.k(repostShareData.getPostShareData(), g08Var);
        }
    }

    @Override // defpackage.k8b
    public final void l(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        bq5 bq5Var = this.c;
        if (str2 != null) {
            vx0.c0(f76.F(bq5Var), null, null, new zo5(bq5Var, str2, str, sourceParameter, null, 1), 3);
        } else {
            vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, n92Var, 6), 3);
        }
    }

    @Override // defpackage.k8b
    public final void m(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        this.a.c(str, EntityType.AUTHOR, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void n(String str, g08 g08Var) {
        g08Var.getClass();
        throw new UnsupportedOperationException("Removing a repost note is not supported.");
    }
}
