package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ya3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f11987a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k02 f11988b;

    /* renamed from: c, reason: collision with root package name */
    public int f11989c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ya3(k02 k02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11988b = k02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11987a = obj;
        this.f11989c |= Integer.MIN_VALUE;
        return this.f11988b.a((b.u7) null, this);
    }
}
