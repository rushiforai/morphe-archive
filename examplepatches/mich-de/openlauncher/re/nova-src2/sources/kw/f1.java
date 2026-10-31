package kw;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f72364t;

    /* renamed from: u, reason: collision with root package name */
    public int f72365u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.x1 f72366v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(cw.x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f72366v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f72364t = obj;
        this.f72365u |= Integer.MIN_VALUE;
        return this.f72366v.emit(null, this);
    }
}
