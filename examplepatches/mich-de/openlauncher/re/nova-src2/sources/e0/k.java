package e0;

import android.content.Context;
import android.os.Build;
import android.widget.EdgeEffect;
import androidx.compose.ui.node.DelegatingNode;
import g0.g2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.math.MathKt;
import p1.s2;

/* loaded from: classes.dex */
public final class k implements n1 {

    /* renamed from: a, reason: collision with root package name */
    public final y3.c f50035a;

    /* renamed from: b, reason: collision with root package name */
    public long f50036b = 9205357640488583168L;

    /* renamed from: c, reason: collision with root package name */
    public final k0 f50037c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f50038d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f50039e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f50040f;

    /* renamed from: g, reason: collision with root package name */
    public long f50041g;

    /* renamed from: h, reason: collision with root package name */
    public long f50042h;

    /* renamed from: i, reason: collision with root package name */
    public final DelegatingNode f50043i;

    public k(Context context, y3.c cVar, long j11, k0.o1 o1Var) {
        this.f50035a = cVar;
        k0 k0Var = new k0(context, i2.r0.r(j11));
        this.f50037c = k0Var;
        this.f50038d = androidx.compose.runtime.d.j(Unit.f71706a, p1.g1.f81422b);
        this.f50039e = true;
        this.f50041g = 0L;
        this.f50042h = -1L;
        j jVar = new j(this, 0);
        v2.m mVar = v2.f0.f91929a;
        v2.l0 l0Var = new v2.l0(null, null, jVar);
        this.f50043i = Build.VERSION.SDK_INT >= 31 ? new c2(l0Var, this, k0Var) : new o0(l0Var, this, k0Var, o1Var);
    }

