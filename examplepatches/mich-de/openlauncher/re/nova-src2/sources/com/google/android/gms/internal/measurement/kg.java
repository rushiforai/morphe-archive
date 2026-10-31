package com.google.android.gms.internal.measurement;

import android.os.StrictMode;
import java.security.SecureRandom;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
public final class kg {

    /* renamed from: c, reason: collision with root package name */
    public static final kg f32741c;

    /* renamed from: a, reason: collision with root package name */
    public final UUID f32742a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicLong f32743b;

    static {
        StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            f32741c = new kg(UUID.randomUUID(), new SecureRandom().nextLong());
        } finally {
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
        }
    }

    public kg(UUID uuid, long j11) {
        this.f32742a = uuid;
        this.f32743b = new AtomicLong((j11 ^ 25214903917L) & 281474976710655L);
    }

    public final long a() {
        AtomicLong atomicLong;
        long j11;
        do {
            atomicLong = this.f32743b;
            j11 = atomicLong.get();
        } while (!atomicLong.compareAndSet(j11, ((25214903917L * (((j11 * 25214903917L) + 11) & 281474976710655L)) + 11) & 281474976710655L));
        return (((int) (r5 >>> 16)) << 32) + ((int) (r3 >>> 16));
    }

    public final UUID b() {
        long jA = a() & (-61441);
        long jA2 = a() >>> 2;
        UUID uuid = this.f32742a;
        return new UUID(jA ^ uuid.getMostSignificantBits(), jA2 ^ uuid.getLeastSignificantBits());
    }
}
