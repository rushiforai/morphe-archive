package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class n33 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7420a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o33 f7421b;

    /* renamed from: c, reason: collision with root package name */
    public int f7422c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n33(o33 o33Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7421b = o33Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7420a = obj;
        this.f7422c |= Integer.MIN_VALUE;
        return this.f7421b.d(this);
    }
}
