package defpackage;

import com.medium.android.postpublishing.ui.PublicationFlowFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class lda implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PublicationFlowFragment b;

    public /* synthetic */ lda(PublicationFlowFragment publicationFlowFragment, int i) {
        this.a = i;
        this.b = publicationFlowFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PublicationFlowFragment publicationFlowFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kt7.a(false, pxf.E(491500178, new lda(publicationFlowFragment, i2), p65Var), p65Var, 48);
                }
                break;
            default:
                vq6 vq6Var = publicationFlowFragment.v0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    qq7.c(((PublicationFlowFragment.BundleInfo) vq6Var.getValue()).getPostId(), ((PublicationFlowFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new mda(publicationFlowFragment), ((PublicationFlowFragment.BundleInfo) vq6Var.getValue()).getDestination(), null, null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
