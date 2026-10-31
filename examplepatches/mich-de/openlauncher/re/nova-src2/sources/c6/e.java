package c6;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final long f19720a;

    /* renamed from: b, reason: collision with root package name */
    public final long f19721b;

    public e(long j11, long j12) {
        if (j12 == 0) {
            this.f19720a = 0L;
            this.f19721b = 1L;
        } else {
            this.f19720a = j11;
            this.f19721b = j12;
        }
    }

    public final String toString() {
        return this.f19720a + "/" + this.f19721b;
    }
}
