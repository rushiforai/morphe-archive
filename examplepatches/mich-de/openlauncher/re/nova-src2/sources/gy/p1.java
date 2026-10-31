package gy;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public q1 f58487t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58488u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ q1 f58489v;

    /* renamed from: w, reason: collision with root package name */
    public int f58490w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p1(q1 q1Var, Continuation continuation) {
        super(continuation);
        this.f58489v = q1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58488u = obj;
        this.f58490w |= Integer.MIN_VALUE;
        return this.f58489v.emit(null, this);
    }
}
