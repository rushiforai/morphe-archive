package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gt0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public kt0 f4058a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f4059b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ kt0 f4060c;

    /* renamed from: d, reason: collision with root package name */
    public int f4061d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gt0(kt0 kt0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4060c = kt0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4059b = obj;
        this.f4061d |= Integer.MIN_VALUE;
        return kt0.b(this.f4060c, this);
    }
}
