package l1;

import java.util.List;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class z implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ x5 f74336a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k0.h f74337b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ k0.j f74338c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f74339d;

    public z(x5 x5Var, k0.h hVar, k0.j jVar, int i5) {
        this.f74336a = x5Var;
        this.f74337b = hVar;
        this.f74338c = jVar;
        this.f74339d = i5;
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        int iH;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            z2.q0 q0Var = (z2.q0) list.get(i5);
            if (Intrinsics.b(androidx.compose.ui.layout.a.a(q0Var), "navigationIcon")) {
                z2.i1 i1VarH = q0Var.H(y3.a.a(j11, 0, 0, 0, 0, 14));
                int size2 = list.size();
                for (int i11 = 0; i11 < size2; i11++) {
                    z2.q0 q0Var2 = (z2.q0) list.get(i11);
                    if (Intrinsics.b(androidx.compose.ui.layout.a.a(q0Var2), "actionIcons")) {
                        z2.i1 i1VarH2 = q0Var2.H(y3.a.a(j11, 0, 0, 0, 0, 14));
                        if (y3.a.h(j11) == Integer.MAX_VALUE) {
                            iH = y3.a.h(j11);
                        } else {
                            iH = (y3.a.h(j11) - i1VarH.f98081a) - i1VarH2.f98081a;
                            if (iH < 0) {
                                iH = 0;
                            }
                        }
                        int i12 = iH;
                        int size3 = list.size();
                        for (int i13 = 0; i13 < size3; i13++) {
                            z2.q0 q0Var3 = (z2.q0) list.get(i13);
                            if (Intrinsics.b(androidx.compose.ui.layout.a.a(q0Var3), "title")) {
                                z2.i1 i1VarH3 = q0Var3.H(y3.a.a(j11, 0, i12, 0, 0, 12));
                                z2.n nVar = z2.c.f98029b;
                                int iO = i1VarH3.O(nVar) != Integer.MIN_VALUE ? i1VarH3.O(nVar) : 0;
                                float fA = this.f74336a.a();
                                int iG = y3.a.g(j11) == Integer.MAX_VALUE ? y3.a.g(j11) : y3.a.g(j11) + (Float.isNaN(fA) ? 0 : MathKt.b(fA));
                                return t0Var.y(y3.a.h(j11), iG, b70.h.f17594a, new y(i1VarH, iG, i1VarH3, this.f74337b, j11, i1VarH2, t0Var, this.f74338c, this.f74339d, iO));
                            }
                        }
                        throw new NoSuchElementException("Collection contains no element matching the predicate.");
                    }
                }
                throw new NoSuchElementException("Collection contains no element matching the predicate.");
            }
        }
        throw new NoSuchElementException("Collection contains no element matching the predicate.");
    }
}
