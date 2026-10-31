package e0;

import androidx.compose.ui.Modifier$Node;
import b3.l2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class t0 extends Modifier$Node implements l2 {

    /* renamed from: a, reason: collision with root package name */
    public i0.i f50130a;

    /* renamed from: b, reason: collision with root package name */
    public i0.f f50131b;

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object B(t0 t0Var, ContinuationImpl continuationImpl) {
        q0 q0Var;
        i0.f fVar;
        if (continuationImpl instanceof q0) {
            q0Var = (q0) continuationImpl;
            int i5 = q0Var.f50103w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q0Var.f50103w = i5 - Integer.MIN_VALUE;
            } else {
                q0Var = new q0(t0Var, continuationImpl);
            }
        }
        Object obj = q0Var.f50101u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q0Var.f50103w;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (t0Var.f50131b == null) {
                i0.f fVar2 = new i0.f();
                i0.i iVar = t0Var.f50130a;
                q0Var.f50100t = fVar2;
                q0Var.f50103w = 1;
                if (iVar.a(fVar2, q0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                fVar = fVar2;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        fVar = q0Var.f50100t;
        ResultKt.b(obj);
        t0Var.f50131b = fVar;
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object D(t0 t0Var, ContinuationImpl continuationImpl) {
        r0 r0Var;
        if (continuationImpl instanceof r0) {
            r0Var = (r0) continuationImpl;
            int i5 = r0Var.f50114v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r0Var.f50114v = i5 - Integer.MIN_VALUE;
            } else {
                r0Var = new r0(t0Var, continuationImpl);
            }
        }
        Object obj = r0Var.f50112t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r0Var.f50114v;
        if (i11 == 0) {
            ResultKt.b(obj);
            i0.f fVar = t0Var.f50131b;
            if (fVar != null) {
                i0.g gVar = new i0.g(fVar);
                i0.i iVar = t0Var.f50130a;
                r0Var.f50114v = 1;
                if (iVar.a(gVar, r0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        t0Var.f50131b = null;
        return Unit.f71706a;
    }

    public final void E() {
        i0.f fVar = this.f50131b;
        if (fVar != null) {
            this.f50130a.b(new i0.g(fVar));
            this.f50131b = null;
        }
    }

    @Override // b3.l2
    public final void onCancelPointerInput() {
        E();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        E();
    }

    @Override // b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11) {
        if (nVar == v2.n.f91981b) {
            int i5 = mVar.f91979e;
            Continuation continuation = null;
            if (i5 == 4) {
                t70.m0.t(getCoroutineScope(), null, null, new s0(this, continuation, 0), 3);
            } else if (i5 == 5) {
                t70.m0.t(getCoroutineScope(), null, null, new s0(this, continuation, 1), 3);
            }
        }
    }
}
