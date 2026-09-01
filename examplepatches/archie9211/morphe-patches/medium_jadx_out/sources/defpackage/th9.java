package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class th9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ upc b;

    public /* synthetic */ th9(upc upcVar, int i) {
        this.a = i;
        this.b = upcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        upc upcVar = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    qv5.b(vn7.J(((Boolean) upcVar.getValue()).booleanValue() ? R.drawable.ic_thumbs_down_filled_24 : R.drawable.ic_thumbs_down_24, 0, p65Var), vo7.R(p65Var, ((Boolean) upcVar.getValue()).booleanValue() ? R.string.common_undo_show_less_like_this : R.string.common_show_less_like_this), null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 8, 4);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    qv5.b(vn7.J(((Boolean) upcVar.getValue()).booleanValue() ? R.drawable.ic_bookmark_24 : R.drawable.ic_bookmark_add_24, 0, p65Var2), null, null, 0L, p65Var2, 56, 12);
                }
                break;
            default:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    vv2.c(((Number) upcVar.getValue()).intValue() > 1, null, sz3.c(null, 3), sz3.d(null, 3), null, kng.c, p65Var3, 200064, 18);
                }
                break;
        }
        return c1eVar;
    }
}
