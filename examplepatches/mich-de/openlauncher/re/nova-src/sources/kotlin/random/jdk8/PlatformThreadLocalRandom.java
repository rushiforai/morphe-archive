package kotlin.random.jdk8;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.AbstractPlatformRandom;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/random/jdk8/PlatformThreadLocalRandom;", "Lkotlin/random/AbstractPlatformRandom;", "<init>", "()V", "kotlin-stdlib-jdk8"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PlatformThreadLocalRandom extends AbstractPlatformRandom {
    @Override // kotlin.random.Random
    public final double d() {
        return ThreadLocalRandom.current().nextDouble(1.0d);
    }

    @Override // kotlin.random.Random
    public final int g(int i5, int i11) {
        return ThreadLocalRandom.current().nextInt(i5, i11);
    }

    @Override // kotlin.random.Random
    public final long i(long j11, long j12) {
        return ThreadLocalRandom.current().nextLong(j11, j12);
    }

    @Override // kotlin.random.Random
    public final long j() {
        return ThreadLocalRandom.current().nextLong(1000L);
    }

    @Override // kotlin.random.AbstractPlatformRandom
    public final Random k() {
        ThreadLocalRandom threadLocalRandomCurrent = ThreadLocalRandom.current();
        Intrinsics.f(threadLocalRandomCurrent, "current(...)");
        return threadLocalRandomCurrent;
    }
}
