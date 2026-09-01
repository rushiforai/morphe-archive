package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class hh implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AllSuggestedTagsFragment b;

    public /* synthetic */ hh(AllSuggestedTagsFragment allSuggestedTagsFragment, int i) {
        this.a = i;
        this.b = allSuggestedTagsFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        AllSuggestedTagsFragment allSuggestedTagsFragment = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1315614538, new hh(allSuggestedTagsFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    vpc vpcVarS = ((MainActivity) allSuggestedTagsFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    pwd.b(((AllSuggestedTagsFragment.BundleInfo) allSuggestedTagsFragment.u0.getValue()).getReferrerSource(), new olb(3, allSuggestedTagsFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var2, 0).getValue()).a, 7), null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
