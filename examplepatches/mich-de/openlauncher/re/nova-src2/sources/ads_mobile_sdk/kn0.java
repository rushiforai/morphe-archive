package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kn0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qn0 f5893a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5894b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ qn0 f5895c;

    /* renamed from: d, reason: collision with root package name */
    public int f5896d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kn0(qn0 qn0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5895c = qn0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5894b = obj;
        this.f5896d |= Integer.MIN_VALUE;
        return this.f5895c.b(this);
    }
}
