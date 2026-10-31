package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class iw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f4967a;

    /* renamed from: b, reason: collision with root package name */
    public ri.a f4968b;

    /* renamed from: c, reason: collision with root package name */
    public int f4969c;

    /* renamed from: d, reason: collision with root package name */
    public int f4970d;

    /* renamed from: e, reason: collision with root package name */
    public long f4971e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f4972f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ vw f4973g;

    /* renamed from: h, reason: collision with root package name */
    public int f4974h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4973g = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4972f = obj;
        this.f4974h |= Integer.MIN_VALUE;
        return vw.a(this.f4973g, (ri.a) null, this);
    }
}
