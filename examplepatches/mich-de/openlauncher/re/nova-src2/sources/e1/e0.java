package e1;

/* loaded from: classes2.dex */
public abstract class e0 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f51287a;

    /* renamed from: b, reason: collision with root package name */
    public static final float f51288b;

    /* renamed from: c, reason: collision with root package name */
    public static final j3.a0 f51289c = new j3.a0("SelectionHandleInfo");

    static {
        float f11 = 25;
        f51287a = f11;
        f51288b = f11;
    }

    public static final long a(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) - 1.0f;
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }
}
