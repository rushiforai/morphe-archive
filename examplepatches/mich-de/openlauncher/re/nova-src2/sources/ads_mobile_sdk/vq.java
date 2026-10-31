package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public abstract class vq {

    /* renamed from: a, reason: collision with root package name */
    public final o2 f10860a;

    /* renamed from: b, reason: collision with root package name */
    public final long f10861b;

    public vq(o2 clock, long j11) {
        Intrinsics.g(clock, "clock");
        this.f10860a = clock;
        this.f10861b = j11;
    }

    public final boolean a() {
        Duration.Companion companion = Duration.f72038b;
        this.f10860a.getClass();
        return Duration.c(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), this.f10861b) >= 0;
    }
}
