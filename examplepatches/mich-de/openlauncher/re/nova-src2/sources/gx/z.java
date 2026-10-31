package gx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58210t;

    /* renamed from: u, reason: collision with root package name */
    public int f58211u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v f58212v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(v vVar, Continuation continuation) {
        super(continuation);
        this.f58212v = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58210t = obj;
        this.f58211u |= Integer.MIN_VALUE;
        return this.f58212v.emit(null, this);
    }
}
