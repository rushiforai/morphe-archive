package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5102a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k3 f5103b;

    /* renamed from: c, reason: collision with root package name */
    public int f5104c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j3(k3 k3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5103b = k3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5102a = obj;
        this.f5104c |= Integer.MIN_VALUE;
        return this.f5103b.d(this);
    }
}
