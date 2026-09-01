package defpackage;

import com.medium.android.admin.admininternalstatus.AdminInternalStatusFragment;
import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class kb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AdminInternalStatusFragment b;

    public /* synthetic */ kb(AdminInternalStatusFragment adminInternalStatusFragment, int i) {
        this.a = i;
        this.b = adminInternalStatusFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        AdminInternalStatusFragment adminInternalStatusFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(233034879, new kb(adminInternalStatusFragment, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    vpc vpcVarS = ((MainActivity) adminInternalStatusFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    l78 l78VarK = lv8.k(56.0f, vpcVarS, p65Var2, 0);
                    i03 i03Var = adminInternalStatusFragment.u0;
                    if (i03Var == null) {
                        g76.g0("mediumUris");
                        throw null;
                    }
                    boolean zH = p65Var2.h(adminInternalStatusFragment);
                    Object objM = p65Var2.M();
                    if (zH || objM == w12.a) {
                        objM = new jb(adminInternalStatusFragment, 1);
                        p65Var2.j0(objM);
                    }
                    t40.b(i03Var, (m45) objM, ((AdminInternalStatusFragment.BundleInfo) adminInternalStatusFragment.v0.getValue()).getReferrerSource(), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) l78VarK.getValue()).a, 7), null, p65Var2, 0);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
