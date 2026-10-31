package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dx0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public tx0 f2665a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f2666b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ tx0 f2667c;

    /* renamed from: d, reason: collision with root package name */
    public int f2668d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dx0(tx0 tx0Var, Continuation continuation) {
        super(continuation);
        this.f2667c = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2666b = obj;
        this.f2668d |= Integer.MIN_VALUE;
        return this.f2667c.a(this);
    }
}
