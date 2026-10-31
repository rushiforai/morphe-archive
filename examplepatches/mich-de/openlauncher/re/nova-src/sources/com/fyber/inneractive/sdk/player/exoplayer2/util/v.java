package com.fyber.inneractive.sdk.player.exoplayer2.util;

/* loaded from: classes3.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public long f30485a;

    /* renamed from: b, reason: collision with root package name */
    public long f30486b;

    /* renamed from: c, reason: collision with root package name */
    public volatile long f30487c = -9223372036854775807L;

    public v(long j11) {
        c(j11);
    }

    public final long a(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        if (this.f30487c != -9223372036854775807L) {
            this.f30487c = j11;
        } else {
            long j12 = this.f30485a;
            if (j12 != Long.MAX_VALUE) {
                this.f30486b = j12 - j11;
            }
            synchronized (this) {
                this.f30487c = j11;
                notifyAll();
            }
        }
        return j11 + this.f30486b;
    }

    public final long b(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        if (this.f30487c != -9223372036854775807L) {
            long j12 = (this.f30487c * 90000) / 1000000;
            long j13 = (4294967296L + j12) / 8589934592L;
            long j14 = ((j13 - 1) * 8589934592L) + j11;
            j11 += j13 * 8589934592L;
            if (Math.abs(j14 - j12) < Math.abs(j11 - j12)) {
                j11 = j14;
            }
        }
        return a((j11 * 1000000) / 90000);
    }

    public final synchronized void c(long j11) {
        if (this.f30487c != -9223372036854775807L) {
            throw new IllegalStateException();
        }
        this.f30485a = j11;
    }
}
