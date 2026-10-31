package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ub2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10284a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vb2 f10285b;

    /* renamed from: c, reason: collision with root package name */
    public int f10286c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ub2(vb2 vb2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10285b = vb2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10284a = obj;
        this.f10286c |= Integer.MIN_VALUE;
        return this.f10285b.d(this);
    }
}
