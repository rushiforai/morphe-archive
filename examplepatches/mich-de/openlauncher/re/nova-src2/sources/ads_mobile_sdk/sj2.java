package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class sj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9578a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9579b;

    /* renamed from: c, reason: collision with root package name */
    public Object f9580c;

    /* renamed from: d, reason: collision with root package name */
    public int f9581d;

    /* renamed from: e, reason: collision with root package name */
    public int f9582e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f9583f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ fl2 f9584g;

    /* renamed from: h, reason: collision with root package name */
    public int f9585h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9584g = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9583f = obj;
        this.f9585h |= Integer.MIN_VALUE;
        return fl2.a(this.f9584g, this);
    }
}
