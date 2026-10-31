package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ft0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public kt0 f3499a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f3500b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ kt0 f3501c;

    /* renamed from: d, reason: collision with root package name */
    public int f3502d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ft0(kt0 kt0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3501c = kt0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3500b = obj;
        this.f3502d |= Integer.MIN_VALUE;
        return kt0.a(this.f3501c, (ContinuationImpl) this);
    }
}
