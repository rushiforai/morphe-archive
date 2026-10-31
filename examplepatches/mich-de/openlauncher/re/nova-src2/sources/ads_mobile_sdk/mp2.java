package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class mp2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f7300a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f7301b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dq2 f7302c;

    /* renamed from: d, reason: collision with root package name */
    public int f7303d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mp2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7302c = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7301b = obj;
        this.f7303d |= Integer.MIN_VALUE;
        return this.f7302c.d(this);
    }
}
