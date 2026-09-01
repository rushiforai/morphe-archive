package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h58 implements m73 {
    public qjd a;
    public final /* synthetic */ i58 b;

    public h58(i58 i58Var) {
        this.b = i58Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.m73
    public final float U() {
        m73 m73Var = this.b.k;
        m73Var.getClass();
        return m73Var.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    public final qjd a(long j, long j2) {
        long jH;
        i58 i58Var = this.b;
        mkd mkdVar = i58Var.l;
        long jA = qkd.d(j2) ? j58.a(i58Var.l.a.b, j2) : j2;
        if (!qkd.a(jA, i58Var.l.a.b)) {
            i58Var.f(mkd.a(i58Var.l, 0L, jA, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777213));
        }
        if (i58Var.f > 1) {
            ip6 ip6Var = i58Var.n;
            ip6Var.getClass();
            jH = i58Var.h(j, ip6Var);
        } else {
            jH = j;
        }
        ip6 ip6Var2 = i58Var.n;
        ip6Var2.getClass();
        f58 f58VarB = i58Var.b(jH, ip6Var2);
        ip6 ip6Var3 = i58Var.n;
        ip6Var3.getClass();
        qjd qjdVarG = i58Var.g(ip6Var3, jH, f58VarB);
        this.a = qjdVarG;
        i58Var.f(mkdVar);
        return qjdVarG;
    }

    @Override // defpackage.m73
    public final float b() {
        m73 m73Var = this.b.k;
        m73Var.getClass();
        return m73Var.b();
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        if (!qkd.d(j)) {
            return b() * km4.i(j, this);
        }
        i58 i58Var = this.b;
        if (qkd.d(i58Var.l.a.b)) {
            ygf.f("InternalAutoSize -> toPx(): Cannot convert Em to Px when style.fontSize is Em\nDeclare the composable's style.fontSize with Sp units instead.");
            return 0.0f;
        }
        if (qkd.a(i58Var.l.a.b, qkd.c)) {
            ygf.f("InternalAutoSize -> toPx(): Cannot convert Em to Px when style.fontSize is not set. Please specify a font size.");
            return 0.0f;
        }
        return qkd.c(j) * p0(i58Var.l.a.b);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
