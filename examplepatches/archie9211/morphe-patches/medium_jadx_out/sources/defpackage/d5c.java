package defpackage;

import com.medium.android.postpage.share.SharePostDialogFragment;
import com.medium.android.postpage.share.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class d5c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SharePostDialogFragment b;

    public /* synthetic */ d5c(SharePostDialogFragment sharePostDialogFragment, int i) {
        this.a = i;
        this.b = sharePostDialogFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        SharePostDialogFragment sharePostDialogFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(893637078, new d5c(sharePostDialogFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    kp7.g(sharePostDialogFragment.f0().getPostShareData(), sharePostDialogFragment.f0().getReferrerSource(), sharePostDialogFragment.f0().getSource(), sharePostDialogFragment.f0().getLocation(), new a(sharePostDialogFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
