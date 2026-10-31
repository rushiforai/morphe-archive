package m00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75527t;

    /* renamed from: u, reason: collision with root package name */
    public int f75528u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ z f75529v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(z zVar, Continuation continuation) {
        super(continuation);
        this.f75529v = zVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75527t = obj;
        this.f75528u |= Integer.MIN_VALUE;
        return this.f75529v.emit(null, this);
    }
}
