package gy;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class z0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58623a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f58624b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f58625c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f58626d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f58627e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f58628f;

    public /* synthetic */ z0(ArrayList arrayList, z2.t0 t0Var, float f11, int i5, ArrayList arrayList2) {
        this.f58623a = 2;
        this.f58624b = arrayList;
        this.f58626d = t0Var;
        this.f58627e = f11;
        this.f58625c = i5;
        this.f58628f = arrayList2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean z11;
        boolean z12;
        int i5 = this.f58623a;
        Object next = null;
        boolean z13 = 0;
        Object obj2 = this.f58628f;
        int i11 = this.f58625c;
        float f11 = this.f58627e;
        Object obj3 = this.f58626d;
        Object obj4 = this.f58624b;
        switch (i5) {
            case 0:
                ClosedFloatingPointRange closedFloatingPointRange = (ClosedFloatingPointRange) obj4;
                List list = (List) obj3;
                Function1 function1 = (Function1) obj2;
                float fD0 = kotlin.ranges.a.d0(((Float) obj).floatValue(), ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue());
                if (i11 > 0) {
                    List list2 = list;
                    ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
                    Iterator it = list2.iterator();
                    while (it.hasNext()) {
                        arrayList.add(Float.valueOf(t1.f(((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue(), ((Number) it.next()).floatValue())));
                    }
                    Iterator it2 = arrayList.iterator();
                    if (it2.hasNext()) {
                        next = it2.next();
                        if (it2.hasNext()) {
                            float fAbs = Math.abs(((Number) next).floatValue() - fD0);
                            do {
                                Object next2 = it2.next();
                                float fAbs2 = Math.abs(((Number) next2).floatValue() - fD0);
                                if (Float.compare(fAbs, fAbs2) > 0) {
                                    next = next2;
                                    fAbs = fAbs2;
                                }
                            } while (it2.hasNext());
                        }
                    }
                    Float f12 = (Float) next;
                    if (f12 != null) {
                        fD0 = f12.floatValue();
                    }
                }
                if (fD0 == f11) {
                    z11 = false;
                } else {
                    function1.invoke(Float.valueOf(fD0));
                    z11 = true;
                }
                return Boolean.valueOf(z11);
            case 1:
                ClosedFloatingPointRange closedFloatingPointRange2 = (ClosedFloatingPointRange) obj4;
                List list3 = (List) obj3;
                Function1 function12 = (Function1) obj2;
                float fD02 = kotlin.ranges.a.d0(((Float) obj).floatValue(), ((Number) closedFloatingPointRange2.c()).floatValue(), ((Number) closedFloatingPointRange2.e()).floatValue());
                if (i11 > 0) {
                    List list4 = list3;
                    ArrayList arrayList2 = new ArrayList(b70.c.u0(list4, 10));
                    Iterator it3 = list4.iterator();
                    while (it3.hasNext()) {
                        arrayList2.add(Float.valueOf(hy.u.g(((Number) closedFloatingPointRange2.c()).floatValue(), ((Number) closedFloatingPointRange2.e()).floatValue(), ((Number) it3.next()).floatValue())));
                    }
                    Iterator it4 = arrayList2.iterator();
                    if (it4.hasNext()) {
                        next = it4.next();
                        if (it4.hasNext()) {
                            float fAbs3 = Math.abs(((Number) next).floatValue() - fD02);
                            do {
                                Object next3 = it4.next();
                                float fAbs4 = Math.abs(((Number) next3).floatValue() - fD02);
                                if (Float.compare(fAbs3, fAbs4) > 0) {
                                    next = next3;
                                    fAbs3 = fAbs4;
                                }
                            } while (it4.hasNext());
                        }
                    }
                    Float f13 = (Float) next;
                    if (f13 != null) {
                        fD02 = f13.floatValue();
                    }
                }
                if (fD02 == f11) {
                    z12 = false;
                } else {
                    function12.invoke(Float.valueOf(fD02));
                    z12 = true;
                }
                return Boolean.valueOf(z12);
            default:
                ArrayList arrayList3 = (ArrayList) obj4;
                z2.t0 t0Var = (z2.t0) obj3;
                ArrayList arrayList4 = (ArrayList) obj2;
                z2.h1 h1Var = (z2.h1) obj;
                int size = arrayList3.size();
                int i12 = 0;
                while (i12 < size) {
                    List list5 = (List) arrayList3.get(i12);
                    int size2 = list5.size();
                    int[] iArr = new int[size2];
                    int i13 = z13;
                    while (i13 < size2) {
                        iArr[i13] = ((z2.i1) list5.get(i13)).f98081a + (i13 < ul.b.K(list5) ? t0Var.mo96roundToPx0680j_4(f11) : z13);
                        i13++;
                    }
                    k0.g gVar = k0.k.f70655a;
                    int[] iArr2 = new int[size2];
                    k0.k.c(i11, iArr, iArr2, z13);
                    int size3 = list5.size();
                    for (int i14 = z13; i14 < size3; i14++) {
                        h1Var.i((z2.i1) list5.get(i14), iArr2[i14], ((Number) arrayList4.get(i12)).intValue(), 0.0f);
                    }
                    i12++;
                    z13 = 0;
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ z0(ClosedFloatingPointRange closedFloatingPointRange, int i5, List list, float f11, Function1 function1, int i11) {
        this.f58623a = i11;
        this.f58624b = closedFloatingPointRange;
        this.f58625c = i5;
        this.f58626d = list;
        this.f58627e = f11;
        this.f58628f = function1;
    }
}
