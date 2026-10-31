package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class dn extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public pn f2565a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2566b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ pn f2567c;

    /* renamed from: d, reason: collision with root package name */
    public int f2568d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dn(pn pnVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2567c = pnVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2566b = obj;
        this.f2568d |= Integer.MIN_VALUE;
        return pn.a(this.f2567c, this);
    }
}
