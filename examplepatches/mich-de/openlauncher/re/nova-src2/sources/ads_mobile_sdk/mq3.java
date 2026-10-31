package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class mq3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nq3 f7315a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7316b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ nq3 f7317c;

    /* renamed from: d, reason: collision with root package name */
    public int f7318d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mq3(nq3 nq3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7317c = nq3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7316b = obj;
        this.f7318d |= Integer.MIN_VALUE;
        return this.f7317c.a(this);
    }
}
