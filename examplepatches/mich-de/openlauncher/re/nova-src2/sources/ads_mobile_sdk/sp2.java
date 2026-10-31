package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class sp2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f9628a;

    /* renamed from: b, reason: collision with root package name */
    public dj0 f9629b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9630c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ dq2 f9631d;

    /* renamed from: e, reason: collision with root package name */
    public int f9632e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sp2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9631d = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9630c = obj;
        this.f9632e |= Integer.MIN_VALUE;
        return this.f9631d.e(this);
    }
}
