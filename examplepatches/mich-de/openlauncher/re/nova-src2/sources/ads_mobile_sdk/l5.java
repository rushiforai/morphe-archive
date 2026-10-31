package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class l5 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public m5 f6076a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f6077b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ m5 f6078c;

    /* renamed from: d, reason: collision with root package name */
    public int f6079d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l5(m5 m5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6078c = m5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6077b = obj;
        this.f6079d |= Integer.MIN_VALUE;
        return m5.a(this.f6078c, this);
    }
}
