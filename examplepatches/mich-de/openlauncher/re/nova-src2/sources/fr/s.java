package fr;

import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final class s implements n0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f55699a = DurationKt.h(2, DurationUnit.f72046e);

    @Override // fr.n0
    public final long a(int i5) {
        int iE0 = 4 - kotlin.ranges.a.e0(i5, 1, 3);
        DurationUnit durationUnit = DurationUnit.f72046e;
        return DurationKt.f(Math.pow(Duration.p(this.f55699a, durationUnit), iE0), durationUnit);
    }
}
