package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cx0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public String f2088a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2089b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ tx0 f2090c;

    /* renamed from: d, reason: collision with root package name */
    public int f2091d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cx0(tx0 tx0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2090c = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2089b = obj;
        this.f2091d |= Integer.MIN_VALUE;
        return this.f2090c.b(null, null, null, this);
    }
}
