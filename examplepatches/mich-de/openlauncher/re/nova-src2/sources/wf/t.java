package wf;

/* loaded from: classes3.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public long f94371a;

    /* renamed from: b, reason: collision with root package name */
    public long f94372b;

    /* renamed from: c, reason: collision with root package name */
    public long f94373c;

    /* renamed from: d, reason: collision with root package name */
    public final ThreadLocal f94374d = new ThreadLocal();

    public t(long j11) {
        d(j11);
    }

    public final synchronized long a(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        try {
            if (this.f94372b == -9223372036854775807L) {
                long jLongValue = this.f94371a;
                if (jLongValue == 9223372036854775806L) {
                    Long l9 = (Long) this.f94374d.get();
                    l9.getClass();
                    jLongValue = l9.longValue();
                }
                this.f94372b = jLongValue - j11;
                notifyAll();
            }
            this.f94373c = j11;
            return j11 + this.f94372b;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized long b(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        try {
            long j12 = this.f94373c;
            if (j12 != -9223372036854775807L) {
                long j13 = (j12 * 90000) / 1000000;
                long j14 = (4294967296L + j13) / 8589934592L;
                long j15 = ((j14 - 1) * 8589934592L) + j11;
                long j16 = (j14 * 8589934592L) + j11;
                j11 = Math.abs(j15 - j13) < Math.abs(j16 - j13) ? j15 : j16;
            }
            return a((j11 * 1000000) / 90000);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized long c() {
        long j11;
        j11 = this.f94371a;
        if (j11 == Long.MAX_VALUE || j11 == 9223372036854775806L) {
            j11 = -9223372036854775807L;
        }
        return j11;
    }

    public final synchronized void d(long j11) {
        this.f94371a = j11;
        this.f94372b = j11 == Long.MAX_VALUE ? 0L : -9223372036854775807L;
        this.f94373c = -9223372036854775807L;
    }
}
