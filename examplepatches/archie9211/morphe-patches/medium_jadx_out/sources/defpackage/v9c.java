package defpackage;

import com.medium.android.susi.ui.signIn.SignInFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class v9c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SignInFragment b;

    public /* synthetic */ v9c(SignInFragment signInFragment, int i) {
        this.a = i;
        this.b = signInFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        SignInFragment signInFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(2016705330, new v9c(signInFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = signInFragment.v0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    t40.q(((SignInFragment.BundleInfo) vq6Var.getValue()).getEmail(), ((SignInFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((SignInFragment.BundleInfo) vq6Var.getValue()).getSusiDestination(), ((SignInFragment.BundleInfo) vq6Var.getValue()).getRememberMe(), new qlb(signInFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
