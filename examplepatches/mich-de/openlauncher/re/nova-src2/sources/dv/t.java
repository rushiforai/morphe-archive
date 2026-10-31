package dv;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49644t;

    /* renamed from: u, reason: collision with root package name */
    public int f49645u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f49646v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f49646v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49644t = obj;
        this.f49645u |= Integer.MIN_VALUE;
        return this.f49646v.emit(null, this);
    }
}
