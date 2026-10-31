package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class wj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zj1 f11300a;

    /* renamed from: b, reason: collision with root package name */
    public long f11301b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11302c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f11303d;

    /* renamed from: e, reason: collision with root package name */
    public int f11304e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11303d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11302c = obj;
        this.f11304e |= Integer.MIN_VALUE;
        return zj1.a(this.f11303d, this);
    }
}
