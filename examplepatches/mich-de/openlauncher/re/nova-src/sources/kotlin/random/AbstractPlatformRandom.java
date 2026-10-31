package kotlin.random;

import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b \u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/random/AbstractPlatformRandom;", "Lkotlin/random/Random;", "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class AbstractPlatformRandom extends Random {
    @Override // kotlin.random.Random
    public final int a(int i5) {
        return RandomKt.h(k().nextInt(), i5);
    }

    @Override // kotlin.random.Random
    public final double b() {
        return k().nextDouble();
    }

    @Override // kotlin.random.Random
    public final int e() {
        return k().nextInt();
    }

    @Override // kotlin.random.Random
    public final int f(int i5) {
        return k().nextInt(i5);
    }

    @Override // kotlin.random.Random
    public final long h() {
        return k().nextLong();
    }

    public abstract java.util.Random k();
}
