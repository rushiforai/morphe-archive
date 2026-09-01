package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ix1 {
    public static final LinkedHashSet a;

    static {
        Set<x0a> set = x0a.NUMBER_TYPES;
        ArrayList arrayList = new ArrayList(cu1.k0(set, 10));
        for (x0a x0aVar : set) {
            x0aVar.getClass();
            arrayList.add(mnc.k.a(x0aVar.getTypeName()));
        }
        ArrayList<y05> arrayListR0 = bu1.R0(bu1.R0(bu1.R0(arrayList, lnc.f.i()), lnc.h.i()), lnc.j.i());
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (y05 y05Var : arrayListR0) {
            y05Var.getClass();
            linkedHashSet.add(new mn1(y05Var.b(), y05Var.a.g()));
        }
        a = linkedHashSet;
    }
}
