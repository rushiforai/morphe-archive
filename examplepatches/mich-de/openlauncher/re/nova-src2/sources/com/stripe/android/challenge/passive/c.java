package com.stripe.android.challenge.passive;

import androidx.fragment.app.m0;
import com.stripe.android.challenge.passive.PassiveChallengeActivityResult;
import com.stripe.android.model.PassiveCaptchaParams;
import cs.p;
import cs.s;
import cs.u;
import dv.r;
import h6.f1;
import hq.t;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.protobuf.schema.d;
import kq.e;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class c extends f1 {

    /* renamed from: e, reason: collision with root package name */
    public static final r f42513e;

    /* renamed from: a, reason: collision with root package name */
    public final PassiveCaptchaParams f42514a;

    /* renamed from: b, reason: collision with root package name */
    public final p f42515b;

    /* renamed from: c, reason: collision with root package name */
    public final t1 f42516c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f42517d;

    static {
        t tVar = new t(1);
        tVar.b(Reflection.f71864a.getOrCreateKotlinClass(c.class), new d(2));
        f42513e = tVar.c();
    }

    public c(PassiveCaptchaParams passiveCaptchaParams, p pVar) {
        Intrinsics.g(passiveCaptchaParams, "passiveCaptchaParams");
        this.f42514a = passiveCaptchaParams;
        this.f42515b = pVar;
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.f42516c = t1VarB;
        this.f42517d = t1VarB;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0070, code lost:
    
        if (r7.emit(r2, r0) == r1) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x008d, code lost:
    
        if (r7.emit(r2, r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(m0 m0Var, ContinuationImpl continuationImpl) {
        e eVar;
        c cVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f72125w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f72125w = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objA = eVar.f72123u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f72125w;
        if (i11 == 0) {
            ResultKt.b(objA);
            PassiveCaptchaParams passiveCaptchaParams = this.f42514a;
            String str = passiveCaptchaParams.f43531a;
            String str2 = passiveCaptchaParams.f43532b;
            eVar.f72122t = this;
            eVar.f72125w = 1;
            objA = this.f42515b.a(m0Var, str, str2, eVar);
            if (objA != coroutineSingletons) {
                cVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(objA);
                return Unit.f71706a;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        cVar = eVar.f72122t;
        ResultKt.b(objA);
        u uVar = (u) objA;
        if (uVar instanceof s) {
            t1 t1Var = cVar.f42516c;
            PassiveChallengeActivityResult.Failed failed = new PassiveChallengeActivityResult.Failed(((s) uVar).f47852a);
            eVar.f72122t = null;
            eVar.f72125w = 2;
        } else {
            if (!(uVar instanceof cs.t)) {
                throw new NoWhenBranchMatchedException();
            }
            t1 t1Var2 = cVar.f42516c;
            PassiveChallengeActivityResult.Success success = new PassiveChallengeActivityResult.Success(((cs.t) uVar).f47853a);
            eVar.f72122t = null;
            eVar.f72125w = 3;
        }
        return coroutineSingletons;
    }
}
