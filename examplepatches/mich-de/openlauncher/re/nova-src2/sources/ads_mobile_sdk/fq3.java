package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class fq3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iq3 f3472a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f3473b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ iq3 f3474c;

    /* renamed from: d, reason: collision with root package name */
    public int f3475d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fq3(iq3 iq3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3474c = iq3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3473b = obj;
        this.f3475d |= Integer.MIN_VALUE;
        return iq3.a(this.f3474c, this);
    }
}
