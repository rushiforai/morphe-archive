package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dt1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ft1 f2622a;

    /* renamed from: b, reason: collision with root package name */
    public Object f2623b;

    /* renamed from: c, reason: collision with root package name */
    public Object f2624c;

    /* renamed from: d, reason: collision with root package name */
    public d f2625d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f2626e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ft1 f2627f;

    /* renamed from: g, reason: collision with root package name */
    public int f2628g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dt1(ft1 ft1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2627f = ft1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2626e = obj;
        this.f2628g |= Integer.MIN_VALUE;
        return this.f2627f.a(null, null, this);
    }
}
