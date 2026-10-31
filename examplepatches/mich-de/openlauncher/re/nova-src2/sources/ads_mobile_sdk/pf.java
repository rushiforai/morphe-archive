package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class pf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8247a;

    /* renamed from: b, reason: collision with root package name */
    public Object f8248b;

    /* renamed from: c, reason: collision with root package name */
    public Object f8249c;

    /* renamed from: d, reason: collision with root package name */
    public long f8250d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f8251e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ag f8252f;

    /* renamed from: g, reason: collision with root package name */
    public int f8253g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8252f = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8251e = obj;
        this.f8253g |= Integer.MIN_VALUE;
        return this.f8252f.s(this);
    }
}
