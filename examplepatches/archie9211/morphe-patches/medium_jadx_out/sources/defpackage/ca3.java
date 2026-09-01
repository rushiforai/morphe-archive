package defpackage;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ca3 {
    public static final /* synthetic */ fj6[] j;
    public final LinkedHashMap a;
    public final LinkedHashMap b;
    public final LinkedHashMap c;
    public final r67 d;
    public final r67 e;
    public final v67 f;
    public final u67 g;
    public final u67 h;
    public final /* synthetic */ da3 i;

    static {
        u4a u4aVar = new u4a(ca3.class, "functionNames", "getFunctionNames()Ljava/util/Set;", 0);
        s1b s1bVar = n1b.a;
        j = new fj6[]{s1bVar.g(u4aVar), km4.t(ca3.class, "variableNames", "getVariableNames()Ljava/util/Set;", 0, s1bVar)};
    }

    public ca3(da3 da3Var, List list, List list2, List list3) {
        list.getClass();
        list2.getClass();
        list3.getClass();
        this.i = da3Var;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Object obj : list) {
            n98 n98VarC = vn7.C((p98) da3Var.b.b, ((a6a) ((q1) obj)).f);
            Object arrayList = linkedHashMap.get(n98VarC);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(n98VarC, arrayList);
            }
            ((List) arrayList).add(obj);
        }
        this.a = a(linkedHashMap);
        da3 da3Var2 = this.i;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Object obj2 : list2) {
            n98 n98VarC2 = vn7.C((p98) da3Var2.b.b, ((i6a) ((q1) obj2)).f);
            Object arrayList2 = linkedHashMap2.get(n98VarC2);
            if (arrayList2 == null) {
                arrayList2 = new ArrayList();
                linkedHashMap2.put(n98VarC2, arrayList2);
            }
            ((List) arrayList2).add(obj2);
        }
        this.b = a(linkedHashMap2);
        ((i93) this.i.b.a).c.getClass();
        da3 da3Var3 = this.i;
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        for (Object obj3 : list3) {
            n98 n98VarC3 = vn7.C((p98) da3Var3.b.b, ((u6a) ((q1) obj3)).e);
            Object arrayList3 = linkedHashMap3.get(n98VarC3);
            if (arrayList3 == null) {
                arrayList3 = new ArrayList();
                linkedHashMap3.put(n98VarC3, arrayList3);
            }
            ((List) arrayList3).add(obj3);
        }
        this.c = a(linkedHashMap3);
        int i = 0;
        this.d = ((i93) this.i.b.a).a.b(new z93(this, i));
        int i2 = 1;
        this.e = ((i93) this.i.b.a).a.b(new z93(this, i2));
        this.f = ((i93) this.i.b.a).a.c(new z93(this, 2));
        da3 da3Var4 = this.i;
        x67 x67Var = ((i93) da3Var4.b.a).a;
        aa3 aa3Var = new aa3(this, da3Var4, i);
        x67Var.getClass();
        this.g = new u67(x67Var, aa3Var);
        da3 da3Var5 = this.i;
        x67 x67Var2 = ((i93) da3Var5.b.a).a;
        aa3 aa3Var2 = new aa3(this, da3Var5, i2);
        x67Var2.getClass();
        this.h = new u67(x67Var2, aa3Var2);
    }

    public static LinkedHashMap a(LinkedHashMap linkedHashMap) throws IOException {
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            Object key = entry.getKey();
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            Iterable<q1> iterable = (Iterable) entry.getValue();
            ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
            for (q1 q1Var : iterable) {
                int iA = q1Var.a();
                int iH = h30.h(iA) + iA;
                if (iH > 4096) {
                    iH = 4096;
                }
                h30 h30VarT = h30.t(byteArrayOutputStream, iH);
                h30VarT.L(iA);
                q1Var.d(h30VarT);
                h30VarT.y();
                arrayList.add(c1e.a);
            }
            linkedHashMap2.put(key, byteArrayOutputStream.toByteArray());
        }
        return linkedHashMap2;
    }
}
