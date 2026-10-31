package gx;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58103t;

    /* renamed from: u, reason: collision with root package name */
    public int f58104u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f58105v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f58105v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58103t = obj;
        this.f58104u |= Integer.MIN_VALUE;
        return this.f58105v.emit(null, this);
    }
}
