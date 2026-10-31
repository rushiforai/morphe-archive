package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cg0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dg0 f1854a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1855b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dg0 f1856c;

    /* renamed from: d, reason: collision with root package name */
    public int f1857d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cg0(dg0 dg0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1856c = dg0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1855b = obj;
        this.f1857d |= Integer.MIN_VALUE;
        return this.f1856c.a(null, null, null, this);
    }
}
