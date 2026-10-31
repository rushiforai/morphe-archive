package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;

/* loaded from: classes2.dex */
public final class b00 {

    /* renamed from: a, reason: collision with root package name */
    public final b.m6 f1206a;

    /* renamed from: b, reason: collision with root package name */
    public long f1207b;

    public b00(b.m6 randomGenerator) {
        Intrinsics.g(randomGenerator, "randomGenerator");
        this.f1206a = randomGenerator;
        this.f1207b = -1L;
    }

    public final String a() {
        String strValueOf;
        synchronized (this) {
            try {
                this.f1206a.getClass();
                Random.f71890a.getClass();
                long jI = Random.f71891b.i(0L, 10000000000000000L);
                while (jI == this.f1207b) {
                    this.f1206a.getClass();
                    Random.f71890a.getClass();
                    jI = Random.f71891b.i(0L, 10000000000000000L);
                }
                this.f1207b = jI;
                strValueOf = String.valueOf(jI);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return strValueOf;
    }
}
