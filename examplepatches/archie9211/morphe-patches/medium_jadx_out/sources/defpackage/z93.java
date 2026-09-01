package defpackage;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class z93 implements x45 {
    public final /* synthetic */ int a;
    public final ca3 b;

    public /* synthetic */ z93(ca3 ca3Var, int i) {
        this.a = i;
        this.b = ca3Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        g93 g93Var;
        int i = this.a;
        Collection<i6a> collectionO0 = ey3.a;
        ca3 ca3Var = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                n98 n98Var = (n98) obj;
                n98Var.getClass();
                LinkedHashMap linkedHashMap = ca3Var.a;
                vf6 vf6Var = a6a.z;
                vf6Var.getClass();
                da3 da3Var = ca3Var.i;
                byte[] bArr = (byte[]) linkedHashMap.get(n98Var);
                if (bArr != null) {
                    collectionO0 = szb.O0(szb.J0(new ba3(vf6Var, new ByteArrayInputStream(bArr), da3Var, i2)));
                }
                ArrayList arrayList = new ArrayList(collectionO0.size());
                for (a6a a6aVar : collectionO0) {
                    yu7 yu7Var = (yu7) da3Var.b.i;
                    a6aVar.getClass();
                    ga3 ga3VarF = yu7Var.f(a6aVar);
                    if (!da3Var.r(ga3VarF)) {
                        ga3VarF = null;
                    }
                    if (ga3VarF != null) {
                        arrayList.add(ga3VarF);
                    }
                }
                da3Var.j(n98Var, arrayList);
                return xz5.G(arrayList);
            case 1:
                n98 n98Var2 = (n98) obj;
                n98Var2.getClass();
                LinkedHashMap linkedHashMap2 = ca3Var.b;
                vf6 vf6Var2 = i6a.D;
                vf6Var2.getClass();
                da3 da3Var2 = ca3Var.i;
                byte[] bArr2 = (byte[]) linkedHashMap2.get(n98Var2);
                if (bArr2 != null) {
                    collectionO0 = szb.O0(szb.J0(new ba3(vf6Var2, new ByteArrayInputStream(bArr2), da3Var2, i2)));
                }
                ArrayList arrayList2 = new ArrayList(collectionO0.size());
                for (i6a i6aVar : collectionO0) {
                    yu7 yu7Var2 = (yu7) da3Var2.b.i;
                    i6aVar.getClass();
                    arrayList2.add(yu7Var2.g(i6aVar, false));
                }
                da3Var2.k(n98Var2, arrayList2);
                return xz5.G(arrayList2);
            default:
                n98 n98Var3 = (n98) obj;
                n98Var3.getClass();
                sj0 sj0Var = ca3Var.i.b;
                byte[] bArr3 = (byte[]) ca3Var.c.get(n98Var3);
                if (bArr3 == null) {
                    return null;
                }
                u6a u6aVar = (u6a) u6a.q.b(new ByteArrayInputStream(bArr3), ((i93) sj0Var.a).p);
                if (u6aVar == null) {
                    return null;
                }
                yu7 yu7Var3 = (yu7) sj0Var.i;
                sj0 sj0Var2 = yu7Var3.a;
                p98 p98Var = (p98) sj0Var2.b;
                wjc wjcVar = (wjc) sj0Var2.d;
                List<h5a> list = u6aVar.k;
                list.getClass();
                ArrayList arrayList3 = new ArrayList(cu1.k0(list, 10));
                for (h5a h5aVar : list) {
                    lig ligVar = yu7Var3.b;
                    h5aVar.getClass();
                    arrayList3.add(ligVar.s(h5aVar, p98Var));
                }
                ly nyVar = arrayList3.isEmpty() ? cd7.e : new ny(0, arrayList3);
                g7a g7aVar = (g7a) cm4.d.d(u6aVar.d);
                switch (g7aVar == null ? -1 : o7a.b[g7aVar.ordinal()]) {
                    case 1:
                        g93Var = h93.d;
                        g93Var.getClass();
                        break;
                    case 2:
                        g93Var = h93.a;
                        g93Var.getClass();
                        break;
                    case 3:
                        g93Var = h93.b;
                        g93Var.getClass();
                        break;
                    case 4:
                        g93Var = h93.c;
                        g93Var.getClass();
                        break;
                    case 5:
                        g93Var = h93.e;
                        g93Var.getClass();
                        break;
                    case 6:
                        g93Var = h93.f;
                        g93Var.getClass();
                        break;
                    default:
                        g93Var = h93.a;
                        g93Var.getClass();
                        break;
                }
                ha3 ha3Var = new ha3(((i93) sj0Var2.a).a, (yv2) sj0Var2.c, nyVar, vn7.C(p98Var, u6aVar.e), g93Var, u6aVar, (p98) sj0Var2.b, wjcVar, (kse) sj0Var2.e, (u93) sj0Var2.g);
                List list2 = u6aVar.f;
                list2.getClass();
                jz1 jz1Var = (jz1) sj0Var2.a(ha3Var, list2, (p98) sj0Var2.b, (wjc) sj0Var2.d, (kse) sj0Var2.e, (mr0) sj0Var2.f).h;
                ha3Var.B0(jz1Var.u(), jz1Var.D(vn7.g0(u6aVar, wjcVar), false), jz1Var.D(vn7.v(u6aVar, wjcVar), false));
                return ha3Var;
        }
    }
}
