package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class n12 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public o12 f7393a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7394b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ o12 f7395c;

    /* renamed from: d, reason: collision with root package name */
    public int f7396d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n12(o12 o12Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7395c = o12Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7394b = obj;
        this.f7396d |= Integer.MIN_VALUE;
        return this.f7395c.a((ni.q) null, this);
    }
}
