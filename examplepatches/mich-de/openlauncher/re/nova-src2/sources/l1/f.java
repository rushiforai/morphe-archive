package l1;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class f implements z2.r0 {
    public static final void f(ArrayList arrayList, Ref.IntRef intRef, z2.t0 t0Var, ArrayList arrayList2, ArrayList arrayList3, Ref.IntRef intRef2, ArrayList arrayList4, Ref.IntRef intRef3, Ref.IntRef intRef4) {
        float f11 = l.f73571d;
        if (!arrayList.isEmpty()) {
            intRef.f71861a = t0Var.mo96roundToPx0680j_4(f11) + intRef.f71861a;
        }
        arrayList.add(0, b70.g.I1(arrayList2));
        arrayList3.add(Integer.valueOf(intRef2.f71861a));
        arrayList4.add(Integer.valueOf(intRef.f71861a));
        intRef.f71861a += intRef2.f71861a;
        intRef3.f71861a = Math.max(intRef3.f71861a, intRef4.f71861a);
        arrayList2.clear();
        intRef4.f71861a = 0;
        intRef2.f71861a = 0;
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        ArrayList arrayList;
        ArrayList arrayList2;
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        ArrayList arrayList5 = new ArrayList();
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        ArrayList arrayList6 = new ArrayList();
        Ref.IntRef intRef3 = new Ref.IntRef();
        Ref.IntRef intRef4 = new Ref.IntRef();
        float f11 = l.f73570c;
        float f12 = l.f73568a;
        int size = list.size();
        int i5 = 0;
        while (i5 < size) {
            z2.i1 i1VarH = ((z2.q0) list.get(i5)).H(j11);
            if (!arrayList6.isEmpty()) {
                ArrayList arrayList7 = arrayList3;
                Ref.IntRef intRef5 = intRef2;
                if (t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a + i1VarH.f98081a <= y3.a.h(j11)) {
                    arrayList3 = arrayList7;
                    intRef2 = intRef5;
                } else {
                    arrayList3 = arrayList7;
                    intRef2 = intRef5;
                    f(arrayList3, intRef2, t0Var, arrayList6, arrayList4, intRef4, arrayList5, intRef, intRef3);
                }
            }
            if (arrayList6.isEmpty()) {
                arrayList2 = arrayList3;
            } else {
                arrayList2 = arrayList3;
                intRef3.f71861a = t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a;
            }
            arrayList6.add(i1VarH);
            intRef3.f71861a += i1VarH.f98081a;
            intRef4.f71861a = Math.max(intRef4.f71861a, i1VarH.f98082b);
            i5++;
            arrayList3 = arrayList2;
        }
        ArrayList arrayList8 = arrayList3;
        if (arrayList6.isEmpty()) {
            arrayList = arrayList8;
        } else {
            float f13 = l.f73568a;
            arrayList = arrayList8;
            f(arrayList, intRef2, t0Var, arrayList6, arrayList4, intRef4, arrayList5, intRef, intRef3);
        }
        int iMax = Math.max(intRef.f71861a, y3.a.j(j11));
        int iMax2 = Math.max(intRef2.f71861a, y3.a.i(j11));
        float f14 = l.f73568a;
        return t0Var.y(iMax, iMax2, b70.h.f17594a, new e(arrayList, t0Var, iMax, arrayList5));
    }
}
