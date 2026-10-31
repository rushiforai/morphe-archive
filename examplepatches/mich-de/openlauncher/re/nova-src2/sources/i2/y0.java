package i2;

/* loaded from: classes.dex */
public final class y0 {

    /* renamed from: b, reason: collision with root package name */
    public static final long f61191b = r0.f(0.5f, 0.5f);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f61192c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final long f61193a;

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static final float b(long j11) {
        return Float.intBitsToFloat((int) (j11 >> 32));
    }

    public static final float c(long j11) {
        return Float.intBitsToFloat((int) (j11 & 4294967295L));
    }

    public static String d(long j11) {
        return "TransformOrigin(packedValue=" + j11 + ')';
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y0) {
            return this.f61193a == ((y0) obj).f61193a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f61193a);
    }

    public final String toString() {
        return d(this.f61193a);
    }
}
