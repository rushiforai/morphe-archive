package defpackage;

import androidx.compose.ui.platform.ComposeView;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.tag.tagpage.TagFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class t8d implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ TagFragment b;
    public final /* synthetic */ ComposeView c;

    public /* synthetic */ t8d(TagFragment tagFragment, ComposeView composeView, int i) {
        this.a = i;
        this.b = tagFragment;
        this.c = composeView;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ComposeView composeView = this.c;
        TagFragment tagFragment = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                vq6 vq6Var = tagFragment.u0;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    vpc vpcVarS = ((MainActivity) tagFragment.Q()).s();
                    hl0 hl0Var = as7.a;
                    l78 l78VarK = lv8.k(56.0f, vpcVarS, p65Var, 0);
                    String tagSlug = ((TagFragment.BundleInfo) vq6Var.getValue()).getTagSlug();
                    String referrerSource = ((TagFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                    u8d u8dVar = new u8d(tagFragment, composeView);
                    Object objM = p65Var.M();
                    if (objM == w12.a) {
                        objM = new d3d(8);
                        p65Var.j0(objM);
                    }
                    guc.l(tagSlug, referrerSource, u8dVar, w2g.G(new l60((x45) objM, false), 0.0f, 0.0f, 0.0f, ((vj3) l78VarK.getValue()).a, 7).b(jfc.c), null, p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(-723510147, new t8d(tagFragment, composeView, i2), p65Var2), p65Var2, 48, 1);
                }
                break;
        }
        return c1eVar;
    }
}
