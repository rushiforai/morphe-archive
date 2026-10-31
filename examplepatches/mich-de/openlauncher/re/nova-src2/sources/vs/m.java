package vs;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f92980t;

    /* renamed from: u, reason: collision with root package name */
    public int f92981u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f92982v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f92982v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92980t = obj;
        this.f92981u |= Integer.MIN_VALUE;
        return this.f92982v.emit(null, this);
    }
}
