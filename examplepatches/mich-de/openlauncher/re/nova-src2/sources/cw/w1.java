package cw;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48359t;

    /* renamed from: u, reason: collision with root package name */
    public int f48360u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f48361v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w1(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f48361v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48359t = obj;
        this.f48360u |= Integer.MIN_VALUE;
        return this.f48361v.emit(null, this);
    }
}
