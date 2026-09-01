package defpackage;

import com.medium.android.admin.payments.PaymentsDebuggerFragment;
import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class u69 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PaymentsDebuggerFragment b;
    public final /* synthetic */ v69 c;

    public /* synthetic */ u69(PaymentsDebuggerFragment paymentsDebuggerFragment, v69 v69Var, int i) {
        this.a = i;
        this.b = paymentsDebuggerFragment;
        this.c = v69Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PaymentsDebuggerFragment paymentsDebuggerFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1168839148, new u69(paymentsDebuggerFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vpc vpcVarS = ((MainActivity) paymentsDebuggerFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    x69.b(this.c, ((PaymentsDebuggerFragment.BundleInfo) paymentsDebuggerFragment.u0.getValue()).getReferrerSource(), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var2, 0).getValue()).a, 7), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
