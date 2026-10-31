package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class k72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public m72 f5538a;

    /* renamed from: b, reason: collision with root package name */
    public Object f5539b;

    /* renamed from: c, reason: collision with root package name */
    public Object f5540c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f5541d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5542e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ m72 f5543f;

    /* renamed from: g, reason: collision with root package name */
    public int f5544g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k72(m72 m72Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5543f = m72Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5542e = obj;
        this.f5544g |= Integer.MIN_VALUE;
        return m72.a(this.f5543f, (tx0) null, false, (ContinuationImpl) this);
    }
}
