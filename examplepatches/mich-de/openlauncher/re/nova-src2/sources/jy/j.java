package jy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Ref;
import z2.i1;
import z2.q0;
import z2.r0;
import z2.s0;
import z2.t0;

/* loaded from: classes4.dex */
public final class j implements r0 {
    public static final void f(ArrayList arrayList, Ref.IntRef intRef, t0 t0Var, ArrayList arrayList2, ArrayList arrayList3, Ref.IntRef intRef2, ArrayList arrayList4, Ref.IntRef intRef3, Ref.IntRef intRef4) {
        float f11 = k.f70494b;
        if (!arrayList.isEmpty()) {
            intRef.f71861a = t0Var.mo96roundToPx0680j_4(f11) + intRef.f71861a;
        }
        arrayList.add(b70.g.I1(arrayList2));
        arrayList3.add(Integer.valueOf(intRef2.f71861a));
        arrayList4.add(Integer.valueOf(intRef.f71861a));
        intRef.f71861a += intRef2.f71861a;
        intRef3.f71861a = Math.max(intRef3.f71861a, intRef4.f71861a);
        arrayList2.clear();
        intRef4.f71861a = 0;
        intRef2.f71861a = 0;
    }

    @Override // z2.r0
    public final s0 e(t0 t0Var, List list, long j11) {
        float f11 = k.f70493a;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        ArrayList arrayList4 = new ArrayList();
        Ref.IntRef intRef3 = new Ref.IntRef();
        Ref.IntRef intRef4 = new Ref.IntRef();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            i1 i1VarH = ((q0) it.next()).H(j11);
            if (!arrayList4.isEmpty()) {
                if (t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a + i1VarH.f98081a > y3.a.h(j11)) {
                    float f12 = k.f70493a;
                    f(arrayList, intRef2, t0Var, arrayList4, arrayList2, intRef4, arrayList3, intRef, intRef3);
                }
            }
            if (!arrayList4.isEmpty()) {
                intRef3.f71861a = t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a;
            }
            arrayList4.add(i1VarH);
            intRef3.f71861a += i1VarH.f98081a;
            intRef4.f71861a = Math.max(intRef4.f71861a, i1VarH.f98082b);
        }
        if (!arrayList4.isEmpty()) {
            float f13 = k.f70493a;
            f(arrayList, intRef2, t0Var, arrayList4, arrayList2, intRef4, arrayList3, intRef, intRef3);
        }
        int iMax = Math.max(intRef.f71861a, y3.a.j(j11));
        return t0Var.y(iMax, Math.max(intRef2.f71861a, y3.a.i(j11)), b70.h.f17594a, new i(iMax, 0, arrayList, arrayList3));
    }
}
