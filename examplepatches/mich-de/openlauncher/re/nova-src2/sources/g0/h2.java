package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class h2 {

    /* renamed from: a, reason: collision with root package name */
    public b2 f56557a;

    /* renamed from: b, reason: collision with root package name */
    public e0.n1 f56558b;

    /* renamed from: c, reason: collision with root package name */
    public m0 f56559c;

    /* renamed from: d, reason: collision with root package name */
    public d1 f56560d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f56561e;

    /* renamed from: f, reason: collision with root package name */
    public x7.h f56562f;

    /* renamed from: g, reason: collision with root package name */
    public final a2 f56563g;

    /* renamed from: h, reason: collision with root package name */
    public final a7.f f56564h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f56565i;

    /* renamed from: j, reason: collision with root package name */
    public int f56566j = 1;

    /* renamed from: k, reason: collision with root package name */
    public n1 f56567k = androidx.compose.foundation.gestures.a.f13930b;

    /* renamed from: l, reason: collision with root package name */
    public final f2 f56568l = new f2(this);

    /* renamed from: m, reason: collision with root package name */
    public final cw.c0 f56569m = new cw.c0(this, 24);

    public h2(b2 b2Var, e0.n1 n1Var, m0 m0Var, d1 d1Var, boolean z11, x7.h hVar, a2 a2Var, a7.f fVar) {
        this.f56557a = b2Var;
        this.f56558b = n1Var;
        this.f56559c = m0Var;
        this.f56560d = d1Var;
        this.f56561e = z11;
        this.f56562f = hVar;
        this.f56563g = a2Var;
        this.f56564h = fVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, ContinuationImpl continuationImpl) throws Throwable {
        c2 c2Var;
        h2 h2Var;
        Throwable th2;
        Ref.LongRef longRef;
        if (continuationImpl instanceof c2) {
            c2Var = (c2) continuationImpl;
            int i5 = c2Var.f56488w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c2Var.f56488w = i5 - Integer.MIN_VALUE;
            } else {
                c2Var = new c2(this, continuationImpl);
            }
        }
        Object obj = c2Var.f56486u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c2Var.f56488w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            longRef = c2Var.f56485t;
            try {
                ResultKt.b(obj);
                h2Var = this;
                h2Var.f56565i = false;
                return y3.r.a(longRef.f71862a);
            } catch (Throwable th3) {
                th2 = th3;
                h2Var = this;
                h2Var.f56565i = false;
                throw th2;
            }
        }
        ResultKt.b(obj);
        Ref.LongRef longRef2 = new Ref.LongRef();
        longRef2.f71862a = j11;
        this.f56565i = true;
        try {
            e0.f1 f1Var = e0.f1.f49976a;
            h2Var = this;
            try {
                e2 e2Var = new e2(h2Var, longRef2, j11, null);
                c2Var.f56485t = longRef2;
                c2Var.f56488w = 1;
                if (f(f1Var, e2Var, c2Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                longRef = longRef2;
                h2Var.f56565i = false;
                return y3.r.a(longRef.f71862a);
            } catch (Throwable th4) {
                th = th4;
                th2 = th;
                h2Var.f56565i = false;
                throw th2;
            }
        } catch (Throwable th5) {
            th = th5;
            h2Var = this;
        }
    }

    public final Object b(long j11, boolean z11, SuspendLambda suspendLambda) {
        if (z11) {
            m0 m0Var = this.f56559c;
            e10.h2 h2Var = androidx.compose.foundation.gestures.a.f13929a;
            if (m0Var instanceof j) {
                return Unit.f71706a;
            }
        }
        long jB = y3.r.b(j11, 0.0f, 0.0f, this.f56560d == d1.f56494b ? 1 : 2);
        g2 g2Var = new g2(this, null);
        e0.n1 n1Var = this.f56558b;
        if (n1Var == null || !(this.f56557a.e() || this.f56557a.c())) {
            Object objInvoke = g2Var.invoke(y3.r.a(jB), suspendLambda);
            return objInvoke == CoroutineSingletons.f71806a ? objInvoke : Unit.f71706a;
        }
        Object objB = ((e0.k) n1Var).b(jB, g2Var, suspendLambda);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    public final long c(n1 n1Var, long j11, int i5) {
        u2.f fVar = (u2.f) this.f56562f.f95137b;
        u2.f fVar2 = null;
        u2.f fVar3 = (fVar == null || !fVar.getIsAttached()) ? null : (u2.f) t2.c.t(fVar);
        long jG = fVar3 != null ? fVar3.g(i5, j11) : 0L;
        long jF = h2.b.f(j11, jG);
        long jE = e(h(n1Var.a(g(e(h2.b.a(jF, 0.0f, 0.0f, this.f56560d == d1.f56494b ? 1 : 2))))));
        a2 a2Var = this.f56563g;
        if (a2Var.getIsAttached()) {
            b3.o.g(a2Var).mo51dispatchOnScrollChangedk4lQ0M(jE);
        }
        long jF2 = h2.b.f(jF, jE);
        u2.f fVar4 = (u2.f) this.f56562f.f95137b;
        if (fVar4 != null && fVar4.getIsAttached()) {
            fVar2 = (u2.f) t2.c.t(fVar4);
        }
        u2.f fVar5 = fVar2;
        return h2.b.g(h2.b.g(jG, jE), fVar5 != null ? fVar5.m(i5, jE, jF2) : 0L);
    }

    public final float d(float f11) {
        return this.f56561e ? f11 * (-1) : f11;
    }

    public final long e(long j11) {
        return this.f56561e ? h2.b.h(-1.0f, j11) : j11;
    }

    public final Object f(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        Object objD = this.f56557a.d(f1Var, new dm.c(this, function2, (Continuation) null, 17), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public final float g(long j11) {
        return Float.intBitsToFloat((int) (this.f56560d == d1.f56494b ? j11 >> 32 : j11 & 4294967295L));
    }

    public final long h(float f11) {
        long jFloatToRawIntBits;
        long j11;
        if (f11 == 0.0f) {
            return 0L;
        }
        if (this.f56560d == d1.f56494b) {
            long jFloatToRawIntBits2 = Float.floatToRawIntBits(f11);
            jFloatToRawIntBits = Float.floatToRawIntBits(0.0f);
            j11 = jFloatToRawIntBits2 << 32;
        } else {
            long jFloatToRawIntBits3 = Float.floatToRawIntBits(0.0f);
            jFloatToRawIntBits = Float.floatToRawIntBits(f11);
            j11 = jFloatToRawIntBits3 << 32;
        }
        return j11 | (jFloatToRawIntBits & 4294967295L);
    }
}
