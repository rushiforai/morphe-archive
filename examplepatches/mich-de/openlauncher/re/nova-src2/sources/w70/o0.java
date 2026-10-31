package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class o0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93969t;

    /* renamed from: u, reason: collision with root package name */
    public int f93970u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.u0 f93971v;

    /* renamed from: w, reason: collision with root package name */
    public as.p f93972w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(cw.u0 u0Var, Continuation continuation) {
        super(continuation);
        this.f93971v = u0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93969t = obj;
        this.f93970u |= Integer.MIN_VALUE;
        return this.f93971v.collect(null, this);
    }
}
