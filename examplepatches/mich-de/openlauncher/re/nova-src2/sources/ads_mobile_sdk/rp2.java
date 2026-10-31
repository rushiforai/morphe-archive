package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class rp2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f9273a;

    /* renamed from: b, reason: collision with root package name */
    public od1 f9274b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9275c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dq2 f9276d;

    /* renamed from: e, reason: collision with root package name */
    public int f9277e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rp2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9276d = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9275c = obj;
        this.f9277e |= Integer.MIN_VALUE;
        return dq2.a(this.f9276d, (od1) null, this);
    }
}
