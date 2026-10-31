package kotlinx.coroutines;

import kotlin.Metadata;
import kotlin.coroutines.CoroutineContext;
import t70.c0;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lkotlinx/coroutines/DispatchException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class DispatchException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f72059a;

    public DispatchException(Throwable th2, c0 c0Var, CoroutineContext coroutineContext) {
        super("Coroutine dispatcher " + c0Var + " threw an exception, context = " + coroutineContext, th2);
        this.f72059a = th2;
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return this.f72059a;
    }
}
