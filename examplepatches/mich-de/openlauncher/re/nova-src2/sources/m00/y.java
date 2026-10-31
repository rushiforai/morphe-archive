package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75659t;

    /* renamed from: u, reason: collision with root package name */
    public int f75660u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75661v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(z zVar, Continuation continuation) {
        super(continuation);
        this.f75661v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75659t = obj;
        this.f75660u |= Integer.MIN_VALUE;
        return this.f75661v.emit(null, this);
    }
}
