package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jx1 f2092a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f2093b;

    /* renamed from: c, reason: collision with root package name */
    public String f2094c;

    /* renamed from: d, reason: collision with root package name */
    public double f2095d;

    /* renamed from: e, reason: collision with root package name */
    public int f2096e;

    /* renamed from: f, reason: collision with root package name */
    public int f2097f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f2098g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ jx1 f2099h;

    /* renamed from: i, reason: collision with root package name */
    public int f2100i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cx1(jx1 jx1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2099h = jx1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2098g = obj;
        this.f2100i |= Integer.MIN_VALUE;
        return this.f2099h.a((com.google.gson.r) null, false, (ContinuationImpl) this);
    }
}
