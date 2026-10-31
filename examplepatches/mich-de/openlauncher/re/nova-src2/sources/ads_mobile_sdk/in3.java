package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.q0;

/* loaded from: classes2.dex */
public final class in3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4890a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4891b;

    /* renamed from: c, reason: collision with root package name */
    public q0 f4892c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4893d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ln3 f4894e;

    /* renamed from: f, reason: collision with root package name */
    public int f4895f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public in3(ln3 ln3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4894e = ln3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4893d = obj;
        this.f4895f |= Integer.MIN_VALUE;
        return ln3.a(this.f4894e, (ContinuationImpl) this);
    }
}
