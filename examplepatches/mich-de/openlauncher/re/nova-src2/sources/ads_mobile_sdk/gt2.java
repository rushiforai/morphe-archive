package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4065a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ht2 f4066b;

    /* renamed from: c, reason: collision with root package name */
    public int f4067c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gt2(ht2 ht2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4066b = ht2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4065a = obj;
        this.f4067c |= Integer.MIN_VALUE;
        return this.f4066b.a(false, (Continuation) this);
    }
}
