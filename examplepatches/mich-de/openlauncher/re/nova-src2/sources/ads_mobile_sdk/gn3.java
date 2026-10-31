package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gn3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4010a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b.y3 f4011b;

    /* renamed from: c, reason: collision with root package name */
    public int f4012c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gn3(b.y3 y3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4011b = y3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4010a = obj;
        this.f4012c |= Integer.MIN_VALUE;
        return b.y3.a(this.f4011b, this);
    }
}
