package j10;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import t70.f0;

/* loaded from: classes4.dex */
public final class l extends AbstractCoroutineContextElement implements f0 {
    @Override // t70.f0
    public final void handleException(CoroutineContext coroutineContext, Throwable th2) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("KoreaLocationGate");
        bVar.p(th2, "background task failed", new Object[0]);
    }
}
