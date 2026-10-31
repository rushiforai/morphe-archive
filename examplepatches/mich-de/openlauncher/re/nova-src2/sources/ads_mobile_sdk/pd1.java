package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class pd1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ni.g f8224a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8225b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ qd1 f8226c;

    /* renamed from: d, reason: collision with root package name */
    public int f8227d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pd1(qd1 qd1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8226c = qd1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8225b = obj;
        this.f8227d |= Integer.MIN_VALUE;
        return this.f8226c.a((od1) null, this);
    }
}
