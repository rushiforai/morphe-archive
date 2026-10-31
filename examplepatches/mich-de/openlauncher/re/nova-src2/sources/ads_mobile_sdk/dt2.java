package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f2629a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ et2 f2630b;

    /* renamed from: c, reason: collision with root package name */
    public int f2631c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dt2(et2 et2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2630b = et2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2629a = obj;
        this.f2631c |= Integer.MIN_VALUE;
        return this.f2630b.a(false, (Continuation) this);
    }
}
