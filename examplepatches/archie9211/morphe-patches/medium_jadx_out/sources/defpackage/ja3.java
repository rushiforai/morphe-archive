package defpackage;

import com.medium.android.admin.designsystem.DesignSystem3Fragment;
import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ja3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ DesignSystem3Fragment b;

    public /* synthetic */ ja3(DesignSystem3Fragment designSystem3Fragment, int i) {
        this.a = i;
        this.b = designSystem3Fragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        DesignSystem3Fragment designSystem3Fragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-760448318, new ja3(designSystem3Fragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vpc vpcVarS = ((MainActivity) designSystem3Fragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    r28 r28VarG = w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var2, 0).getValue()).a, 7);
                    boolean zH = p65Var2.h(designSystem3Fragment);
                    Object objM = p65Var2.M();
                    if (zH || objM == w12.a) {
                        objM = new nh2(9, designSystem3Fragment);
                        p65Var2.j0(objM);
                    }
                    ep7.d(0, p65Var2, (m45) objM, r28VarG);
                }
                break;
        }
        return c1eVar;
    }
}
