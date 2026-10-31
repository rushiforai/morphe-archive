package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h52 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x52 f4219a;

    /* renamed from: b, reason: collision with root package name */
    public tx0 f4220b;

    /* renamed from: c, reason: collision with root package name */
    public ha2 f4221c;

    /* renamed from: d, reason: collision with root package name */
    public q31 f4222d;

    /* renamed from: e, reason: collision with root package name */
    public d00 f4223e;

    /* renamed from: f, reason: collision with root package name */
    public ha2 f4224f;

    /* renamed from: g, reason: collision with root package name */
    public String f4225g;

    /* renamed from: h, reason: collision with root package name */
    public /* synthetic */ Object f4226h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ x52 f4227i;

    /* renamed from: j, reason: collision with root package name */
    public int f4228j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h52(x52 x52Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4227i = x52Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4226h = obj;
        this.f4228j |= Integer.MIN_VALUE;
        return x52.a(this.f4227i, null, null, null, null, null, null, this);
    }
}
