package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xa2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11652a;

    /* renamed from: b, reason: collision with root package name */
    public z1 f11653b;

    /* renamed from: c, reason: collision with root package name */
    public Object f11654c;

    /* renamed from: d, reason: collision with root package name */
    public b.b f11655d;

    /* renamed from: e, reason: collision with root package name */
    public long f11656e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f11657f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ fb2 f11658g;

    /* renamed from: h, reason: collision with root package name */
    public int f11659h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xa2(fb2 fb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11658g = fb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11657f = obj;
        this.f11659h |= Integer.MIN_VALUE;
        return this.f11658g.a((z1) null, this);
    }
}
