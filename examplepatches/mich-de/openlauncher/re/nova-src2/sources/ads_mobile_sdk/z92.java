package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class z92 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ca2 f12485a;

    /* renamed from: b, reason: collision with root package name */
    public ea2 f12486b;

    /* renamed from: c, reason: collision with root package name */
    public Object f12487c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12488d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ca2 f12489e;

    /* renamed from: f, reason: collision with root package name */
    public int f12490f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z92(ca2 ca2Var, Continuation continuation) {
        super(continuation);
        this.f12489e = ca2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12488d = obj;
        this.f12490f |= Integer.MIN_VALUE;
        return ca2.a(this.f12489e, (ea2) null, this);
    }
}
