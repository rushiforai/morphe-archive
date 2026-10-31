package f1;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f53476a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f53477b;

    public e(float f11, float f12) {
        this.f53476a = f11;
        this.f53477b = f12;
    }

    public static final void f(ArrayList arrayList, Ref.IntRef intRef, z2.t0 t0Var, float f11, ArrayList arrayList2, ArrayList arrayList3, Ref.IntRef intRef2, ArrayList arrayList4, Ref.IntRef intRef3, Ref.IntRef intRef4) {
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
        int i5;
        z2.i1 i1Var;
        List list2 = list;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        Ref.IntRef intRef = new Ref.IntRef();
        Ref.IntRef intRef2 = new Ref.IntRef();
        ArrayList arrayList4 = new ArrayList();
        Ref.IntRef intRef3 = new Ref.IntRef();
        Ref.IntRef intRef4 = new Ref.IntRef();
        int i11 = 0;
        long jB = y3.b.b(y3.a.h(j11), 0, 13);
        for (int size = list2.size(); i11 < size; size = i5) {
            z2.i1 i1VarH = ((z2.q0) list2.get(i11)).H(jB);
            boolean zIsEmpty = arrayList4.isEmpty();
            float f11 = this.f53476a;
            if (zIsEmpty) {
                i5 = size;
                i1Var = i1VarH;
            } else {
                ArrayList arrayList5 = arrayList;
                Ref.IntRef intRef5 = intRef2;
                if (t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a + i1VarH.f98081a <= y3.a.h(j11)) {
                    arrayList = arrayList5;
                    intRef2 = intRef5;
                    i5 = size;
                    i1Var = i1VarH;
                } else {
                    i5 = size;
                    intRef2 = intRef5;
                    i1Var = i1VarH;
                    arrayList = arrayList5;
                    f(arrayList, intRef2, t0Var, this.f53477b, arrayList4, arrayList2, intRef4, arrayList3, intRef, intRef3);
                }
            }
            if (!arrayList4.isEmpty()) {
                intRef3.f71861a = t0Var.mo96roundToPx0680j_4(f11) + intRef3.f71861a;
            }
            arrayList4.add(i1Var);
            intRef3.f71861a += i1Var.f98081a;
            intRef4.f71861a = Math.max(intRef4.f71861a, i1Var.f98082b);
            i11++;
            list2 = list;
        }
        if (!arrayList4.isEmpty()) {
            f(arrayList, intRef2, t0Var, this.f53477b, arrayList4, arrayList2, intRef4, arrayList3, intRef, intRef3);
        }
        int iH = y3.a.h(j11) != Integer.MAX_VALUE ? y3.a.h(j11) : Math.max(intRef.f71861a, y3.a.j(j11));
        return t0Var.y(iH, Math.max(intRef2.f71861a, y3.a.i(j11)), b70.h.f17594a, new gy.z0(arrayList, t0Var, this.f53476a, iH, arrayList3));
    }
}
