package kotlin.random;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.internal.PlatformImplementationsKt;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.random.jdk8.PlatformThreadLocalRandom;
import l70.a;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b'\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lkotlin/random/Random;", b.f42142b, "<init>", "()V", "Default", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class Random {

    /* renamed from: a, reason: collision with root package name */
    public static final Default f71890a = new Default(0);

    /* renamed from: b, reason: collision with root package name */
    public static final AbstractPlatformRandom f71891b;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u00012\u00060\u0002j\u0002`\u0003B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0014\u0010\u0006\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lkotlin/random/Random$Default;", "Lkotlin/random/Random;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "<init>", "()V", "defaultRandom", "Lkotlin/random/Random;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Default extends Random implements Serializable {
        public /* synthetic */ Default(int i5) {
            this();
        }

        @Override // kotlin.random.Random
        public final int a(int i5) {
            return Random.f71891b.a(i5);
        }

        @Override // kotlin.random.Random
        public final double b() {
            return Random.f71891b.b();
        }

        @Override // kotlin.random.Random
        public final double c(double d5) {
            return Random.f71891b.c(1.0d);
        }

        @Override // kotlin.random.Random
        public final double d() {
            throw null;
        }

        @Override // kotlin.random.Random
        public final int e() {
            return Random.f71891b.e();
        }

        @Override // kotlin.random.Random
        public final int f(int i5) {
            return Random.f71891b.f(i5);
        }

        @Override // kotlin.random.Random
        public final int g(int i5, int i11) {
            return Random.f71891b.g(i5, i11);
        }

        @Override // kotlin.random.Random
        public final long h() {
            return Random.f71891b.h();
        }

        @Override // kotlin.random.Random
        public final long i(long j11, long j12) {
            return Random.f71891b.i(0L, 1000L);
        }

        @Override // kotlin.random.Random
        public final long j() {
            throw null;
        }

        private Default() {
        }
    }

    static {
        PlatformImplementationsKt.f71823a.getClass();
        Integer num = a.f74780a;
        f71891b = (num == null || num.intValue() >= 34) ? new PlatformThreadLocalRandom() : new FallbackThreadLocalRandom();
    }

    public abstract int a(int i5);

    public double b() {
        return PlatformRandomKt.a(a(26), a(27));
    }

    public double c(double d5) {
        double dB;
        RandomKt.c(d5);
        double d11 = d5 - 0.0d;
        if (!Double.isInfinite(d11) || Double.isInfinite(0.0d) || Double.isNaN(0.0d) || Double.isInfinite(d5) || Double.isNaN(d5)) {
            dB = 0.0d + (b() * d11);
        } else {
            double d12 = 2;
            double dB2 = ((d5 / d12) - (0.0d / d12)) * b();
            dB = 0.0d + dB2 + dB2;
        }
        return dB >= d5 ? Math.nextAfter(d5, Double.NEGATIVE_INFINITY) : dB;
    }

    public double d() {
        return c(1.0d);
    }

    public int e() {
        return a(32);
    }

    public int f(int i5) {
        return g(0, i5);
    }

    public int g(int i5, int i11) {
        int iE;
        int i12;
        int iA;
        RandomKt.d(i5, i11);
        int i13 = i11 - i5;
        if (i13 > 0 || i13 == Integer.MIN_VALUE) {
            if (((-i13) & i13) == i13) {
                iA = a(RandomKt.f(i13));
            } else {
                do {
                    iE = e() >>> 1;
                    i12 = iE % i13;
                } while ((i13 - 1) + (iE - i12) < 0);
                iA = i12;
            }
            return i5 + iA;
        }
        while (true) {
            int iE2 = e();
            if (i5 <= iE2 && iE2 < i11) {
                return iE2;
            }
        }
    }

    public long h() {
        return (e() << 32) + e();
    }

    public long i(long j11, long j12) {
        long jH;
        long j13;
        long jA;
        int iE;
        RandomKt.e(j11, j12);
        long j14 = j12 - j11;
        if (j14 > 0) {
            if (((-j14) & j14) == j14) {
                int i5 = (int) j14;
                int i11 = (int) (j14 >>> 32);
                if (i5 != 0) {
                    iE = a(RandomKt.f(i5));
                } else if (i11 == 1) {
                    iE = e();
                } else {
                    jA = (a(RandomKt.f(i11)) << 32) + (e() & 4294967295L);
                }
                jA = iE & 4294967295L;
            } else {
                do {
                    jH = h() >>> 1;
                    j13 = jH % j14;
                } while ((j14 - 1) + (jH - j13) < 0);
                jA = j13;
            }
            return j11 + jA;
        }
        while (true) {
            long jH2 = h();
            if (j11 <= jH2 && jH2 < j12) {
                return jH2;
            }
        }
    }

    public long j() {
        return i(0L, 1000L);
    }
}
