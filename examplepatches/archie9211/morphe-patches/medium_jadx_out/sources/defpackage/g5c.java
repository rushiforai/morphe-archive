package defpackage;

import com.medium.android.postpage.sharepostfriendlink.SharePostFriendLinkDialogFragment;
import com.medium.android.postpage.sharepostfriendlink.a;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class g5c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ SharePostFriendLinkDialogFragment b;
    public final /* synthetic */ a c;

    public /* synthetic */ g5c(SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment, a aVar, int i) {
        this.a = i;
        this.b = sharePostFriendLinkDialogFragment;
        this.c = aVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        a aVar = this.c;
        SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1472407054, new g5c(sharePostFriendLinkDialogFragment, aVar, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                iq1 iq1Var = sharePostFriendLinkDialogFragment.L0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    hp7.p(((v5c) iq1Var.getValue()).m, ((v5c) iq1Var.getValue()).o, aVar, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
