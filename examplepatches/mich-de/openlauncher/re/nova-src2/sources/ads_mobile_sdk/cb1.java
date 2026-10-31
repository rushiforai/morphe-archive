package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cb1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fb1 f1763a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1764b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fb1 f1765c;

    /* renamed from: d, reason: collision with root package name */
    public int f1766d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cb1(fb1 fb1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1765c = fb1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1764b = obj;
        this.f1766d |= Integer.MIN_VALUE;
        return this.f1765c.h(this);
    }
}
