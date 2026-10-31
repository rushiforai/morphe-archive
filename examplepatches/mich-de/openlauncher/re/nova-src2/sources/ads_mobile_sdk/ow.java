package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ow extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8022a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vw f8023b;

    /* renamed from: c, reason: collision with root package name */
    public int f8024c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ow(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8023b = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8022a = obj;
        this.f8024c |= Integer.MIN_VALUE;
        return vw.a(this.f8023b, (ni.q) null, this);
    }
}
