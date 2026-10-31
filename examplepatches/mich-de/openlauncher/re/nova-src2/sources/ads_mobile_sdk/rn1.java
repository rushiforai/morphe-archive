package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class rn1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b.oa f9256a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9257b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b.oa f9258c;

    /* renamed from: d, reason: collision with root package name */
    public int f9259d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rn1(b.oa oaVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9258c = oaVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9257b = obj;
        this.f9259d |= Integer.MIN_VALUE;
        return this.f9258c.a(null, this);
    }
}
