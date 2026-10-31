package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cz1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2123a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dz1 f2124b;

    /* renamed from: c, reason: collision with root package name */
    public int f2125c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cz1(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2124b = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2123a = obj;
        this.f2125c |= Integer.MIN_VALUE;
        return this.f2124b.a((b.u7) null, this);
    }
}
