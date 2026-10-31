package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class rq1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public String f9283a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9284b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ sq1 f9285c;

    /* renamed from: d, reason: collision with root package name */
    public int f9286d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rq1(sq1 sq1Var, Continuation continuation) {
        super(continuation);
        this.f9285c = sq1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9284b = obj;
        this.f9286d |= Integer.MIN_VALUE;
        return this.f9285c.a(null, null, this);
    }
}
