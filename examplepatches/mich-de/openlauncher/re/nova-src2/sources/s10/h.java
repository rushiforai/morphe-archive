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
import qx.z0;
import t70.q0;

/* loaded from: classes4.dex */
public final class h implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f86601a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f86602b;

    public h() {
        Context context = g0.f77088a;
        this.f86602b = g0.d();
    }

    @Override // r10.q0
    public final Object a(String str, Continuation continuation) {
        return ps.v.x(this, str, (SuspendLambda) continuation);
    }

    @Override // s10.f0
    public final Serializable b(q0 q0Var, SuspendLambda suspendLambda) {
        return this.f86602b.f(q0Var, ul.b.Q("hero_v2", "hero_ad"), new z0(29), suspendLambda);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        g gVar;
        h hVar;
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f86600w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f86600w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, (ContinuationImpl) continuation);
            }
        }
        Object objE = gVar.f86598u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f86600w;
        if (i11 == 0) {
            ResultKt.b(objE);
            gVar.f86597t = this;
            gVar.f86600w = 1;
            objE = this.f86602b.e(gVar);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
            hVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            hVar = gVar.f86597t;
            ResultKt.b(objE);
        }
        hVar.f86601a = ((Boolean) objE).booleanValue();
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
        return 5;
    }

    @Override // r10.q0
    public final String getName() {
        return "BranchHeroInstall";
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f86601a;
    }
}
