package defpackage;

import com.medium.android.postpage.featuredinpublication.FeaturedInPublicationFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class kb4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ FeaturedInPublicationFragment b;

    public /* synthetic */ kb4(FeaturedInPublicationFragment featuredInPublicationFragment, int i) {
        this.a = i;
        this.b = featuredInPublicationFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        FeaturedInPublicationFragment featuredInPublicationFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1249462448, new kb4(featuredInPublicationFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                vq6 vq6Var = featuredInPublicationFragment.I0;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    k50.A(((FeaturedInPublicationFragment.BundleInfo) vq6Var.getValue()).getPostId(), ((FeaturedInPublicationFragment.BundleInfo) vq6Var.getValue()).getPublicationId(), ((FeaturedInPublicationFragment.BundleInfo) vq6Var.getValue()).getPublicationName(), ((FeaturedInPublicationFragment.BundleInfo) vq6Var.getValue()).getPublicationImageId(), ((FeaturedInPublicationFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new lb4(featuredInPublicationFragment), null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
