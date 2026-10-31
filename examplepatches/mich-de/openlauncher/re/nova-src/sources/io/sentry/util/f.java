package io.sentry.util;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes4.dex */
public final class f implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicLong f67830b = new AtomicLong(8682522807148012L);

    /* renamed from: a, reason: collision with root package name */
    public final AtomicLong f67831a;

    public f() {
        AtomicLong atomicLong;
        long j11;
        long j12;
        do {
            atomicLong = f67830b;
            j11 = atomicLong.get();
            j12 = 1181783497276652981L * j11;
        } while (!atomicLong.compareAndSet(j11, j12));
        this.f67831a = new AtomicLong(((System.nanoTime() ^ j12) ^ 25214903917L) & 281474976710655L);
    }

    public final int a(int i5) {
        AtomicLong atomicLong;
        long j11;
        long j12;
        do {
            atomicLong = this.f67831a;
            j11 = atomicLong.get();
            j12 = ((25214903917L * j11) + 11) & 281474976710655L;
        } while (!atomicLong.compareAndSet(j11, j12));
        return (int) (j12 >>> (48 - i5));
    }

    public final double b() {
        return ((a(26) << 27) + a(27)) * 1.1102230246251565E-16d;
    }
}
