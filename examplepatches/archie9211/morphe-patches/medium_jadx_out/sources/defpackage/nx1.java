package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nx1 extends sx1 {
    public final String a;
    public final o7f b;
    public final String c;
    public final List d;
    public final List e;
    public final List f;

    public nx1(String str, o7f o7fVar, String str2, List list, List list2, List list3) {
        list.getClass();
        list2.getClass();
        list3.getClass();
        this.a = str;
        this.b = o7fVar;
        this.c = str2;
        this.d = list;
        this.e = list2;
        this.f = list3;
    }

    public final Map a(l44 l44Var, x45 x45Var) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : this.e) {
            if (((Boolean) x45Var.invoke(obj)).booleanValue()) {
                arrayList.add(obj);
            }
        }
        ArrayList<lx1> arrayList2 = new ArrayList();
        for (Object obj2 : arrayList) {
            yv8 yv8Var = ((lx1) obj2).b;
            arrayList2.add(obj2);
        }
        if (arrayList2.isEmpty()) {
            return fy3.a;
        }
        int iP = ei7.P(cu1.k0(arrayList2, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (lx1 lx1Var : arrayList2) {
            linkedHashMap.put(lx1Var.a.a, lx1Var.b.a);
        }
        Object objF0 = kyd.f0(linkedHashMap, l44Var);
        objF0.getClass();
        return (Map) objF0;
    }

    public final String b() {
        String str = this.c;
        return str == null ? this.a : str;
    }

    public final String c(l44 l44Var) {
        Map mapA = a(l44Var, new ql1(3));
        boolean zIsEmpty = mapA.isEmpty();
        String str = this.a;
        if (zIsEmpty) {
            return str;
        }
        try {
            kz0 kz0Var = new kz0();
            yz0 yz0Var = new yz0(kz0Var);
            f76.R(yz0Var, mapA);
            yz0Var.close();
            return str + '(' + kz0Var.G0() + ')';
        } catch (Exception e) {
            ik4.j(e);
            return null;
        }
    }
}
