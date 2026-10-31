package mq;

import androidx.fragment.app.m0;
import com.stripe.android.model.PassiveCaptchaParams;
import cs.p;
import dv.r;
import h6.f1;
import hq.t;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kw.p2;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class e extends f1 {

    /* renamed from: e, reason: collision with root package name */
    public static final r f76612e;

    /* renamed from: a, reason: collision with root package name */
    public final PassiveCaptchaParams f76613a;

    /* renamed from: b, reason: collision with root package name */
    public final p f76614b;

    /* renamed from: c, reason: collision with root package name */
    public final t1 f76615c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f76616d;

    static {
        t tVar = new t(1);
        tVar.b(Reflection.f71864a.getOrCreateKotlinClass(e.class), new p2(20));
        f76612e = tVar.c();
    }

    public e(PassiveCaptchaParams passiveCaptchaParams, p pVar) {
        Intrinsics.g(passiveCaptchaParams, "passiveCaptchaParams");
        this.f76613a = passiveCaptchaParams;
        this.f76614b = pVar;
        t1 t1VarB = u1.b(1, 0, null, 6);
        this.f76615c = t1VarB;
        this.f76616d = t1VarB;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x005c, code lost:
    
        if (r6.emit(com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerCompleted.f42523a, r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(m0 m0Var, ContinuationImpl continuationImpl) {
        d dVar;
        e eVar;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f76611w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f76611w = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object obj = dVar.f76609u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f76611w;
        if (i11 == 0) {
            ResultKt.b(obj);
            PassiveCaptchaParams passiveCaptchaParams = this.f76613a;
            String str = passiveCaptchaParams.f43531a;
            String str2 = passiveCaptchaParams.f43532b;
            dVar.f76608t = this;
            dVar.f76611w = 1;
            if (this.f76614b.d(m0Var, str, str2, dVar) != coroutineSingletons) {
                eVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        eVar = dVar.f76608t;
        ResultKt.b(obj);
        t1 t1Var = eVar.f76615c;
        dVar.f76608t = null;
        dVar.f76611w = 2;
    }
}
