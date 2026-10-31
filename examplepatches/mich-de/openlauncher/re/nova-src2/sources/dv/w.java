package dv;

import android.os.SystemClock;
import com.stripe.android.model.StripeIntent;
import h6.f1;
import h6.g1;
import h6.u0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.comparisons.ComparisonsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.g2;
import t70.m0;
import t70.t0;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class w extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final q f49653a;

    /* renamed from: b, reason: collision with root package name */
    public final lv.e f49654b;

    /* renamed from: c, reason: collision with root package name */
    public final i2 f49655c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f49656d;

    public w(q qVar, lv.e eVar, f fVar, u0 u0Var) {
        long j11 = qVar.f49633b;
        this.f49653a = qVar;
        this.f49654b = eVar;
        i2 i2VarC = u1.c(new n(qVar.f49633b, qVar.f49635d, m.f49616a, qVar.f49637f != null));
        this.f49655c = i2VarC;
        this.f49656d = i2VarC;
        Long l9 = (Long) u0Var.a("KEY_CURRENT_POLLING_START_TIME");
        if (l9 == null) {
            u0Var.d("KEY_CURRENT_POLLING_START_TIME", Long.valueOf(SystemClock.elapsedRealtime()));
        }
        if (l9 != null) {
            Duration duration = new Duration(DurationKt.h((Duration.h(j11) + l9.longValue()) - SystemClock.elapsedRealtime(), DurationUnit.f72045d));
            Duration.f72038b.getClass();
            j11 = ((Duration) ComparisonsKt.Z(duration, new Duration(0L))).f72041a;
        }
        Continuation continuation = null;
        m0.t(g1.f(this), null, null, new o(this, j11, (Continuation) null), 3);
        m0.t(g1.f(this), null, null, new p(this, continuation, 0), 3);
        m0.t(g1.f(this), null, null, new o(j11, this, (Continuation) null), 3);
        m0.t(g1.f(this), null, null, new c4.k(this, continuation, 5), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0063, code lost:
    
        if (r8.g(r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(w wVar, ContinuationImpl continuationImpl) {
        s sVar;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f49643w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f49643w = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(wVar, continuationImpl);
            }
        }
        Object obj = sVar.f49641u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar.f49643w;
        if (i11 == 0) {
            ResultKt.b(obj);
            lv.e eVar = wVar.f49654b;
            g2 g2Var = eVar.f75114e;
            if (g2Var != null) {
                g2Var.c(null);
            }
            eVar.f75114e = null;
            Duration.Companion companion = Duration.f72038b;
            long jG = DurationKt.g(3, DurationUnit.f72046e);
            sVar.f49640t = wVar;
            sVar.f49643w = 1;
            if (t0.c(jG, sVar) != coroutineSingletons) {
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
        wVar = sVar.f49640t;
        ResultKt.b(obj);
        sVar.f49640t = null;
        sVar.f49643w = 2;
    }

    public final void f() {
        i2 i2Var;
        Object value;
        do {
            i2Var = this.f49655c;
            value = i2Var.getValue();
        } while (!i2Var.i(value, n.a((n) value, 0L, m.f49619d, false, 3)));
        lv.e eVar = this.f49654b;
        g2 g2Var = eVar.f75114e;
        if (g2Var != null) {
            g2Var.c(null);
        }
        eVar.f75114e = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(ContinuationImpl continuationImpl) {
        v vVar;
        w wVar;
        Object value;
        Object value2;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f49652w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f49652w = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(this, continuationImpl);
            }
        }
        Object objA = vVar.f49650u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = vVar.f49652w;
        if (i11 == 0) {
            ResultKt.b(objA);
            vVar.f49649t = this;
            vVar.f49652w = 1;
            objA = this.f49654b.a(vVar);
            if (objA == obj) {
                return obj;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            wVar = vVar.f49649t;
            ResultKt.b(objA);
        }
        if (((StripeIntent.Status) objA) == StripeIntent.Status.f43985g) {
            i2 i2Var = wVar.f49655c;
            do {
                value2 = i2Var.getValue();
            } while (!i2Var.i(value2, n.a((n) value2, 0L, m.f49617b, false, 11)));
        } else {
            i2 i2Var2 = wVar.f49655c;
            do {
                value = i2Var2.getValue();
            } while (!i2Var2.i(value, n.a((n) value, 0L, m.f49618c, false, 11)));
        }
        return Unit.f71706a;
    }
}
