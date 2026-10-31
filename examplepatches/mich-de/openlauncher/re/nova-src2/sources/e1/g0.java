package e1;

import c0.i2;
import c0.l1;
import e0.z1;

/* loaded from: classes2.dex */
public abstract class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final c0.p f51300a = new c0.p(Float.NaN, Float.NaN);

    /* renamed from: b, reason: collision with root package name */
    public static final i2 f51301b = new i2(new z1(8), new z1(9));

    /* renamed from: c, reason: collision with root package name */
    public static final long f51302c;

    /* renamed from: d, reason: collision with root package name */
    public static final l1 f51303d;

    static {
        long jFloatToRawIntBits = (Float.floatToRawIntBits(0.01f) << 32) | (Float.floatToRawIntBits(0.01f) & 4294967295L);
        f51302c = jFloatToRawIntBits;
        f51303d = new l1(0.0f, 3, (Object) new h2.b(jFloatToRawIntBits));
    }
}
