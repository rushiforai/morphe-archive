package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.data.post.model.ReportRepostReason;
import com.medium.android.repost.ui.report.ReportRepostDialogFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class c6b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ e6b b;
    public final /* synthetic */ j6b c;

    public /* synthetic */ c6b(int i, e6b e6bVar, j6b j6bVar) {
        this.a = i;
        this.b = e6bVar;
        this.c = j6bVar;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j6b j6bVar = this.c;
        e6b e6bVar = this.b;
        switch (i) {
            case 0:
                SourceParameter sourceParameter = j6bVar.d;
                e6bVar.getClass();
                sourceParameter.getClass();
                my6 my6Var = e6bVar.a;
                String strU = gp7.u(sourceParameter);
                ReportRepostDialogFragment reportRepostDialogFragment = (ReportRepostDialogFragment) my6Var.a;
                p13 p13Var = reportRepostDialogFragment.H0;
                if (p13Var == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS = reportRepostDialogFragment.S();
                if (reportRepostDialogFragment.I0 != null) {
                    p13Var.g(contextS, Uri.parse(i03.x), strU);
                    return c1eVar;
                }
                g76.g0("mediumUris");
                throw null;
            case 1:
                SourceParameter sourceParameter2 = j6bVar.d;
                e6bVar.getClass();
                sourceParameter2.getClass();
                my6 my6Var2 = e6bVar.a;
                String strU2 = gp7.u(sourceParameter2);
                ReportRepostDialogFragment reportRepostDialogFragment2 = (ReportRepostDialogFragment) my6Var2.a;
                p13 p13Var2 = reportRepostDialogFragment2.H0;
                if (p13Var2 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS2 = reportRepostDialogFragment2.S();
                if (reportRepostDialogFragment2.I0 != null) {
                    p13Var2.g(contextS2, Uri.parse(i03.w), strU2);
                    return c1eVar;
                }
                g76.g0("mediumUris");
                throw null;
            default:
                ReportRepostReason reportRepostReason = j6bVar.a;
                if (reportRepostReason == null) {
                    ay0.e("Report action should be disabled when no report reason is selected");
                    return null;
                }
                boolean z = j6bVar.b;
                e6bVar.getClass();
                k6b k6bVar = e6bVar.b;
                vx0.c0(f76.F(k6bVar), null, null, new qa(k6bVar, reportRepostReason, z, (n92) null, 14), 3);
                return c1eVar;
        }
    }
}
