package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class k52 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public x52 f5508a;

    /* renamed from: b, reason: collision with root package name */
    public tx0 f5509b;

    /* renamed from: c, reason: collision with root package name */
    public String f5510c;

    /* renamed from: d, reason: collision with root package name */
    public String f5511d;

    /* renamed from: e, reason: collision with root package name */
    public d00 f5512e;

    /* renamed from: f, reason: collision with root package name */
    public q31 f5513f;

    /* renamed from: g, reason: collision with root package name */
    public ha2 f5514g;

    /* renamed from: h, reason: collision with root package name */
    public ha2 f5515h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f5516i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ x52 f5517j;

    /* renamed from: k, reason: collision with root package name */
    public int f5518k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k52(x52 x52Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5517j = x52Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5516i = obj;
        this.f5518k |= Integer.MIN_VALUE;
        return x52.a(this.f5517j, null, null, null, null, null, null, null, this);
    }
}
