package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r60 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x60 f8926a;

    /* renamed from: b, reason: collision with root package name */
    public String f8927b;

    /* renamed from: c, reason: collision with root package name */
    public kh3 f8928c;

    /* renamed from: d, reason: collision with root package name */
    public kh3 f8929d;

    /* renamed from: e, reason: collision with root package name */
    public d f8930e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f8931f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ x60 f8932g;

    /* renamed from: h, reason: collision with root package name */
    public int f8933h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r60(x60 x60Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8932g = x60Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8931f = obj;
        this.f8933h |= Integer.MIN_VALUE;
        return x60.a(this.f8932g, null, this);
    }
}
