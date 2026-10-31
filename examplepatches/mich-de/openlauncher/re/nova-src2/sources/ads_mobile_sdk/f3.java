package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3131a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g3 f3132b;

    /* renamed from: c, reason: collision with root package name */
    public int f3133c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f3(g3 g3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3132b = g3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3131a = obj;
        this.f3133c |= Integer.MIN_VALUE;
        return this.f3132b.h(this);
    }
}
