package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.home.ui.home.HomeFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class cq5 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ HomeFragment b;
    public final /* synthetic */ dq5 c;

    public /* synthetic */ cq5(HomeFragment homeFragment, dq5 dq5Var, int i) {
        this.a = i;
        this.b = homeFragment;
        this.c = dq5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        HomeFragment homeFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(738799668, new cq5(homeFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    op8.s(((HomeFragment.BundleInfo) homeFragment.u0.getValue()).getReferrerSource(), homeFragment.x0, this.c, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) homeFragment.Q()).s(), p65Var2, 0).getValue()).a, 7), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
