package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.core.share.RepostShareData;
import com.medium.android.graphql.type.CatalogItemType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ile implements k8b {
    public final /* synthetic */ dle a;
    public final /* synthetic */ Context b;
    public final /* synthetic */ ime c;

    public ile(dle dleVar, Context context, ime imeVar) {
        this.a = dleVar;
        this.b = context;
        this.c = imeVar;
    }

    @Override // defpackage.k8b
    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.c;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.k8b
    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.c;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.k8b
    public final void c(String str, String str2, g08 g08Var) {
        g08Var.getClass();
        this.a.H(str, str2, g08Var);
    }

    @Override // defpackage.k8b
    public final void d(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ime imeVar = this.c;
        vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.k8b
    public final void e(String str, boolean z, g08 g08Var) {
        g08Var.getClass();
        n92 n92Var = null;
        ime imeVar = this.c;
        if (z) {
            vx0.c0(f76.F(imeVar), null, null, new fme(imeVar, str, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(imeVar), null, null, new j5d(imeVar, str, n92Var, 19), 3);
        }
    }

    @Override // defpackage.k8b
    public final void f(Uri uri, SourceParameter sourceParameter) {
        uri.getClass();
        sourceParameter.getClass();
        this.a.X(uri, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void g(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        this.a.J(sourceParameter, str, str2);
    }

    @Override // defpackage.k8b
    public final void h(String str, g08 g08Var) {
        g08Var.getClass();
        this.a.B(str, g08Var);
    }

    @Override // defpackage.k8b
    public final void i(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a.c(CatalogItemType.POST, str, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void j(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a.r(sourceParameter, str, null);
    }

    @Override // defpackage.k8b
    public final void k(RepostShareData repostShareData, g08 g08Var) {
        repostShareData.getClass();
        g08Var.getClass();
        if (repostShareData.getNote() != null) {
            j7c.c(this.b, repostShareData);
        } else {
            this.a.e(repostShareData.getPostShareData(), g08Var);
        }
    }

    @Override // defpackage.k8b
    public final void l(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        ime imeVar = this.c;
        if (str2 != null) {
            vx0.c0(f76.F(imeVar), null, null, new gbd(imeVar, str2, str, sourceParameter, null, 17), 3);
        } else {
            vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, n92Var, 5), 3);
        }
    }

    @Override // defpackage.k8b
    public final void m(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k(str, sourceParameter);
    }

    @Override // defpackage.k8b
    public final void n(String str, g08 g08Var) {
        g08Var.getClass();
        ime imeVar = this.c;
        vx0.c0(f76.F(imeVar), null, null, new fme(imeVar, str, null, 1), 3);
    }
}
