package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f2636a;

    /* renamed from: b, reason: collision with root package name */
    public Object f2637b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2638c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ iv1 f2639d;

    /* renamed from: e, reason: collision with root package name */
    public int f2640e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dv1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2639d = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2638c = obj;
        this.f2640e |= Integer.MIN_VALUE;
        return this.f2639d.h(this);
    }
}
