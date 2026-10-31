package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class wp3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public yp3 f11358a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11359b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ yp3 f11360c;

    /* renamed from: d, reason: collision with root package name */
    public int f11361d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wp3(yp3 yp3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11360c = yp3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11359b = obj;
        this.f11361d |= Integer.MIN_VALUE;
        return this.f11360c.a((fs3) null, (mi3) null, (x60) null, (eg2) null, (m31) null, this);
    }
}
