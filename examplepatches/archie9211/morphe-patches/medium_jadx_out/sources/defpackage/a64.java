package defpackage;

import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.explore.ui.ExploreFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class a64 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ExploreFragment b;

    public /* synthetic */ a64(ExploreFragment exploreFragment, int i) {
        this.a = i;
        this.b = exploreFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ExploreFragment exploreFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(725723077, new a64(exploreFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    hlg.f(((AbstractMediumFragment.BundleInfo) exploreFragment.u0.getValue()).getReferrerSource(), exploreFragment.v0, new b64(exploreFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) exploreFragment.Q()).s(), p65Var2, 0).getValue()).a, 7), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
