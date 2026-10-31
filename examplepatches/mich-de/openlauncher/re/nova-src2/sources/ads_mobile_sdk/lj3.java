package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class lj3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nj3 f6253a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f6254b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ nj3 f6255c;

    /* renamed from: d, reason: collision with root package name */
    public int f6256d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj3(nj3 nj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6255c = nj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6254b = obj;
        this.f6256d |= Integer.MIN_VALUE;
        return this.f6255c.f(this);
    }
}
