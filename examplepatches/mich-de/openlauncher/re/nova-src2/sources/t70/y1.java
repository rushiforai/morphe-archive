package t70;

import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function2;

/* loaded from: classes5.dex */
public final class y1 extends q0 {

    /* renamed from: d, reason: collision with root package name */
    public final Continuation f88886d;

    public y1(CoroutineContext coroutineContext, Function2 function2) {
        super(coroutineContext, false);
        this.f88886d = IntrinsicsKt.a(this, this, function2);
    }

    @Override // t70.x1
    public final void d0() {
        try {
            Continuation continuationB = IntrinsicsKt.b(this.f88886d);
            int i5 = Result.f71687b;
            y70.g.d(Unit.f71706a, continuationB);
        } catch (Throwable th2) {
            z70.a.a(th2, this);
            throw null;
        }
    }
}
