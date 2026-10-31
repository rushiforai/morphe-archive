package y70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public class s extends t70.a implements CoroutineStackFrame {

    /* renamed from: d, reason: collision with root package name */
    public final Continuation f96824d;

    public s(Continuation continuation, CoroutineContext coroutineContext) {
        super(coroutineContext, true);
        this.f96824d = continuation;
    }

    @Override // t70.x1
    public final boolean W() {
        return true;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        Continuation continuation = this.f96824d;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    public void m0() {
    }

    @Override // t70.x1
    public void u(Object obj) throws DispatchException {
        g.d(t70.w.a(obj), IntrinsicsKt.b(this.f96824d));
    }

    @Override // t70.x1
    public void v(Object obj) {
        this.f96824d.resumeWith(t70.w.a(obj));
    }
}
