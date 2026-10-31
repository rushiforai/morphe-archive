package c3;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class h0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public z.d0 f19305t;

    /* renamed from: u, reason: collision with root package name */
    public v70.n f19306u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f19307v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ j0 f19308w;

    /* renamed from: x, reason: collision with root package name */
    public int f19309x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(j0 j0Var, Continuation continuation) {
        super(continuation);
        this.f19308w = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f19307v = obj;
        this.f19309x |= Integer.MIN_VALUE;
        return this.f19308w.l(this);
    }
}
