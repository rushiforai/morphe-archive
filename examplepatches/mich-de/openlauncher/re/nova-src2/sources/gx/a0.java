package gx;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58016t;

    /* renamed from: u, reason: collision with root package name */
    public int f58017u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f58018v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f58018v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58016t = obj;
        this.f58017u |= Integer.MIN_VALUE;
        return this.f58018v.emit(null, this);
    }
}
