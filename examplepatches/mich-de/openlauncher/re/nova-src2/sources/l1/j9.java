package l1;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class j9 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f73512a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l9 f73513b;

    public j9(Ref.IntRef intRef, l9 l9Var) {
        this.f73512a = intRef;
        this.f73513b = l9Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        i0.h hVar = (i0.h) obj;
        boolean z11 = hVar instanceof i0.k;
        Ref.IntRef intRef = this.f73512a;
        if (z11) {
            intRef.f71861a++;
        } else if ((hVar instanceof i0.l) || (hVar instanceof i0.j)) {
            intRef.f71861a--;
        }
        boolean z12 = intRef.f71861a > 0;
        l9 l9Var = this.f73513b;
        if (l9Var.f73614c != z12) {
            l9Var.f73614c = z12;
            b3.o.f(l9Var).invalidateMeasurements$ui_release();
        }
        return Unit.f71706a;
    }
}
