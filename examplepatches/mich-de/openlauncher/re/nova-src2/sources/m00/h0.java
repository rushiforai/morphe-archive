package m00;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75557t;

    /* renamed from: u, reason: collision with root package name */
    public int f75558u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f75559v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f75559v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75557t = obj;
        this.f75558u |= Integer.MIN_VALUE;
        return this.f75559v.emit(null, this);
    }
}
