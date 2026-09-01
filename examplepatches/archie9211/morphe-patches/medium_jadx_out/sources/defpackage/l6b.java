package defpackage;

import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class l6b implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ReportResponseDialogFragment b;
    public final /* synthetic */ m6b c;

    public /* synthetic */ l6b(ReportResponseDialogFragment reportResponseDialogFragment, m6b m6bVar, int i) {
        this.a = i;
        this.b = reportResponseDialogFragment;
        this.c = m6bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m6b m6bVar = this.c;
        ReportResponseDialogFragment reportResponseDialogFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(77463457, new l6b(reportResponseDialogFragment, m6bVar, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    rr7.l(reportResponseDialogFragment.g0().j, reportResponseDialogFragment.g0().l, m6bVar, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
