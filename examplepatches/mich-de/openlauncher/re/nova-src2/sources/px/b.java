package px;

import cw.x1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f83107t;

    /* renamed from: u, reason: collision with root package name */
    public int f83108u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x1 f83109v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(x1 x1Var, Continuation continuation) {
        super(continuation);
        this.f83109v = x1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83107t = obj;
        this.f83108u |= Integer.MIN_VALUE;
        return this.f83109v.emit(null, this);
    }
}
