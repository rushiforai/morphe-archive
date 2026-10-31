package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cb2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fb2 f1767a;

    /* renamed from: b, reason: collision with root package name */
    public z1 f1768b;

    /* renamed from: c, reason: collision with root package name */
    public b.a1 f1769c;

    /* renamed from: d, reason: collision with root package name */
    public c80.a f1770d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f1771e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fb2 f1772f;

    /* renamed from: g, reason: collision with root package name */
    public int f1773g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cb2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1772f = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1771e = obj;
        this.f1773g |= Integer.MIN_VALUE;
        return fb2.a(this.f1772f, this);
    }
}
