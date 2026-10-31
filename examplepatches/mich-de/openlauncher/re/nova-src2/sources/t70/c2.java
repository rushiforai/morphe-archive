package t70;

import java.util.concurrent.CancellationException;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public final class c2 extends AbstractCoroutineContextElement implements r1 {

    /* renamed from: b, reason: collision with root package name */
    public static final c2 f88780b = new c2(q1.f88853a);

    @Override // t70.r1
    public final Object K(Continuation continuation) {
        throw new UnsupportedOperationException("This job is always active");
    }

    @Override // t70.r1
    public final p M(x1 x1Var) {
        return d2.f88784a;
    }

    @Override // t70.r1
    public final a1 P(Function1 function1, boolean z11, boolean z12) {
        return d2.f88784a;
    }

    @Override // t70.r1
    public final boolean b() {
        return true;
    }

    @Override // t70.r1
    public final void c(CancellationException cancellationException) {
    }

    @Override // t70.r1
    public final Sequence f() {
        return q70.a.f83782a;
    }

    @Override // t70.r1
    public final CancellationException h() {
        throw new IllegalStateException("This job is always active");
    }

    @Override // t70.r1
    public final boolean isCancelled() {
        return false;
    }

    @Override // t70.r1
    public final boolean isCompleted() {
        return false;
    }

    @Override // t70.r1
    public final boolean start() {
        return false;
    }

    public final String toString() {
        return "NonCancellable";
    }

    @Override // t70.r1
    public final a1 w(Function1 function1) {
        return d2.f88784a;
    }
}
