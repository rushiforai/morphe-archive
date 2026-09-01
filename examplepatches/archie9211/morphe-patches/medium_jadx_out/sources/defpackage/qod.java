package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qod {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;

    public qod(long j, long j2, long j3, long j4, long j5, long j6) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
    }

    public final long a(float f) {
        float fA = ao3.c.a(f);
        xp8 xp8Var = lv1.x;
        long jA = uu1.a(this.a, xp8Var);
        long j = this.b;
        long jA2 = uu1.a(j, xp8Var);
        float fC = uu1.c(jA);
        float fG = uu1.g(jA);
        float f2 = uu1.f(jA);
        float fD = uu1.d(jA);
        float fC2 = uu1.c(jA2);
        float fG2 = uu1.g(jA2);
        float f3 = uu1.f(jA2);
        float fD2 = uu1.d(jA2);
        if (fA < 0.0f) {
            fA = 0.0f;
        }
        if (fA > 1.0f) {
            fA = 1.0f;
        }
        return uu1.a(op8.J(mk7.E(fG, fG2, fA), mk7.E(f2, f3, fA), mk7.E(fD, fD2, fA), mk7.E(fC, fC2, fA), xp8Var), uu1.e(j));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof qod)) {
            return false;
        }
        qod qodVar = (qod) obj;
        long j = qodVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, qodVar.b) && ezd.a(this.c, qodVar.c) && ezd.a(this.d, qodVar.d) && ezd.a(this.e, qodVar.e) && ezd.a(this.f, qodVar.f);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.f) + lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e);
    }
}
