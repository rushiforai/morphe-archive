package d2;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import v70.n;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f48850t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48851u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d f48852v;

    /* renamed from: w, reason: collision with root package name */
    public int f48853w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, Continuation continuation) {
        super(continuation);
        this.f48852v = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48851u = obj;
        this.f48853w |= Integer.MIN_VALUE;
        return this.f48852v.a(this);
    }
}
