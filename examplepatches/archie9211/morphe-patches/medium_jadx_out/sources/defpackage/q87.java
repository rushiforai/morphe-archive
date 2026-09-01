package defpackage;

import com.medium.android.susi.ui.loginCode.LoginCodeBottomSheetDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class q87 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ LoginCodeBottomSheetDialogFragment b;

    public /* synthetic */ q87(LoginCodeBottomSheetDialogFragment loginCodeBottomSheetDialogFragment, int i) {
        this.a = i;
        this.b = loginCodeBottomSheetDialogFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        LoginCodeBottomSheetDialogFragment loginCodeBottomSheetDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1106380092, new q87(loginCodeBottomSheetDialogFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    rx0.w(loginCodeBottomSheetDialogFragment.g0().getReferrerSource(), loginCodeBottomSheetDialogFragment.g0().getSusiOperation(), loginCodeBottomSheetDialogFragment.g0().getSusiDestination(), loginCodeBottomSheetDialogFragment.g0().getEmail(), loginCodeBottomSheetDialogFragment.g0().getFullName(), loginCodeBottomSheetDialogFragment.g0().getRememberMe(), loginCodeBottomSheetDialogFragment.g0().getFromAccountHint(), new r87(loginCodeBottomSheetDialogFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
