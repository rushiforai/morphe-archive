package f1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public abstract class n3 {

    /* renamed from: a, reason: collision with root package name */
    public static final p1.m0 f53798a = new p1.m0(new z1(2));

    /* renamed from: b, reason: collision with root package name */
    public static final o3 f53799b;

    /* renamed from: c, reason: collision with root package name */
    public static final o3 f53800c;

    /* renamed from: d, reason: collision with root package name */
    public static final k1.e f53801d;

    /* renamed from: e, reason: collision with root package name */
    public static final k1.e f53802e;

    /* renamed from: f, reason: collision with root package name */
    public static final k1.e f53803f;

    static {
        long j11 = i2.s.f61147m;
        f53799b = new o3(true, Float.NaN, j11);
        f53800c = new o3(false, Float.NaN, j11);
        f53801d = new k1.e(0.16f, 0.24f, 0.08f, 0.24f);
        f53802e = new k1.e(0.08f, 0.12f, 0.04f, 0.12f);
        f53803f = new k1.e(0.08f, 0.12f, 0.04f, 0.1f);
    }

    public static o3 a(float f11, int i5) {
        boolean z11 = (i5 & 1) != 0;
        if ((i5 & 2) != 0) {
            f11 = Float.NaN;
        }
        long j11 = i2.s.f61147m;
        return (y3.f.a(f11, Float.NaN) && ULong.a(j11, j11)) ? z11 ? f53799b : f53800c : new o3(z11, f11, j11);
    }
}
