package d1;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final long f48732a = a(Float.NaN, Float.NaN);

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f48733b = 0;

    public static long a(float f11, float f12) {
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public static String b(long j11) {
        return "InlineDensity(density=" + Float.intBitsToFloat((int) (j11 >> 32)) + ", fontScale=" + Float.intBitsToFloat((int) (j11 & 4294967295L)) + ')';
    }
}
