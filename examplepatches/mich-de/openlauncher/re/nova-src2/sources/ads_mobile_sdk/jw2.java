package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class jw2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public kw2 f5426a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5427b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ kw2 f5428c;

    /* renamed from: d, reason: collision with root package name */
    public int f5429d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jw2(kw2 kw2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5428c = kw2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5427b = obj;
        this.f5429d |= Integer.MIN_VALUE;
        return this.f5428c.q(this);
    }
}
