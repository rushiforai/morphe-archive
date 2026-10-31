package k0;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class s implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.f f70737a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f70738b;

    public s(b2.f fVar, boolean z11) {
        this.f70737a = fVar;
        this.f70738b = z11;
    }

    @Override // z2.r0
    public final z2.s0 e(final z2.t0 t0Var, final List list, long j11) {
        int iJ;
        int i5;
        z2.i1 i1VarH;
        boolean zIsEmpty = list.isEmpty();
        b70.h hVar = b70.h.f17594a;
        if (zIsEmpty) {
            return t0Var.y(y3.a.j(j11), y3.a.i(j11), hVar, new h50.i1(25));
        }
        long j12 = this.f70738b ? j11 : j11 & (-8589934589L);
        if (list.size() == 1) {
            z2.q0 q0Var = (z2.q0) list.get(0);
            Object objK = q0Var.k();
            m mVar = objK instanceof m ? (m) objK : null;
            if (mVar != null ? mVar.f70676b : false) {
                iJ = y3.a.j(j11);
                i5 = y3.a.i(j11);
                int iJ2 = y3.a.j(j11);
                int i11 = y3.a.i(j11);
                if (!((i11 >= 0) & (iJ2 >= 0))) {
                    y3.j.a("width and height must be >= 0");
                }
                i1VarH = q0Var.H(y3.b.h(iJ2, iJ2, i11, i11));
            } else {
                i1VarH = q0Var.H(j12);
                iJ = Math.max(y3.a.j(j11), i1VarH.f98081a);
                i5 = Math.max(y3.a.i(j11), i1VarH.f98082b);
            }
            int i12 = i5;
            int i13 = iJ;
            return t0Var.y(i13, i12, hVar, new q(i1VarH, q0Var, t0Var, i13, i12, this));
        }
        final z2.i1[] i1VarArr = new z2.i1[list.size()];
        final Ref.IntRef intRef = new Ref.IntRef();
        intRef.f71861a = y3.a.j(j11);
        final Ref.IntRef intRef2 = new Ref.IntRef();
        intRef2.f71861a = y3.a.i(j11);
        List list2 = list;
        int size = list2.size();
        boolean z11 = false;
        for (int i14 = 0; i14 < size; i14++) {
            z2.q0 q0Var2 = (z2.q0) list.get(i14);
            Object objK2 = q0Var2.k();
            m mVar2 = objK2 instanceof m ? (m) objK2 : null;
            if (mVar2 != null ? mVar2.f70676b : false) {
                z11 = true;
            } else {
                z2.i1 i1VarH2 = q0Var2.H(j12);
                i1VarArr[i14] = i1VarH2;
                intRef.f71861a = Math.max(intRef.f71861a, i1VarH2.f98081a);
                intRef2.f71861a = Math.max(intRef2.f71861a, i1VarH2.f98082b);
            }
        }
        if (z11) {
            int i15 = intRef.f71861a;
            int i16 = i15 != Integer.MAX_VALUE ? i15 : 0;
            int i17 = intRef2.f71861a;
            long jA = y3.b.a(i16, i15, i17 != Integer.MAX_VALUE ? i17 : 0, i17);
            int size2 = list2.size();
            for (int i18 = 0; i18 < size2; i18++) {
                z2.q0 q0Var3 = (z2.q0) list.get(i18);
                Object objK3 = q0Var3.k();
                m mVar3 = objK3 instanceof m ? (m) objK3 : null;
                if (mVar3 != null ? mVar3.f70676b : false) {
                    i1VarArr[i18] = q0Var3.H(jA);
                }
            }
        }
        return t0Var.y(intRef.f71861a, intRef2.f71861a, hVar, new Function1() { // from class: k0.r
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                z2.h1 h1Var = (z2.h1) obj;
                z2.i1[] i1VarArr2 = i1VarArr;
                int length = i1VarArr2.length;
                int i19 = 0;
                int i21 = 0;
                while (i21 < length) {
                    int i22 = i19;
                    z2.i1 i1Var = i1VarArr2[i21];
                    Intrinsics.e(i1Var, "null cannot be cast to non-null type androidx.compose.ui.layout.Placeable");
                    p.b(h1Var, i1Var, (z2.q0) list.get(i22), t0Var.getLayoutDirection(), intRef.f71861a, intRef2.f71861a, this.f70737a);
                    i21++;
                    i19 = i22 + 1;
                }
                return Unit.f71706a;
            }
        });
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Intrinsics.b(this.f70737a, sVar.f70737a) && this.f70738b == sVar.f70738b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f70738b) + (this.f70737a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BoxMeasurePolicy(alignment=");
        sb2.append(this.f70737a);
        sb2.append(", propagateMinConstraints=");
        return a2.c.p(sb2, this.f70738b, ')');
    }
}
