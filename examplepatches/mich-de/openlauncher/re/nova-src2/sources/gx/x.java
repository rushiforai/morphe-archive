package gx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58204t;

    /* renamed from: u, reason: collision with root package name */
    public int f58205u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v f58206v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(v vVar, Continuation continuation) {
        super(continuation);
        this.f58206v = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58204t = obj;
        this.f58205u |= Integer.MIN_VALUE;
        return this.f58206v.emit(null, this);
    }
}
