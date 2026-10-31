package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class sm3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tm3 f9615a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9616b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ tm3 f9617c;

    /* renamed from: d, reason: collision with root package name */
    public int f9618d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sm3(tm3 tm3Var, Continuation continuation) {
        super(continuation);
        this.f9617c = tm3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9616b = obj;
        this.f9618d |= Integer.MIN_VALUE;
        return this.f9617c.a(null, null, this);
    }
}
