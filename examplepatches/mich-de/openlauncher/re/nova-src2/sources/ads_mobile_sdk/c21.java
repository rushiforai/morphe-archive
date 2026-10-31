package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c21 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1632a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d21 f1633b;

    /* renamed from: c, reason: collision with root package name */
    public int f1634c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c21(d21 d21Var, Continuation continuation) {
        super(continuation);
        this.f1633b = d21Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1632a = obj;
        this.f1634c |= Integer.MIN_VALUE;
        return this.f1633b.a(null, null, this);
    }
}
