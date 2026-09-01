package defpackage;

import com.medium.android.onboarding.ui.topics.TopicsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gpd implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ TopicsFragment b;
    public final /* synthetic */ qlb c;

    public /* synthetic */ gpd(TopicsFragment topicsFragment, qlb qlbVar, int i) {
        this.a = i;
        this.b = topicsFragment;
        this.c = qlbVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        TopicsFragment topicsFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(1470625033, new gpd(topicsFragment, this.c, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    bo.w(((TopicsFragment.BundleInfo) topicsFragment.v0.getValue()).getReferrerSource(), this.c, null, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
