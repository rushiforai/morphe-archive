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

/* loaded from: classes.dex */
public final class k implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f86608a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f86609b;

    public k() {
        Context context = g0.f77088a;
        this.f86609b = g0.d();
    }

    @Override // r10.q0
    public final Object a(String str, Continuation continuation) {
        return ps.v.x(this, str, (SuspendLambda) continuation);
    }

    @Override // s10.f0
    public final Serializable b(q0 q0Var, SuspendLambda suspendLambda) {
        return this.f86609b.f(q0Var, ul.b.Q("hero_v2", "hero_ad"), new i(0), suspendLambda);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        j jVar;
        k kVar;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i5 = jVar.f86607w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f86607w = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, (ContinuationImpl) continuation);
            }
        }
        Object objE = jVar.f86605u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f86607w;
        if (i11 == 0) {
            ResultKt.b(objE);
            jVar.f86604t = this;
            jVar.f86607w = 1;
            objE = this.f86609b.e(jVar);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
            kVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            kVar = jVar.f86604t;
            ResultKt.b(objE);
        }
        kVar.f86608a = ((Boolean) objE).booleanValue();
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
        return -1;
    }

    @Override // r10.q0
    public final String getName() {
        return "BranchHeroReengagement";
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f86608a;
    }
}
