package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ws2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f11378a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ xs2 f11379b;

    /* renamed from: c, reason: collision with root package name */
    public int f11380c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ws2(xs2 xs2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11379b = xs2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11378a = obj;
        this.f11380c |= Integer.MIN_VALUE;
        return this.f11379b.a(false, (Continuation) this);
    }
}