    public final void a() {
        boolean z11;
        k0 k0Var = this.f50037c;
        EdgeEffect edgeEffect = k0Var.f50047d;
        boolean z12 = true;
        if (edgeEffect != null) {
            edgeEffect.onRelease();
            z11 = !edgeEffect.isFinished();
        } else {
            z11 = false;
        }
        EdgeEffect edgeEffect2 = k0Var.f50048e;
        if (edgeEffect2 != null) {
            edgeEffect2.onRelease();
            z11 = !edgeEffect2.isFinished() || z11;
        }
        EdgeEffect edgeEffect3 = k0Var.f50049f;
        if (edgeEffect3 != null) {
            edgeEffect3.onRelease();
            z11 = !edgeEffect3.isFinished() || z11;
        }
        EdgeEffect edgeEffect4 = k0Var.f50050g;
        if (edgeEffect4 != null) {
            edgeEffect4.onRelease();
            if (edgeEffect4.isFinished() && !z11) {
                z12 = false;
            }
            z11 = z12;
        }
        if (z11) {
            d();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0055, code lost:
    
        if (r17.invoke(r1, r2) == r3) goto L50;
     */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0176  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11, g2 g2Var, ContinuationImpl continuationImpl) {
        h hVar;
        long j12;
        long jF;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f50004w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f50004w = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object objInvoke = hVar.f50002u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = hVar.f50004w;
        k0 k0Var = this.f50037c;
        if (i11 != 0) {
            if (i11 == 1) {
                ResultKt.b(objInvoke);
                return Unit.f71706a;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j12 = hVar.f50001t;
            ResultKt.b(objInvoke);
            jF = y3.r.f(j12, ((y3.r) objInvoke).j());
            this.f50040f = false;
            if (y3.r.d(jF) <= 0.0f) {
                jk.b.P(k0Var.c(), MathKt.b(y3.r.d(jF)));
            } else if (y3.r.d(jF) < 0.0f) {
                jk.b.P(k0Var.d(), -MathKt.b(y3.r.d(jF)));
            }
            if (y3.r.e(jF) <= 0.0f) {
                jk.b.P(k0Var.e(), MathKt.b(y3.r.e(jF)));
            } else if (y3.r.e(jF) < 0.0f) {
                jk.b.P(k0Var.b(), -MathKt.b(y3.r.e(jF)));
            }
            a();
            return Unit.f71706a;
        }
        ResultKt.b(objInvoke);
        if (h2.e.e(this.f50041g)) {
            Object objA = y3.r.a(j11);
            hVar.f50004w = 1;
        } else {
            boolean zG = k0.g(k0Var.f50049f);
            y3.c cVar = this.f50035a;
            long jC = p6.u.c((!zG || y3.r.d(j11) >= 0.0f) ? (!k0.g(k0Var.f50050g) || y3.r.d(j11) <= 0.0f) ? 0.0f : -jk.b.j(k0Var.d(), -y3.r.d(j11), Float.intBitsToFloat((int) (this.f50041g >> 32)), cVar) : jk.b.j(k0Var.c(), y3.r.d(j11), Float.intBitsToFloat((int) (this.f50041g >> 32)), cVar), (!k0.g(k0Var.f50047d) || y3.r.e(j11) >= 0.0f) ? (!k0.g(k0Var.f50048e) || y3.r.e(j11) <= 0.0f) ? 0.0f : -jk.b.j(k0Var.b(), -y3.r.e(j11), Float.intBitsToFloat((int) (4294967295L & this.f50041g)), cVar) : jk.b.j(k0Var.e(), y3.r.e(j11), Float.intBitsToFloat((int) (4294967295L & this.f50041g)), cVar));
            if (!y3.r.c(jC)) {
                d();
            }
            long jF2 = y3.r.f(j11, jC);
            Object objA2 = y3.r.a(jF2);
            hVar.f50001t = jF2;
            hVar.f50004w = 2;
            objInvoke = g2Var.invoke(objA2, hVar);
            if (objInvoke != obj) {
                j12 = jF2;
                jF = y3.r.f(j12, ((y3.r) objInvoke).j());
                this.f50040f = false;
                if (y3.r.d(jF) <= 0.0f) {
                }
                if (y3.r.e(jF) <= 0.0f) {
                }
                a();
                return Unit.f71706a;
            }
        }
        return obj;
    }

    public final long c() {
        long jQ = this.f50036b;
        if ((9223372034707292159L & jQ) == 9205357640488583168L) {
            jQ = fg.a.q(this.f50041g);
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jQ >> 32)) / Float.intBitsToFloat((int) (this.f50041g >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jQ & 4294967295L)) / Float.intBitsToFloat((int) (this.f50041g & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public final void d() {
        if (this.f50039e) {
            ((s2) this.f50038d).setValue(Unit.f71706a);
        }
    }

    public final float e(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (c() >> 32));
        int i5 = (int) (j11 & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i5) / Float.intBitsToFloat((int) (this.f50041g & 4294967295L));
        EdgeEffect edgeEffectB = this.f50037c.b();
        return jk.b.C(edgeEffectB) == 0.0f ? Float.intBitsToFloat((int) (this.f50041g & 4294967295L)) * (-jk.b.Q(edgeEffectB, -fIntBitsToFloat2, 1 - fIntBitsToFloat)) : Float.intBitsToFloat(i5);
    }

    public final float f(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (c() & 4294967295L));
        int i5 = (int) (j11 >> 32);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i5) / Float.intBitsToFloat((int) (this.f50041g >> 32));
        EdgeEffect edgeEffectC = this.f50037c.c();
        return jk.b.C(edgeEffectC) == 0.0f ? Float.intBitsToFloat((int) (this.f50041g >> 32)) * jk.b.Q(edgeEffectC, fIntBitsToFloat2, 1 - fIntBitsToFloat) : Float.intBitsToFloat(i5);
    }

    public final float g(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (c() & 4294967295L));
        int i5 = (int) (j11 >> 32);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i5) / Float.intBitsToFloat((int) (this.f50041g >> 32));
        EdgeEffect edgeEffectD = this.f50037c.d();
        return jk.b.C(edgeEffectD) == 0.0f ? Float.intBitsToFloat((int) (this.f50041g >> 32)) * (-jk.b.Q(edgeEffectD, -fIntBitsToFloat2, fIntBitsToFloat)) : Float.intBitsToFloat(i5);
    }

    public final float h(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (c() >> 32));
        int i5 = (int) (j11 & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat(i5) / Float.intBitsToFloat((int) (this.f50041g & 4294967295L));
        EdgeEffect edgeEffectE = this.f50037c.e();
        return jk.b.C(edgeEffectE) == 0.0f ? Float.intBitsToFloat((int) (this.f50041g & 4294967295L)) * jk.b.Q(edgeEffectE, fIntBitsToFloat2, fIntBitsToFloat) : Float.intBitsToFloat(i5);
    }

    public final void i(long j11) {
        boolean zA = h2.e.a(this.f50041g, 0L);
        boolean zA2 = h2.e.a(j11, this.f50041g);
        this.f50041g = j11;
        if (!zA2) {
            long jB = (MathKt.b(Float.intBitsToFloat((int) (j11 & 4294967295L))) & 4294967295L) | (MathKt.b(Float.intBitsToFloat((int) (j11 >> 32))) << 32);
            k0 k0Var = this.f50037c;
            k0Var.f50046c = jB;
            EdgeEffect edgeEffect = k0Var.f50047d;
            if (edgeEffect != null) {
                edgeEffect.setSize((int) (jB >> 32), (int) (jB & 4294967295L));
            }
            EdgeEffect edgeEffect2 = k0Var.f50048e;
            if (edgeEffect2 != null) {
                edgeEffect2.setSize((int) (jB >> 32), (int) (jB & 4294967295L));
            }
            EdgeEffect edgeEffect3 = k0Var.f50049f;
            if (edgeEffect3 != null) {
                edgeEffect3.setSize((int) (jB & 4294967295L), (int) (jB >> 32));
            }
            EdgeEffect edgeEffect4 = k0Var.f50050g;
            if (edgeEffect4 != null) {
                edgeEffect4.setSize((int) (jB & 4294967295L), (int) (jB >> 32));
            }
            EdgeEffect edgeEffect5 = k0Var.f50051h;
            if (edgeEffect5 != null) {
                edgeEffect5.setSize((int) (jB >> 32), (int) (jB & 4294967295L));
            }
            EdgeEffect edgeEffect6 = k0Var.f50052i;
            if (edgeEffect6 != null) {
                edgeEffect6.setSize((int) (jB >> 32), (int) (jB & 4294967295L));
            }
            EdgeEffect edgeEffect7 = k0Var.f50053j;
            if (edgeEffect7 != null) {
                edgeEffect7.setSize((int) (jB & 4294967295L), (int) (jB >> 32));
            }
            EdgeEffect edgeEffect8 = k0Var.f50054k;
            if (edgeEffect8 != null) {
                edgeEffect8.setSize((int) (4294967295L & jB), (int) (jB >> 32));
            }
        }
        if (zA || zA2) {
            return;
        }
        a();
    }
}
