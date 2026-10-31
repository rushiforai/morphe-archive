package c0;

import kotlin.jvm.internal.FloatCompanionObject;
import p1.s2;

/* loaded from: classes.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final o f18776a = new o(Float.POSITIVE_INFINITY);

    /* renamed from: b, reason: collision with root package name */
    public static final p f18777b = new p(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);

    /* renamed from: c, reason: collision with root package name */
    public static final q f18778c = new q(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);

    /* renamed from: d, reason: collision with root package name */
    public static final r f18779d = new r(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);

    /* renamed from: e, reason: collision with root package name */
    public static final o f18780e = new o(Float.NEGATIVE_INFINITY);

    /* renamed from: f, reason: collision with root package name */
    public static final p f18781f = new p(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);

    /* renamed from: g, reason: collision with root package name */
    public static final q f18782g = new q(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);

    /* renamed from: h, reason: collision with root package name */
    public static final r f18783h = new r(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY);

    /* renamed from: i, reason: collision with root package name */
    public static final i2 f18784i = new i2(new b00.m(4), new b00.m(21));

    /* renamed from: j, reason: collision with root package name */
    public static final i2 f18785j = new i2(new b00.m(5), new b00.m(6));

    /* renamed from: k, reason: collision with root package name */
    public static final i2 f18786k = new i2(new b00.m(7), new b00.m(8));

    /* renamed from: l, reason: collision with root package name */
    public static final i2 f18787l = new i2(new b00.m(9), new b00.m(10));

    /* renamed from: m, reason: collision with root package name */
    public static final i2 f18788m = new i2(new b00.m(11), new b00.m(12));
    public static final i2 n = new i2(new b00.m(13), new b00.m(14));
    public static final i2 o = new i2(new b00.m(15), new b00.m(16));

    /* renamed from: p, reason: collision with root package name */
    public static final i2 f18789p = new i2(new b00.m(17), new b00.m(18));

    /* renamed from: q, reason: collision with root package name */
    public static final i2 f18790q = new i2(new b00.m(19), new b00.m(20));

    public static e a(float f11) {
        Float fValueOf = Float.valueOf(f11);
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        return new e(fValueOf, f18784i, Float.valueOf(0.01f), 8);
    }

    public static n b(int i5, float f11, float f12) {
        if ((i5 & 2) != 0) {
            f12 = 0.0f;
        }
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        return new n(f18784i, Float.valueOf(f11), new o(f12), Long.MIN_VALUE, Long.MIN_VALUE, false);
    }

    public static final float c(y yVar, float f11) {
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        return ((o) new tm.o(yVar.f19010a).j0(new o(0.0f), new o(f11))).f18891a;
    }

    public static final s d(s sVar) {
        s sVarC = sVar.c();
        int iB = sVarC.b();
        for (int i5 = 0; i5 < iB; i5++) {
            sVarC.e(sVar.a(i5), i5);
        }
        return sVarC;
    }

    public static n e(n nVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = ((Number) ((s2) nVar.f18878b).getValue()).floatValue();
        }
        if ((i5 & 2) != 0) {
            f12 = ((o) nVar.f18879c).f18891a;
        }
        return new n(nVar.f18877a, Float.valueOf(f11), new o(f12), nVar.f18880d, nVar.f18881e, nVar.f18882f);
    }

    public static i0 f(z zVar, x0 x0Var, int i5) {
        if ((i5 & 2) != 0) {
            x0Var = x0.f19005a;
        }
        return new i0(zVar, x0Var, 0);
    }

    public static j1 g() {
        return new j1(0);
    }

    public static l1 h(float f11, float f12, Object obj, int i5) {
        if ((i5 & 1) != 0) {
            f11 = 1.0f;
        }
        if ((i5 & 2) != 0) {
            f12 = 1500.0f;
        }
        if ((i5 & 4) != 0) {
            obj = null;
        }
        return new l1(f11, f12, obj);
    }

    public static h2 i(int i5, int i11, a0 a0Var, int i12) {
        if ((i12 & 1) != 0) {
            i5 = 300;
        }
        if ((i12 & 2) != 0) {
            i11 = 0;
        }
        if ((i12 & 4) != 0) {
            a0Var = b0.f18710a;
        }
        return new h2(i5, i11, a0Var);
    }
}
