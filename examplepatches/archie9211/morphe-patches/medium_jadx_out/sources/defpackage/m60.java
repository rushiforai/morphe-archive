package defpackage;

import com.medium.android.susi.ui.apple.AppleAuthFragment;
import com.medium.android.susi.ui.apple.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class m60 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AppleAuthFragment b;

    public /* synthetic */ m60(AppleAuthFragment appleAuthFragment, int i) {
        this.a = i;
        this.b = appleAuthFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        AppleAuthFragment appleAuthFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1642204402, new m60(appleAuthFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    f76.a(new a(appleAuthFragment), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
