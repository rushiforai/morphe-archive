package eb0;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class q extends r {

    /* renamed from: d, reason: collision with root package name */
    public final f f52634d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f52635e;

    public q(o0 o0Var, x80.h hVar, m mVar, f fVar, boolean z11) {
        super(o0Var, hVar, mVar);
        this.f52634d = fVar;
        this.f52635e = z11;
    }

    @Override // eb0.r
    public final Object a(y yVar, Object[] objArr) {
        d dVar = (d) this.f52634d.i(yVar);
        Continuation continuation = (Continuation) objArr[objArr.length - 1];
        try {
            if (!this.f52635e) {
                return w0.b(dVar, continuation);
            }
            Intrinsics.e(dVar, "null cannot be cast to non-null type retrofit2.Call<kotlin.Unit?>");
            return w0.c(dVar, continuation);
        } catch (LinkageError e3) {
            throw e3;
        } catch (ThreadDeath e11) {
            throw e11;
        } catch (VirtualMachineError e12) {
            throw e12;
        } catch (Throwable th2) {
            w0.r(th2, continuation);
            return CoroutineSingletons.f71806a;
        }
    }
}
