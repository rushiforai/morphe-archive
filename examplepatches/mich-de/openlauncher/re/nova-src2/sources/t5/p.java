package t5;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f88663t;

    /* renamed from: u, reason: collision with root package name */
    public int f88664u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f88665v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f88665v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88663t = obj;
        this.f88664u |= Integer.MIN_VALUE;
        return this.f88665v.emit(null, this);
    }
}
