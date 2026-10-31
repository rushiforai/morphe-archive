package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class rj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f9201a;

    /* renamed from: b, reason: collision with root package name */
    public qi f9202b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9203c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f9204d;

    /* renamed from: e, reason: collision with root package name */
    public int f9205e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9204d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9203c = obj;
        this.f9205e |= Integer.MIN_VALUE;
        return wj.a(this.f9204d, null, 0L, this);
    }
}
