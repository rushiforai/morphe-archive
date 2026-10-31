package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xi2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f11728a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f11729b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fl2 f11730c;

    /* renamed from: d, reason: collision with root package name */
    public int f11731d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xi2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11730c = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11729b = obj;
        this.f11731d |= Integer.MIN_VALUE;
        return this.f11730c.k(this);
    }
}
