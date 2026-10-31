package ads_mobile_sdk;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.e0;
import t70.f0;

/* loaded from: classes.dex */
public final class ju0 extends AbstractCoroutineContextElement implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final ci3 f5397a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ju0(ci3 traceLogger) {
        super(e0.f88787a);
        Intrinsics.g(traceLogger, "traceLogger");
        this.f5397a = traceLogger;
    }

    @Override // t70.f0
    public final void handleException(CoroutineContext context, Throwable exception) {
        Intrinsics.g(context, "context");
        Intrinsics.g(exception, "exception");
        cz.b bVar = mu0.f7335a;
        mu0.c("Uncaught exception on context " + context + ": " + exception, null);
        exception.printStackTrace();
        try {
            this.f5397a.b(exception);
        } catch (Throwable th2) {
            cz.b bVar2 = mu0.f7335a;
            mu0.c("Failed to report untrapped exception: " + th2, null);
        }
    }
}
