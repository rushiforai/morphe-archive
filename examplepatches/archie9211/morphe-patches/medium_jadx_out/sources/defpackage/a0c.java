package defpackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a0c implements xzb, p31 {
    public final String a;
    public final mo7 b;
    public final int c;
    public final HashSet d;
    public final String[] e;
    public final xzb[] f;
    public final List[] g;
    public final Map h;
    public final xzb[] i;
    public final w5d j;

    public a0c(String str, mo7 mo7Var, int i, List list, vn1 vn1Var) {
        this.a = str;
        this.b = mo7Var;
        this.c = i;
        ArrayList arrayList = vn1Var.b;
        HashSet hashSet = new HashSet(ei7.P(cu1.k0(arrayList, 12)));
        bu1.j1(arrayList, hashSet);
        this.d = hashSet;
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        this.e = strArr;
        this.f = m40.G(vn1Var.d);
        this.g = (List[]) vn1Var.e.toArray(new List[0]);
        bu1.i1(vn1Var.f);
        strArr.getClass();
        i80 i80Var = new i80(1, new l8(10, strArr));
        ArrayList arrayList2 = new ArrayList(cu1.k0(i80Var, 10));
        Iterator it2 = i80Var.iterator();
        while (true) {
            zm3 zm3Var = (zm3) it2;
            if (!zm3Var.b.hasNext()) {
                this.h = ei7.V(arrayList2);
                this.i = m40.G(list);
                this.j = new w5d(new i5b(19, this));
                return;
            }
            r06 r06Var = (r06) zm3Var.next();
            arrayList2.add(new f09(r06Var.b, Integer.valueOf(r06Var.a)));
        }
    }

    @Override // defpackage.xzb
    public final String a() {
        return this.a;
    }

    @Override // defpackage.p31
    public final Set b() {
        return this.d;
    }

    @Override // defpackage.xzb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.xzb
    public final int d(String str) {
        str.getClass();
        Integer num = (Integer) this.h.get(str);
        if (num != null) {
            return num.intValue();
        }
        return -3;
    }

    @Override // defpackage.xzb
    public final int e() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a0c) {
            xzb xzbVar = (xzb) obj;
            if (this.a.equals(xzbVar.a()) && Arrays.equals(this.i, ((a0c) obj).i)) {
                int iE = xzbVar.e();
                int i = this.c;
                if (i == iE) {
                    for (int i2 = 0; i2 < i; i2++) {
                        xzb[] xzbVarArr = this.f;
                        if (g76.L(xzbVarArr[i2].a(), xzbVar.h(i2).a()) && g76.L(xzbVarArr[i2].j(), xzbVar.h(i2).j())) {
                        }
                    }
                    return true;
                }
            }
        }
        return false;
    }

    @Override // defpackage.xzb
    public final String f(int i) {
        return this.e[i];
    }

    @Override // defpackage.xzb
    public final List g(int i) {
        return this.g[i];
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return ey3.a;
    }

    @Override // defpackage.xzb
    public final xzb h(int i) {
        return this.f[i];
    }

    public final int hashCode() {
        return ((Number) this.j.getValue()).intValue();
    }

    @Override // defpackage.xzb
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.xzb
    public final mo7 j() {
        return this.b;
    }

    public final String toString() {
        return bu1.F0(iq7.W(0, this.c), ", ", this.a.concat("("), ")", new zzb(0, this), 24);
    }
}
