package gx;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public b0 f58138t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58139u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b0 f58140v;

    /* renamed from: w, reason: collision with root package name */
    public int f58141w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(b0 b0Var, Continuation continuation) {
        super(continuation);
        this.f58140v = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58139u = obj;
        this.f58141w |= Integer.MIN_VALUE;
        return b0.a(this.f58140v, null, this);
    }
}
