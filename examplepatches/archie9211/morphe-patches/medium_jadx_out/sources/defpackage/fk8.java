package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.notifications.NotificationsRollupFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class fk8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ NotificationsRollupFragment b;
    public final /* synthetic */ gk8 c;

    public /* synthetic */ fk8(NotificationsRollupFragment notificationsRollupFragment, gk8 gk8Var, int i) {
        this.a = i;
        this.b = notificationsRollupFragment;
        this.c = gk8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        NotificationsRollupFragment notificationsRollupFragment = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                vq6 vq6Var = notificationsRollupFragment.u0;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    gsa.x(((NotificationsRollupFragment.BundleInfo) vq6Var.getValue()).getNotificationId(), ((NotificationsRollupFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), this.c, w2g.G(jfc.c, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) notificationsRollupFragment.Q()).s(), p65Var, 0).getValue()).a, 7), null, p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(1742719300, new fk8(notificationsRollupFragment, this.c, i2), p65Var2), p65Var2, 48, 1);
                }
                break;
        }
        return c1eVar;
    }
}
