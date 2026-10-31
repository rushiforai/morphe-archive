package l1;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes.dex */
public final class d1 {
    public final long A;
    public final long B;
    public final long C;
    public final long D;
    public final long E;
    public final long F;
    public final long G;
    public final long H;
    public final long I;
    public final long J;
    public m0 K;
    public m0 L;
    public m0 M;
    public m0 N;
    public s0 O;
    public m9 P;
    public m9 Q;
    public x0 R;
    public w2 S;
    public h3 T;
    public m5 U;
    public h6 V;
    public u7 W;
    public q8 X;
    public q8 Y;

    /* renamed from: a, reason: collision with root package name */
    public final long f73148a;

    /* renamed from: b, reason: collision with root package name */
    public final long f73149b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73150c;

    /* renamed from: d, reason: collision with root package name */
    public final long f73151d;

    /* renamed from: e, reason: collision with root package name */
    public final long f73152e;

    /* renamed from: f, reason: collision with root package name */
    public final long f73153f;

    /* renamed from: g, reason: collision with root package name */
    public final long f73154g;

    /* renamed from: h, reason: collision with root package name */
    public final long f73155h;

    /* renamed from: i, reason: collision with root package name */
    public final long f73156i;

    /* renamed from: j, reason: collision with root package name */
    public final long f73157j;

    /* renamed from: k, reason: collision with root package name */
    public final long f73158k;

    /* renamed from: l, reason: collision with root package name */
    public final long f73159l;

    /* renamed from: m, reason: collision with root package name */
    public final long f73160m;
    public final long n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f73161p;

    /* renamed from: q, reason: collision with root package name */
    public final long f73162q;

    /* renamed from: r, reason: collision with root package name */
    public final long f73163r;

    /* renamed from: s, reason: collision with root package name */
    public final long f73164s;

    /* renamed from: t, reason: collision with root package name */
    public final long f73165t;

    /* renamed from: u, reason: collision with root package name */
    public final long f73166u;

    /* renamed from: v, reason: collision with root package name */
    public final long f73167v;

    /* renamed from: w, reason: collision with root package name */
    public final long f73168w;

    /* renamed from: x, reason: collision with root package name */
    public final long f73169x;

    /* renamed from: y, reason: collision with root package name */
    public final long f73170y;

    /* renamed from: z, reason: collision with root package name */
    public final long f73171z;

    public d1(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22, long j23, long j24, long j25, long j26, long j27, long j28, long j29, long j31, long j32, long j33, long j34, long j35, long j36, long j37, long j38, long j39, long j40, long j41, long j42, long j43, long j44, long j45, long j46, long j47, long j48) {
        this.f73148a = j11;
        this.f73149b = j12;
        this.f73150c = j13;
        this.f73151d = j14;
        this.f73152e = j15;
        this.f73153f = j16;
        this.f73154g = j17;
        this.f73155h = j18;
        this.f73156i = j19;
        this.f73157j = j21;
        this.f73158k = j22;
        this.f73159l = j23;
        this.f73160m = j24;
        this.n = j25;
        this.o = j26;
        this.f73161p = j27;
        this.f73162q = j28;
        this.f73163r = j29;
        this.f73164s = j31;
        this.f73165t = j32;
        this.f73166u = j33;
        this.f73167v = j34;
        this.f73168w = j35;
        this.f73169x = j36;
        this.f73170y = j37;
        this.f73171z = j38;
        this.A = j39;
        this.B = j40;
        this.C = j41;
        this.D = j42;
        this.E = j43;
        this.F = j44;
        this.G = j45;
        this.H = j46;
        this.I = j47;
        this.J = j48;
    }

    public static d1 a(d1 d1Var, long j11, long j12, long j13, long j14, int i5) {
        long j15 = (i5 & 1) != 0 ? d1Var.f73148a : j11;
        long j16 = d1Var.f73149b;
        long j17 = d1Var.f73150c;
        long j18 = d1Var.f73151d;
        long j19 = (i5 & 16) != 0 ? d1Var.f73152e : j12;
        long j21 = d1Var.f73153f;
        long j22 = d1Var.f73154g;
        long j23 = d1Var.f73155h;
        long j24 = d1Var.f73156i;
        long j25 = d1Var.f73157j;
        long j26 = d1Var.f73158k;
        long j27 = d1Var.f73159l;
        long j28 = d1Var.f73160m;
        long j29 = d1Var.n;
        long j31 = d1Var.o;
        long j32 = (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? d1Var.f73161p : j13;
        long j33 = d1Var.f73162q;
        long j34 = d1Var.f73163r;
        long j35 = d1Var.f73164s;
        long j36 = d1Var.f73165t;
        long j37 = (i5 & 1048576) != 0 ? d1Var.f73166u : j14;
        long j38 = d1Var.f73167v;
        long j39 = d1Var.f73168w;
        long j40 = d1Var.f73169x;
        long j41 = d1Var.f73170y;
        long j42 = d1Var.f73171z;
        long j43 = d1Var.A;
        long j44 = d1Var.B;
        long j45 = d1Var.C;
        long j46 = d1Var.D;
        long j47 = d1Var.E;
        long j48 = d1Var.F;
        long j49 = d1Var.G;
        long j51 = d1Var.H;
        long j52 = d1Var.I;
        long j53 = d1Var.J;
        d1Var.getClass();
        return new d1(j15, j16, j17, j18, j19, j21, j22, j23, j24, j25, j26, j27, j28, j29, j31, j32, j33, j34, j35, j36, j37, j38, j39, j40, j41, j42, j43, j44, j45, j46, j47, j48, j49, j51, j52, j53);
    }

    public final long b() {
        return this.f73162q;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ColorScheme(primary=");
        com.google.android.gms.internal.measurement.k2.v(this.f73148a, "onPrimary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73149b, "primaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73150c, "onPrimaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73151d, "inversePrimary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73152e, "secondary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73153f, "onSecondary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73154g, "secondaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73155h, "onSecondaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73156i, "tertiary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73157j, "onTertiary=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73158k, "tertiaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73159l, "onTertiaryContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73160m, "background=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.n, "onBackground=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.o, "surface=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73161p, "onSurface=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73162q, "surfaceVariant=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73163r, "onSurfaceVariant=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73164s, "surfaceTint=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73165t, "inverseSurface=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73166u, "inverseOnSurface=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73167v, "error=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73168w, "onError=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73169x, "errorContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73170y, "onErrorContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.f73171z, "outline=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.A, "outlineVariant=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.B, "scrim=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.C, "surfaceBright=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.D, "surfaceDim=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.E, "surfaceContainer=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.F, "surfaceContainerHigh=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.G, "surfaceContainerHighest=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.H, "surfaceContainerLow=", sb2);
        com.google.android.gms.internal.measurement.k2.v(this.I, "surfaceContainerLowest=", sb2);
        sb2.append((Object) i2.s.h(this.J));
        sb2.append(')');
        return sb2.toString();
    }
}
