package e10;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f51717t;

    /* renamed from: u, reason: collision with root package name */
    public int f51718u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p2 f51719v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o2(p2 p2Var, Continuation continuation) {
        super(continuation);
        this.f51719v = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51717t = obj;
        this.f51718u |= Integer.MIN_VALUE;
        return this.f51719v.emit(null, this);
    }
}
