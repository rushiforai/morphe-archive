package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.tag.recommendedposts.TagRecommendedPostsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class n9d implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ TagRecommendedPostsFragment b;

    public /* synthetic */ n9d(TagRecommendedPostsFragment tagRecommendedPostsFragment, int i) {
        this.a = i;
        this.b = tagRecommendedPostsFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        TagRecommendedPostsFragment tagRecommendedPostsFragment = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                vq6 vq6Var = tagRecommendedPostsFragment.u0;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    vpc vpcVarS = ((MainActivity) tagRecommendedPostsFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    flb.R(((TagRecommendedPostsFragment.BundleInfo) vq6Var.getValue()).getTagSlug(), ((TagRecommendedPostsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new o9d(tagRecommendedPostsFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var, 0).getValue()).a, 7).b(jfc.c), null, p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(-591603518, new n9d(tagRecommendedPostsFragment, i2), p65Var2), p65Var2, 48, 1);
                }
                break;
        }
        return c1eVar;
    }
}
