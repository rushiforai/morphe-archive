package t70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlinx.coroutines.flow.internal.ChildCancelledException;

/* loaded from: classes.dex */
public final class h2 extends y70.s {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f88801e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h2(CoroutineContext coroutineContext, Continuation continuation, int i5) {
        super(continuation, coroutineContext);
        this.f88801e = i5;
    }

    @Override // t70.x1
    public final boolean F(Throwable th2) {
        switch (this.f88801e) {
            case 0:
                return false;
            default:
                if (th2 instanceof ChildCancelledException) {
                    return true;
                }
                return z(th2);
        }
    }
}
