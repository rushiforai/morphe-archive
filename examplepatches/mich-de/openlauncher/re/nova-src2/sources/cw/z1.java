package cw;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48397t;

    /* renamed from: u, reason: collision with root package name */
    public int f48398u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f48399v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z1(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f48399v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48397t = obj;
        this.f48398u |= Integer.MIN_VALUE;
        return this.f48399v.emit(null, this);
    }
}
