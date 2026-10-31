package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ir3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public bs3 f4913a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f4914b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f4915c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4916d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ bs3 f4917e;

    /* renamed from: f, reason: collision with root package name */
    public int f4918f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ir3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4917e = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4916d = obj;
        this.f4918f |= Integer.MIN_VALUE;
        return bs3.b(this.f4917e, this);
    }
}
