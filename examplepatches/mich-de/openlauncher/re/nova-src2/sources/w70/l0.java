package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class l0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93953t;

    /* renamed from: u, reason: collision with root package name */
    public int f93954u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ cw.y1 f93955v;

    /* renamed from: w, reason: collision with root package name */
    public Object f93956w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(cw.y1 y1Var, Continuation continuation) {
        super(continuation);
        this.f93955v = y1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93953t = obj;
        this.f93954u |= Integer.MIN_VALUE;
        return this.f93955v.collect(null, this);
    }
}
