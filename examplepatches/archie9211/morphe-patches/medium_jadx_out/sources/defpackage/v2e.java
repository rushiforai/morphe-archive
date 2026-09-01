package defpackage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class v2e {
    public static final Set a;
    public static final HashMap b;
    public static final HashMap c;
    public static final LinkedHashSet d;

    static {
        u2e[] u2eVarArrValues = u2e.values();
        ArrayList arrayList = new ArrayList(u2eVarArrValues.length);
        for (u2e u2eVar : u2eVarArrValues) {
            arrayList.add(u2eVar.getTypeName());
        }
        a = bu1.q1(arrayList);
        t2e[] t2eVarArrValues = t2e.values();
        ArrayList arrayList2 = new ArrayList(t2eVarArrValues.length);
        for (t2e t2eVar : t2eVarArrValues) {
            arrayList2.add(t2eVar.getTypeName());
        }
        bu1.q1(arrayList2);
        b = new HashMap();
        c = new HashMap();
        ei7.O(new f09(t2e.UBYTEARRAY, n98.e("ubyteArrayOf")), new f09(t2e.USHORTARRAY, n98.e("ushortArrayOf")), new f09(t2e.UINTARRAY, n98.e("uintArrayOf")), new f09(t2e.ULONGARRAY, n98.e("ulongArrayOf")));
        u2e[] u2eVarArrValues2 = u2e.values();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (u2e u2eVar2 : u2eVarArrValues2) {
            linkedHashSet.add(u2eVar2.getArrayClassId().f());
        }
        d = linkedHashSet;
        for (u2e u2eVar3 : u2e.values()) {
            b.put(u2eVar3.getArrayClassId(), u2eVar3.getClassId());
            c.put(u2eVar3.getClassId(), u2eVar3.getArrayClassId());
        }
    }

    public static final boolean a(mn6 mn6Var) {
        co1 co1VarA;
        if (nxd.m(mn6Var) || (co1VarA = mn6Var.j0().a()) == null) {
            return false;
        }
        yv2 yv2VarH = co1VarA.h();
        return (yv2VarH instanceof wx8) && g76.L(((xx8) ((wx8) yv2VarH)).f, mnc.k) && a.contains(co1VarA.getName());
    }
}
