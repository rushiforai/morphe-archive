package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.notifications.NotificationsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class zj8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ NotificationsFragment b;
    public final /* synthetic */ ak8 c;

    public /* synthetic */ zj8(NotificationsFragment notificationsFragment, ak8 ak8Var, int i) {
        this.a = i;
        this.b = notificationsFragment;
        this.c = ak8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        NotificationsFragment notificationsFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-435266700, new zj8(notificationsFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = notificationsFragment.u0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    l78 l78VarZ = guc.z(((MainActivity) notificationsFragment.Q()).s(), p65Var2, 0);
                    xk8.d(((NotificationsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), this.c, w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) l78VarZ.getValue()).a, 7), ((NotificationsFragment.BundleInfo) vq6Var.getValue()).getFilterType(), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
