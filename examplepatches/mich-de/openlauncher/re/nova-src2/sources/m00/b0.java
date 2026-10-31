package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75523t;

    /* renamed from: u, reason: collision with root package name */
    public int f75524u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75525v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(z zVar, Continuation continuation) {
        super(continuation);
        this.f75525v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75523t = obj;
        this.f75524u |= Integer.MIN_VALUE;
        return this.f75525v.emit(null, this);
    }
}
