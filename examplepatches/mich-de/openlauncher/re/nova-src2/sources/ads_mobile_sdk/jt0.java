package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class jt0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public kt0 f5382a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5383b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ kt0 f5384c;

    /* renamed from: d, reason: collision with root package name */
    public int f5385d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jt0(kt0 kt0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5384c = kt0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5383b = obj;
        this.f5385d |= Integer.MIN_VALUE;
        return kt0.a(this.f5384c, null, this);
    }
}
