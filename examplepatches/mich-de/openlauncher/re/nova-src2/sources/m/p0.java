package m;

/* loaded from: classes2.dex */
public final class p0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f75322a;

    /* renamed from: b, reason: collision with root package name */
    public long f75323b;

    public long a() {
        if (this.f75322a) {
            return Long.MAX_VALUE;
        }
        return Math.max(0L, this.f75323b - System.nanoTime());
    }

    public boolean b() {
        return this.f75322a;
    }

    public void c(boolean z11) {
        this.f75322a = z11;
    }

    public void d(long j11) {
        this.f75323b = j11;
    }
}
