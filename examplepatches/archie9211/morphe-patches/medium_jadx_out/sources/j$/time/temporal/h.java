package j$.time.temporal;

import j$.time.Duration;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public enum h implements p {
    WEEK_BASED_YEARS("WeekBasedYears"),
    QUARTER_YEARS("QuarterYears");

    public final String a;

    static {
        Duration.ofSeconds(31556952L);
        Duration.ofSeconds(7889238L);
    }

    h(String str) {
        this.a = str;
    }

    @Override // j$.time.temporal.p
    public final long between(Temporal temporal, Temporal temporal2) {
        if (temporal.getClass() != temporal2.getClass()) {
            return temporal.f(temporal2, this);
        }
        int i = b.a[ordinal()];
        if (i == 1) {
            g gVar = i.c;
            return j$.time.a.U(temporal2.s(gVar), temporal.s(gVar));
        }
        if (i == 2) {
            return temporal.f(temporal2, ChronoUnit.MONTHS) / 3;
        }
        throw new IllegalStateException("Unreachable");
    }

    @Override // j$.time.temporal.p
    public final Temporal h(Temporal temporal, long j) {
        int i = b.a[ordinal()];
        if (i == 1) {
            return temporal.b(j$.time.a.O(temporal.h(r4), j), i.c);
        }
        if (i == 2) {
            return temporal.c(j / 4, ChronoUnit.YEARS).c((j % 4) * 3, ChronoUnit.MONTHS);
        }
        throw new IllegalStateException("Unreachable");
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.a;
    }
}
