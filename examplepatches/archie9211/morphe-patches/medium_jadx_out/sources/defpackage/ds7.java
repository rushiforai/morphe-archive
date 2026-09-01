package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ds7 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ List b;
    public final /* synthetic */ List c;
    public final /* synthetic */ x45 d;
    public final /* synthetic */ int e;

    public /* synthetic */ ds7(List list, List list2, x45 x45Var, int i, int i2) {
        this.a = i2;
        this.b = list;
        this.c = list2;
        this.d = x45Var;
        this.e = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                ns7.d(this.b, this.c, this.d, this.e, (x12) obj, tr7.y(1));
                break;
            case 1:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    ns7.d(this.b, this.c, this.d, this.e, p65Var, 0);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                qs7.d(this.b, this.c, this.d, this.e, (x12) obj, tr7.y(1));
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    qs7.d(this.b, this.c, this.d, this.e, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ds7(List list, List list2, x45 x45Var, int i, int i2, int i3) {
        this.a = i3;
        this.b = list;
        this.c = list2;
        this.d = x45Var;
        this.e = i;
    }
}
