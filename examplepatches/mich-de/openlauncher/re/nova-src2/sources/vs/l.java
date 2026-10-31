package vs;

import as.p;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f92977t;

    /* renamed from: u, reason: collision with root package name */
    public int f92978u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f92979v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(p pVar, Continuation continuation) {
        super(continuation);
        this.f92979v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92977t = obj;
        this.f92978u |= Integer.MIN_VALUE;
        return this.f92979v.emit(null, this);
    }
}
