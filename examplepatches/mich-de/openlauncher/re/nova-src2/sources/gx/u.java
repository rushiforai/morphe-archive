package gx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58195t;

    /* renamed from: u, reason: collision with root package name */
    public int f58196u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v f58197v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(v vVar, Continuation continuation) {
        super(continuation);
        this.f58197v = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58195t = obj;
        this.f58196u |= Integer.MIN_VALUE;
        return this.f58197v.emit(null, this);
    }
}
