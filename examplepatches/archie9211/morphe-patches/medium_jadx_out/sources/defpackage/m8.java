package defpackage;

import androidx.compose.ui.platform.ComposeView;
import com.medium.android.susi.ui.addInfo.AddInfoFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class m8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AddInfoFragment b;
    public final /* synthetic */ ComposeView c;

    public /* synthetic */ m8(AddInfoFragment addInfoFragment, ComposeView composeView, int i) {
        this.a = i;
        this.b = addInfoFragment;
        this.c = composeView;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ComposeView composeView = this.c;
        AddInfoFragment addInfoFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1018825673, new m8(addInfoFragment, composeView, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = addInfoFragment.v0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    m40.c(((AddInfoFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AddInfoFragment.BundleInfo) vq6Var.getValue()).getCreateAccountData(), ((AddInfoFragment.BundleInfo) vq6Var.getValue()).getSusiDestination(), new s26(composeView, 3, addInfoFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
