package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class mw0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7348a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b.i8 f7349b;

    /* renamed from: c, reason: collision with root package name */
    public int f7350c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mw0(b.i8 i8Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7349b = i8Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7348a = obj;
        this.f7350c |= Integer.MIN_VALUE;
        return this.f7349b.n(0L, null, this);
    }
}
