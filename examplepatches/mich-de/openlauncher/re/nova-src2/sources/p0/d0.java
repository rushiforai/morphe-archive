package p0;

import b10.z0;
import g0.d2;
import g0.m0;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import p1.s2;

/* loaded from: classes2.dex */
public final class d0 implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public final h0.h f81150a;

    /* renamed from: b, reason: collision with root package name */
    public final y f81151b;

    public d0(h0.h hVar, y yVar) {
        this.f81150a = hVar;
        this.f81151b = yVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // g0.m0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(d2 d2Var, float f11, Continuation continuation) throws Throwable {
        c0 c0Var;
        if (continuation instanceof c0) {
            c0Var = (c0) continuation;
            int i5 = c0Var.f81136v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f81136v = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(this, (ContinuationImpl) continuation);
            }
        }
        Object objD = c0Var.f81134t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f81136v;
        if (i11 == 0) {
            ResultKt.b(objD);
            l10.z zVar = new l10.z(9, this, d2Var);
            c0Var.f81136v = 1;
            objD = this.f81150a.d(d2Var, f11, zVar, c0Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        float fFloatValue = ((Number) objD).floatValue();
        y yVar = this.f81151b;
        ox.q qVar = yVar.f81230d;
        ox.q qVar2 = yVar.f81230d;
        if (qVar.e() != 0.0f && Math.abs(qVar2.e()) < 0.001d) {
            int iK = yVar.k();
            if (yVar.f81237k.b()) {
                t70.m0.t(((q) ((s2) yVar.f81240p).getValue()).f81205s, null, null, new z0(3, null, yVar), 3);
            }
            yVar.u(iK, 0.0f, false);
        } else {
            new Float(qVar2.e());
        }
        return new Float(fFloatValue);
    }
}
