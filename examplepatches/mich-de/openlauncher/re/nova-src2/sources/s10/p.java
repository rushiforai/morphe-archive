package s10;

import android.content.Context;
import java.io.Serializable;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import mx.g0;
import t70.q0;

/* loaded from: classes4.dex */
public final class p implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f86625a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f86626b;

    public p() {
        Context context = g0.f77088a;
        this.f86626b = g0.d();
    }

    @Override // r10.q0
    public final Object a(String str, Continuation continuation) {
        return ps.v.x(this, str, (SuspendLambda) continuation);
    }

    @Override // s10.f0
    public final Serializable b(q0 q0Var, SuspendLambda suspendLambda) {
        return this.f86626b.f(q0Var, ul.b.P("shortcut_search"), new i(2), suspendLambda);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        o oVar;
        p pVar;
        if (continuation instanceof o) {
            oVar = (o) continuation;
            int i5 = oVar.f86624w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f86624w = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, (ContinuationImpl) continuation);
            }
        }
        Object objE = oVar.f86622u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f86624w;
        if (i11 == 0) {
            ResultKt.b(objE);
            oVar.f86621t = this;
            oVar.f86624w = 1;
            objE = this.f86626b.e(oVar);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
            pVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            pVar = oVar.f86621t;
            ResultKt.b(objE);
        }
        pVar.f86625a = ((Boolean) objE).booleanValue();
        return Unit.f71706a;
    }

    @Override // r10.q0
    public final boolean d() {
        return false;
    }

    @Override // r10.q0
    public final boolean e() {
        return false;
    }

    @Override // r10.q0
    public final int f() {
        return 7;
    }

    @Override // r10.q0
    public final String getName() {
        return "BranchShortcuts";
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f86625a;
    }
}
