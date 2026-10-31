package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hf1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public of1 f4372a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f4373b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f4374c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4375d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ of1 f4376e;

    /* renamed from: f, reason: collision with root package name */
    public int f4377f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hf1(of1 of1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4376e = of1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4375d = obj;
        this.f4377f |= Integer.MIN_VALUE;
        return this.f4376e.a(false, (ContinuationImpl) this);
    }
}
