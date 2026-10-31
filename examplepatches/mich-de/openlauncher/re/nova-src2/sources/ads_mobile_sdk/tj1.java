package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class tj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zj1 f9947a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9948b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ zj1 f9949c;

    /* renamed from: d, reason: collision with root package name */
    public int f9950d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9949c = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9948b = obj;
        this.f9950d |= Integer.MIN_VALUE;
        return this.f9949c.e(this);
    }
}
