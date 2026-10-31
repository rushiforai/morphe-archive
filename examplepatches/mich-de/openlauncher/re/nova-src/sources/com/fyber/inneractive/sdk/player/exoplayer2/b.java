package com.fyber.inneractive.sdk.player.exoplayer2;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.UUID;

/* loaded from: classes3.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final int f29095a;

    /* renamed from: b, reason: collision with root package name */
    public static final UUID f29096b;

    static {
        f29095a = z.f30489a < 23 ? 1020 : 6396;
        f29096b = new UUID(0L, 0L);
        new UUID(1186680826959645954L, -5988876978535335093L);
        new UUID(-1301668207276963122L, -6645017420763422227L);
        new UUID(-7348484286925749626L, -6083546864340672619L);
    }

    public static long a(long j11) {
        if (j11 == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        return j11 / 1000;
    }
}
