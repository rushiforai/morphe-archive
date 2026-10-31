package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jg2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public mg2 f5234a;

    /* renamed from: b, reason: collision with root package name */
    public int f5235b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5236c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ mg2 f5237d;

    /* renamed from: e, reason: collision with root package name */
    public int f5238e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jg2(mg2 mg2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5237d = mg2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5236c = obj;
        this.f5238e |= Integer.MIN_VALUE;
        return mg2.a(this.f5237d, false, (ContinuationImpl) this);
    }
}
