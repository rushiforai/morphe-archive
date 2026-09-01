package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zi9 implements d55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ zi9(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                xr6 xr6Var = (xr6) obj;
                int iIntValue = ((Number) obj2).intValue();
                x12 x12Var = (x12) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                int i2 = (iIntValue2 & 6) == 0 ? (((p65) x12Var).f(xr6Var) ? 4 : 2) | iIntValue2 : iIntValue2;
                if ((iIntValue2 & 48) == 0) {
                    i2 |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
                    que queVar = (que) ((List) obj5).get(iIntValue);
                    p65Var.Y(1590594717);
                    jj9.b(queVar, p65Var, 0);
                    p65Var.p(false);
                } else {
                    p65Var.S();
                }
                break;
            default:
                ((Number) obj2).intValue();
                x12 x12Var2 = (x12) obj3;
                int iIntValue3 = ((Number) obj4).intValue();
                wmc wmcVar = (wmc) obj5;
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue3 & 1, (iIntValue3 & 129) != 128)) {
                    umc umcVar = (umc) wmcVar;
                    List list = umcVar.b;
                    ArrayList arrayList = new ArrayList();
                    for (Object obj6 : list) {
                        if (((tmc) obj6).a) {
                            arrayList.add(obj6);
                        }
                    }
                    jjd.b(ev6.s(arrayList.size(), umcVar.b.size(), "Services (", "/", ")"), w2g.D(jfc.d(flb.a0(o28.b, ((zo7) p65Var2.j(kt7.b)).a, rv8.r), 1.0f), 24.0f, 6.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).j, p65Var2, 0, 0, 131068);
                } else {
                    p65Var2.S();
                }
                break;
        }
        return c1eVar;
    }
}
