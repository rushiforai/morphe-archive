package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class pe3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qe3 f8243a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f8244b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ qe3 f8245c;

    /* renamed from: d, reason: collision with root package name */
    public int f8246d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pe3(qe3 qe3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8245c = qe3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8244b = obj;
        this.f8246d |= Integer.MIN_VALUE;
        return this.f8245c.a(false, (Continuation) this);
    }
}
