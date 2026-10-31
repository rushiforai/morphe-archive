package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gr0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jr0 f4035a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f4036b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ jr0 f4037c;

    /* renamed from: d, reason: collision with root package name */
    public int f4038d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gr0(jr0 jr0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4037c = jr0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4036b = obj;
        this.f4038d |= Integer.MIN_VALUE;
        return jr0.a(this.f4037c, null, null, this);
    }
}
