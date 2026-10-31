package z70;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.DispatchException;
import y70.g;

/* loaded from: classes.dex */
public abstract class a {
    public static final void a(Throwable th2, Continuation continuation) {
        if (th2 instanceof DispatchException) {
            th2 = ((DispatchException) th2).f72059a;
        }
        int i5 = Result.f71687b;
        continuation.resumeWith(ResultKt.a(th2));
        throw th2;
    }

    public static final void b(Function2 function2, t70.a aVar, t70.a aVar2) {
        try {
            Continuation continuationB = IntrinsicsKt.b(IntrinsicsKt.a(aVar, aVar2, function2));
            int i5 = Result.f71687b;
            g.d(Unit.f71706a, continuationB);
        } catch (Throwable th2) {
            a(th2, aVar2);
            throw null;
        }
    }
}
