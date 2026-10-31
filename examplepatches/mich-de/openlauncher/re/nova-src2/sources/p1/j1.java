package p1;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class j1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Function1 f81459t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81460u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ k1 f81461v;

    /* renamed from: w, reason: collision with root package name */
    public int f81462w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j1(k1 k1Var, Continuation continuation) {
        super(continuation);
        this.f81461v = k1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81460u = obj;
        this.f81462w |= Integer.MIN_VALUE;
        return this.f81461v.s(null, this);
    }
}
