package defpackage;

import com.medium.android.susi.ui.magicLinkConfirmation.MagicLinkConfirmationFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gd7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ MagicLinkConfirmationFragment b;

    public /* synthetic */ gd7(MagicLinkConfirmationFragment magicLinkConfirmationFragment, int i) {
        this.a = i;
        this.b = magicLinkConfirmationFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        MagicLinkConfirmationFragment magicLinkConfirmationFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-201125284, new gd7(magicLinkConfirmationFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = magicLinkConfirmationFragment.w0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    g01.t(((MagicLinkConfirmationFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((MagicLinkConfirmationFragment.BundleInfo) vq6Var.getValue()).getToken(), ((MagicLinkConfirmationFragment.BundleInfo) vq6Var.getValue()).getSusiDestination(), ((MagicLinkConfirmationFragment.BundleInfo) vq6Var.getValue()).getSusiOperation(), new hd7(magicLinkConfirmationFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
