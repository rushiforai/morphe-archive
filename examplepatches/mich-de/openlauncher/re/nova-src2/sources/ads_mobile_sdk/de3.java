package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class de3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2486a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ee3 f2487b;

    /* renamed from: c, reason: collision with root package name */
    public int f2488c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public de3(ee3 ee3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2487b = ee3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2486a = obj;
        this.f2488c |= Integer.MIN_VALUE;
        return this.f2487b.d(this);
    }
}
