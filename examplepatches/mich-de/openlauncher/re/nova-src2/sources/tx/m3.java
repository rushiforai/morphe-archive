package tx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c80.a f89881t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89882u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p3 f89883v;

    /* renamed from: w, reason: collision with root package name */
    public int f89884w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m3(p3 p3Var, Continuation continuation) {
        super(continuation);
        this.f89883v = p3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89882u = obj;
        this.f89884w |= Integer.MIN_VALUE;
        return this.f89883v.getToken(this);
    }
}
