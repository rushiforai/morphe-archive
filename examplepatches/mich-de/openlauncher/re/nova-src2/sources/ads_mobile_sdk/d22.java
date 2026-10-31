package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d22 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public q22 f2159a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2160b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ q22 f2161c;

    /* renamed from: d, reason: collision with root package name */
    public int f2162d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d22(q22 q22Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2161c = q22Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2160b = obj;
        this.f2162d |= Integer.MIN_VALUE;
        return this.f2161c.b(this);
    }
}
