package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class qp2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f8773a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8774b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dq2 f8775c;

    /* renamed from: d, reason: collision with root package name */
    public int f8776d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qp2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8775c = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8774b = obj;
        this.f8776d |= Integer.MIN_VALUE;
        return dq2.a(this.f8775c, (ContinuationImpl) this);
    }
}
