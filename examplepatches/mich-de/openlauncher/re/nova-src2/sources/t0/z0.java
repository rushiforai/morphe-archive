package t0;

import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final class z0 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z.j0 f88315a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a1 f88316b;

    public z0(z.j0 j0Var, a1 a1Var) {
        this.f88315a = j0Var;
        this.f88316b = a1Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        i0.h hVar = (i0.h) obj;
        boolean z11 = hVar instanceof i0.f;
        z.j0 j0Var = this.f88315a;
        if (z11 || (hVar instanceof i0.d) || (hVar instanceof i0.k)) {
            j0Var.g(hVar);
        } else if (hVar instanceof i0.g) {
            j0Var.j(((i0.g) hVar).f61086a);
        } else if (hVar instanceof i0.e) {
            j0Var.j(((i0.e) hVar).f61085a);
        } else if (hVar instanceof i0.l) {
            j0Var.j(((i0.l) hVar).f61090a);
        } else if (hVar instanceof i0.j) {
            j0Var.j(((i0.j) hVar).f61088a);
        }
        Object[] objArr = j0Var.f97840a;
        int i5 = j0Var.f97841b;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            a1 a1Var = this.f88316b;
            if (i11 >= i5) {
                a1Var.f87900b.p(i12);
                return Unit.f71706a;
            }
            i0.h hVar2 = (i0.h) objArr[i11];
            if (hVar2 instanceof i0.f) {
                a1Var.getClass();
                i12 |= 2;
            } else if (hVar2 instanceof i0.d) {
                a1Var.getClass();
                i12 |= 1;
            } else if (hVar2 instanceof i0.k) {
                a1Var.getClass();
                i12 |= 4;
            }
            i11++;
        }
    }
}
