package defpackage;

import j$.util.concurrent.ThreadLocalRandom;
import java.util.Random;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cb9 extends z1 {
    @Override // defpackage.msa
    public final int c(int i, int i2) {
        return ThreadLocalRandom.current().nextInt(0, i2);
    }

    @Override // defpackage.msa
    public final long e(long j, long j2) {
        return ThreadLocalRandom.current().nextLong(j, j2);
    }

    @Override // defpackage.z1
    public final Random f() {
        ThreadLocalRandom threadLocalRandomCurrent = ThreadLocalRandom.current();
        threadLocalRandomCurrent.getClass();
        return threadLocalRandomCurrent;
    }
}
