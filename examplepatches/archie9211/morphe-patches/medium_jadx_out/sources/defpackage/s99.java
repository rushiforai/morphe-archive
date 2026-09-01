package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class s99 implements m73 {
    public boolean a;

    public static void i(s99 s99Var, t99 t99Var, long j) {
        s99Var.e(t99Var);
        t99Var.X(k46.d(j, t99Var.e), 0.0f, null);
    }

    public static void j(s99 s99Var, t99 t99Var, int i, int i2) {
        long j = (((long) i) << 32) | (((long) i2) & 4294967295L);
        if (s99Var.c() == ip6.Ltr || s99Var.d() == 0) {
            s99Var.e(t99Var);
            t99Var.X(k46.d(j, t99Var.e), 0.0f, null);
        } else {
            int iD = (s99Var.d() - t99Var.a) - ((int) (j >> 32));
            s99Var.e(t99Var);
            t99Var.X(k46.d((((long) iD) << 32) | (((long) ((int) (j & 4294967295L))) & 4294967295L), t99Var.e), 0.0f, null);
        }
    }

    public static void k(s99 s99Var, t99 t99Var, int i, int i2) {
        int i3 = u99.b;
        ox8 ox8Var = ox8.d;
        long j = (((long) i) << 32) | (((long) i2) & 4294967295L);
        if (s99Var.c() == ip6.Ltr || s99Var.d() == 0) {
            s99Var.e(t99Var);
            t99Var.X(k46.d(j, t99Var.e), 0.0f, ox8Var);
        } else {
            int iD = (s99Var.d() - t99Var.a) - ((int) (j >> 32));
            s99Var.e(t99Var);
            t99Var.X(k46.d((((long) iD) << 32) | (((long) ((int) (j & 4294967295L))) & 4294967295L), t99Var.e), 0.0f, ox8Var);
        }
    }

    public static void l(s99 s99Var, t99 t99Var, long j) {
        int i = u99.b;
        ox8 ox8Var = ox8.d;
        if (s99Var.c() == ip6.Ltr || s99Var.d() == 0) {
            s99Var.e(t99Var);
            t99Var.X(k46.d(j, t99Var.e), 0.0f, ox8Var);
        } else {
            int iD = (s99Var.d() - t99Var.a) - ((int) (j >> 32));
            s99Var.e(t99Var);
            t99Var.X(k46.d((((long) ((int) (j & 4294967295L))) & 4294967295L) | (((long) iD) << 32), t99Var.e), 0.0f, ox8Var);
        }
    }

    public static void m(s99 s99Var, t99 t99Var, long j, of5 of5Var) {
        if (s99Var.c() == ip6.Ltr || s99Var.d() == 0) {
            s99Var.e(t99Var);
            t99Var.a0(k46.d(j, t99Var.e), 0.0f, of5Var);
        } else {
            int iD = (s99Var.d() - t99Var.a) - ((int) (j >> 32));
            s99Var.e(t99Var);
            t99Var.a0(k46.d((((long) ((int) (j & 4294967295L))) & 4294967295L) | (((long) iD) << 32), t99Var.e), 0.0f, of5Var);
        }
    }

    public static /* synthetic */ void p(s99 s99Var, t99 t99Var, int i, int i2, x45 x45Var, int i3) {
        if ((i3 & 8) != 0) {
            int i4 = u99.b;
            x45Var = ox8.d;
        }
        s99Var.n(t99Var, i, i2, 0.0f, x45Var);
    }

    public static void s(s99 s99Var, t99 t99Var, long j) {
        int i = u99.b;
        ox8 ox8Var = ox8.d;
        s99Var.e(t99Var);
        t99Var.X(k46.d(j, t99Var.e), 0.0f, ox8Var);
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, f / b());
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
    public final float Z(float f) {
        return b() * f;
    }

    public float a(lr5 lr5Var) {
        return Float.NaN;
    }

    public abstract ip6 c();

    public abstract int d();

    /* JADX WARN: Multi-variable type inference failed */
    public final void e(t99 t99Var) {
        if (t99Var instanceof g48) {
            ((g48) t99Var).B(this.a);
        }
    }

    public final void g(t99 t99Var, int i, int i2, float f) {
        e(t99Var);
        t99Var.X(k46.d((((long) i2) & 4294967295L) | (((long) i) << 32), t99Var.e), f, null);
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    public final void n(t99 t99Var, int i, int i2, float f, x45 x45Var) {
        e(t99Var);
        t99Var.X(k46.d((((long) i2) & 4294967295L) | (((long) i) << 32), t99Var.e), f, x45Var);
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    public final void t(x45 x45Var) {
        this.a = true;
        x45Var.invoke(this);
        this.a = false;
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
