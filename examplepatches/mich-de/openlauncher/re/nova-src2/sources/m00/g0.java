package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75549t;

    /* renamed from: u, reason: collision with root package name */
    public int f75550u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75551v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(z zVar, Continuation continuation) {
        super(continuation);
        this.f75551v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75549t = obj;
        this.f75550u |= Integer.MIN_VALUE;
        return this.f75551v.emit(null, this);
    }
}
