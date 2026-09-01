package defpackage;

import com.medium.android.admin.designsystem.DesignSystemFragment;
import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ka3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ DesignSystemFragment b;

    public /* synthetic */ ka3(DesignSystemFragment designSystemFragment, int i) {
        this.a = i;
        this.b = designSystemFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        DesignSystemFragment designSystemFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kt7.a(false, pxf.E(-1372390437, new ka3(designSystemFragment, i2), p65Var), p65Var, 48);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vpc vpcVarS = ((MainActivity) designSystemFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    r28 r28VarG = w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var2, 0).getValue()).a, 7);
                    boolean zH = p65Var2.h(designSystemFragment);
                    Object objM = p65Var2.M();
                    if (zH || objM == w12.a) {
                        objM = new nh2(10, designSystemFragment);
                        p65Var2.j0(objM);
                    }
                    fp7.a(0, p65Var2, (m45) objM, r28VarG);
                }
                break;
        }
        return c1eVar;
    }
}
