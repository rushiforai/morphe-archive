package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gd implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ b55 b;

    public /* synthetic */ gd(int i, b55 b55Var) {
        this.a = i;
        this.b = b55Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 2;
        b55 b55Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    sn3 sn3Var = w72.a;
                    long j = ((uu1) p65Var.j(d82.a)).a;
                    k40.c(sn3Var.a(Float.valueOf((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j)) < 0.5d : ((double) op8.f0(j)) > 0.5d) ? 0.87f : 1.0f)), pxf.E(-1654653485, new gd(3, b55Var), p65Var), p65Var, 56);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    sn3 sn3Var2 = w72.a;
                    long j2 = ((uu1) p65Var2.j(d82.a)).a;
                    k40.c(sn3Var2.a(Float.valueOf((!((sv1) p65Var2.j(tv1.a)).f() ? ((double) op8.f0(j2)) < 0.5d : ((double) op8.f0(j2)) > 0.5d) ? 0.6f : 0.74f)), pxf.E(-2126650894, new gd(i2, b55Var), p65Var2), p65Var2, 56);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    kjd.a(((myd) p65Var3.j(qyd.b)).j, b55Var, p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    kjd.a(((myd) p65Var4.j(qyd.b)).g, b55Var, p65Var4, 0);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            default:
                lpb lpbVar = (lpb) obj;
                List list = (List) b55Var.invoke(lpbVar, obj2);
                int size = list.size();
                for (int i3 = 0; i3 < size; i3++) {
                    Object obj3 = list.get(i3);
                    if (obj3 != null && !lpbVar.a(obj3)) {
                        throw new IllegalArgumentException(("item at index " + i3 + " can't be saved: " + obj3).toString());
                    }
                }
                if (list.isEmpty()) {
                    return null;
                }
                return new ArrayList(list);
        }
    }
}
