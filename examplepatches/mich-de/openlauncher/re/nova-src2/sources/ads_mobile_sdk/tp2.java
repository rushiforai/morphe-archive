package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class tp2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f10031a;

    /* renamed from: b, reason: collision with root package name */
    public b.a1 f10032b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10033c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dq2 f10034d;

    /* renamed from: e, reason: collision with root package name */
    public int f10035e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tp2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10034d = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10033c = obj;
        this.f10035e |= Integer.MIN_VALUE;
        return this.f10034d.a((b.a1) null, (ni.g0) null, this);
    }
}
