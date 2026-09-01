package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s8 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ s8(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        Object obj3 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).intValue();
                m40.t((c9) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                ((k73) obj3).Demo((x12) obj, tr7.y(i2 | 1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                ((l73) obj3).Demo((x12) obj, tr7.y(i2 | 1));
                break;
            case 3:
                fr6 fr6Var = (fr6) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    v66 v66VarP = fr6Var.b.s.p(i2);
                    ((dr6) v66VarP.c).d.k(gr6.a, Integer.valueOf(i2 - v66VarP.a), p65Var, 6);
                }
                break;
            case 4:
                yu6 yu6Var = (yu6) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    v66 v66VarP2 = yu6Var.b.r.p(i2);
                    ((vu6) v66VarP2.c).c.k(yu6Var.c, Integer.valueOf(i2 - v66VarP2.a), p65Var2, 0);
                }
                break;
            case 5:
                aw6 aw6Var = (aw6) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    v66 v66VarP3 = aw6Var.b.r.p(i2);
                    ((yv6) v66VarP3.c).d.k(bw6.a, Integer.valueOf(i2 - v66VarP3.a), p65Var3, 6);
                }
                break;
            case 6:
                wy8 wy8Var = (wy8) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    v66 v66VarP4 = wy8Var.b.X().p(i2);
                    ((ry8) v66VarP4.c).b.k(zy8.a, Integer.valueOf(i2 - v66VarP4.a), p65Var4, 0);
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                hp7.e((rn3) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                ur7.c((hia) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                ep7.i((sfb) obj3, o28.b, (x12) obj, tr7.y(i2 | 1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                hp7.r((i5c) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            case 11:
                az5 az5Var = (az5) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    aoc.a((yc9) az5Var.get(i2), null, p65Var5, 0);
                }
                break;
            case 12:
                ((Integer) obj2).getClass();
                nk7.d0((b0d) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                nk7.W((lyc) obj3, (x12) obj, tr7.y(i2 | 1));
                break;
        }
        return c1eVar;
    }
}
