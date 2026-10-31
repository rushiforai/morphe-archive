package ai;

import android.os.Bundle;
import com.tiktok.util.TTConst;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class w3 implements c0.j2, te.g {

    /* renamed from: a, reason: collision with root package name */
    public long f13396a;

    /* renamed from: b, reason: collision with root package name */
    public long f13397b;

    /* renamed from: c, reason: collision with root package name */
    public Object f13398c;

    /* renamed from: d, reason: collision with root package name */
    public Object f13399d;

    public w3(long j11, Function0 now) {
        Intrinsics.g(now, "now");
        this.f13396a = j11;
        this.f13398c = now;
    }

    public static void f(w3 w3Var) {
        long jLongValue = ((Number) ((Function0) w3Var.f13398c).invoke()).longValue();
        if (((Long) w3Var.f13399d) == null) {
            w3Var.f13399d = Long.valueOf(jLongValue);
        }
    }

    @Override // c0.j2
    public boolean a() {
        return true;
    }

    @Override // c0.j2
    public long b(c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return Long.MAX_VALUE;
    }

    @Override // te.g
    public long c(ke.k kVar) {
        long j11 = this.f13397b;
        if (j11 < 0) {
            return -1L;
        }
        long j12 = -(j11 + 2);
        this.f13397b = -1L;
        return j12;
    }

    @Override // te.g
    public ke.s d() {
        wf.a.i(this.f13396a != -1);
        return new ke.n((ke.o) this.f13398c, this.f13396a, 0);
    }

    @Override // te.g
    public void e(long j11) {
        long[] jArr = (long[]) ((io.sentry.e3) this.f13399d).f67208b;
        this.f13397b = jArr[wf.v.e(jArr, j11, true)];
    }

    public long g(long j11) {
        long j12 = this.f13397b;
        if (j11 + j12 <= 0) {
            return 0L;
        }
        long j13 = j11 + j12;
        long j14 = this.f13396a;
        long j15 = j13 / j14;
        return (((c0.x0) this.f13399d) == c0.x0.f19005a || j15 % ((long) 2) == 0) ? j13 - (j15 * j14) : ((j15 + 1) * j14) - j13;
    }

    public c0.s h(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        long j12 = this.f13397b;
        long j13 = j11 + j12;
        long j14 = this.f13396a;
        return j13 > j14 ? ((c0.l2) this.f13398c).p(j14 - j12, sVar, sVar3, sVar2) : sVar2;
    }

    public boolean i(long j11, boolean z11, boolean z12) {
        x3 x3Var = (x3) this.f13399d;
        x3Var.D();
        x3Var.E();
        m1 m1Var = (m1) x3Var.f13368a;
        boolean zF = m1Var.f();
        o0 o0Var = m1Var.f13138f;
        if (zF) {
            z0 z0Var = m1Var.f13137e;
            m1.j(z0Var);
            w0 w0Var = z0Var.f13497p;
            m1Var.f13143k.getClass();
            w0Var.g(System.currentTimeMillis());
        }
        long j12 = j11 - this.f13396a;
        if (!z11 && j12 < 1000) {
            m1.l(o0Var);
            o0Var.n.b(Long.valueOf(j12), "Screen exposed for less than 1000 ms. Event not sent. time");
            return false;
        }
        if (!z12) {
            j12 = j11 - this.f13397b;
            this.f13397b = j11;
        }
        m1.l(o0Var);
        o0Var.n.b(Long.valueOf(j12), "Recording user engagement, ms");
        Bundle bundle = new Bundle();
        bundle.putLong("_et", j12);
        boolean z13 = !m1Var.f13136d.S();
        f3 f3Var = m1Var.f13144l;
        m1.k(f3Var);
        p4.z0(f3Var.H(z13), bundle, true);
        if (!z12) {
            t2 t2Var = m1Var.f13145m;
            m1.k(t2Var);
            t2Var.K(TTConst.TRACK_TYPE_AUTO, "_e", bundle);
        }
        this.f13396a = j11;
        v3 v3Var = (v3) this.f13398c;
        v3Var.c();
        v3Var.b(((Long) x.f13436p0.a(null)).longValue());
        return true;
    }

    @Override // c0.j2
    public c0.s k(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((c0.l2) this.f13398c).k(g(j11), sVar, sVar2, h(j11, sVar, sVar3, sVar2));
    }

    @Override // c0.j2
    public c0.s p(long j11, c0.s sVar, c0.s sVar2, c0.s sVar3) {
        return ((c0.l2) this.f13398c).p(g(j11), sVar, sVar2, h(j11, sVar, sVar3, sVar2));
    }

    public w3(long j11, int i5) {
        wf.a.i(((vf.a) this.f13398c) == null);
        this.f13396a = j11;
        this.f13397b = j11 + i5;
    }

    public w3(c0.l2 l2Var, c0.x0 x0Var, long j11) {
        this.f13398c = l2Var;
        this.f13399d = x0Var;
        this.f13396a = (l2Var.n() + l2Var.l()) * 1000000;
        this.f13397b = j11 * 1000000;
    }

    public w3(String str, byte[] bArr, long j11, long j12) {
        this.f13398c = str;
        this.f13399d = bArr;
        this.f13396a = j11;
        this.f13397b = j12;
    }
}
