package defpackage;

import com.medium.android.reportpost.ui.ReportPostDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class j5b implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ReportPostDialogFragment b;
    public final /* synthetic */ k5b c;

    public /* synthetic */ j5b(ReportPostDialogFragment reportPostDialogFragment, k5b k5bVar, int i) {
        this.a = i;
        this.b = reportPostDialogFragment;
        this.c = k5bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        k5b k5bVar = this.c;
        ReportPostDialogFragment reportPostDialogFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-853164960, new j5b(reportPostDialogFragment, k5bVar, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    mq7.n(reportPostDialogFragment.g0().h, reportPostDialogFragment.g0().j, k5bVar, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
