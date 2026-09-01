package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vh9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dr9 b;

    public /* synthetic */ vh9(dr9 dr9Var, int i) {
        this.a = i;
        this.b = dr9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        dr9 dr9Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    c09 c09VarJ = vn7.J(R.drawable.ic_more_24, 0, p65Var);
                    String strW = dr9Var.c;
                    if (strW == null) {
                        strW = km4.w(p65Var, -2055638660, R.string.common_untitled_story, p65Var, false);
                    } else {
                        p65Var.Y(-2055639311);
                        p65Var.p(false);
                    }
                    qv5.b(c09VarJ, vo7.Q(R.string.common_content_description_more_options_for_post_item, new Object[]{strW}, p65Var), null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 8, 4);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    c09 c09VarJ2 = vn7.J(R.drawable.ic_more_24, 0, p65Var2);
                    String strW2 = dr9Var.c;
                    if (strW2 == null) {
                        strW2 = km4.w(p65Var2, 1364384355, R.string.common_untitled_story, p65Var2, false);
                    } else {
                        p65Var2.Y(1364383580);
                        p65Var2.p(false);
                    }
                    qv5.b(c09VarJ2, vo7.Q(R.string.common_content_description_more_options_for_post_item, new Object[]{strW2}, p65Var2), bgf.N(jfc.l(o28.b, 24.0f), "repost_more"), ((zo7) p65Var2.j(kt7.b)).o, p65Var2, 392, 0);
                }
                break;
        }
        return c1eVar;
    }
}
