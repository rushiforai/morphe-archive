package p1;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;

/* loaded from: classes2.dex */
public final class b2 extends AbstractCoroutineContextElement implements t70.f0 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a2.i f81386b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c2 f81387c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b2(a2.i iVar, c2 c2Var) {
        super(t70.e0.f88787a);
        this.f81386b = iVar;
        this.f81387c = c2Var;
    }

    @Override // t70.f0
    public final void handleException(CoroutineContext coroutineContext, Throwable th2) throws Throwable {
        a2.i iVar = this.f81386b;
        c2 c2Var = this.f81387c;
        iVar.a(c2Var, th2);
        CoroutineContext coroutineContext2 = c2Var.f81391b;
        t70.e0 e0Var = t70.e0.f88787a;
        t70.f0 f0Var = (t70.f0) coroutineContext2.get(e0Var);
        if (f0Var != null) {
            f0Var.handleException(coroutineContext, th2);
            return;
        }
        t70.f0 f0Var2 = (t70.f0) c2Var.f81390a.get(e0Var);
        if (f0Var2 == null) {
            throw th2;
        }
        f0Var2.handleException(coroutineContext, th2);
    }
}
