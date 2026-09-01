package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cea implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ upc b;

    public /* synthetic */ cea(upc upcVar, int i) {
        this.a = i;
        this.b = upcVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        upc upcVar = this.b;
        switch (i) {
            case 0:
                b55 b55Var = (b55) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Number) obj3).intValue();
                b55Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).h(b55Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    if (((String) upcVar.getValue()) == null) {
                        p65Var.Y(-719930962);
                        kjd.b(vo7.R(p65Var, R.string.your_story_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(((eu7) p65Var.j(kt7.c)).e, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var, 0, 0, 65534);
                    } else {
                        p65Var.Y(-725926951);
                    }
                    p65Var.p(false);
                    b55Var.invoke(p65Var, Integer.valueOf(iIntValue & 14));
                }
                break;
            default:
                b55 b55Var2 = (b55) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                b55Var2.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).h(b55Var2) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    if (((String) upcVar.getValue()) == null) {
                        p65Var2.Y(70185602);
                        kjd.b(vo7.R(p65Var2, R.string.your_story_subtitle), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(((eu7) p65Var2.j(kt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var2, 0, 0, 65534);
                    } else {
                        p65Var2.Y(61401008);
                    }
                    p65Var2.p(false);
                    b55Var2.invoke(p65Var2, Integer.valueOf(iIntValue2 & 14));
                }
                break;
        }
        return c1eVar;
    }
}
