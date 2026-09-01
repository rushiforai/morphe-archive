package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.settings.ui.privacy.PrivacyFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class e1a implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PrivacyFragment b;
    public final /* synthetic */ my6 c;

    public /* synthetic */ e1a(PrivacyFragment privacyFragment, my6 my6Var, int i) {
        this.a = i;
        this.b = privacyFragment;
        this.c = my6Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PrivacyFragment privacyFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1873159899, new e1a(privacyFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vx0.u(((PrivacyFragment.BundleInfo) privacyFragment.u0.getValue()).getReferrerSource(), this.c, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) privacyFragment.Q()).s(), p65Var2, 0).getValue()).a, 7), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
