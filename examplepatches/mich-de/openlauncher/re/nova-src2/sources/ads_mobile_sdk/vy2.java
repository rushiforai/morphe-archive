package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vy2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10971a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ wy2 f10972b;

    /* renamed from: c, reason: collision with root package name */
    public int f10973c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vy2(wy2 wy2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10972b = wy2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10971a = obj;
        this.f10973c |= Integer.MIN_VALUE;
        return this.f10972b.a(null, null, null, false, null, null, null, this);
    }
}
