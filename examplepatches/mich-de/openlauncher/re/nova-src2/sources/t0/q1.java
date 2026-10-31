package t0;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import g0.t2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class q1 implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f88176a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f88177b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i0.i f88178c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f88179d;

    public q1(t70.j0 j0Var, p1.e1 e1Var, i0.i iVar, p1.e1 e1Var2) {
        this.f88176a = j0Var;
        this.f88177b = e1Var;
        this.f88178c = iVar;
        this.f88179d = e1Var2;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(v2.x xVar, Continuation continuation) {
        Object objD = t2.d(xVar, new p1(this.f88176a, this.f88177b, this.f88178c, null), new iy.s(this.f88179d, 22), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }
}
