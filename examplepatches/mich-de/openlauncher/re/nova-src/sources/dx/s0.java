package dx;

/* loaded from: classes4.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public static final s0 f49791a = new s0();

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof s0);
    }

    public final int hashCode() {
        return Long.hashCode(60000L) + b.c0.d(Integer.hashCode(3) * 31, 31, 5000L);
    }

    public final String toString() {
        return "RetryPolicy(maxAttempts=3, baseDelayMs=5000, maxDelayMs=60000)";
    }
}
