package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75538t;

    /* renamed from: u, reason: collision with root package name */
    public int f75539u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75540v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(z zVar, Continuation continuation) {
        super(continuation);
        this.f75540v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75538t = obj;
        this.f75539u |= Integer.MIN_VALUE;
        return this.f75540v.emit(null, this);
    }
}
