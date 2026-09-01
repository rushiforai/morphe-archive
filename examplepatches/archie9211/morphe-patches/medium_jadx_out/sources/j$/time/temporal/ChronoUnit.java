package j$.time.temporal;

import j$.time.Duration;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public enum ChronoUnit implements p {
    NANOS("Nanos"),
    MICROS("Micros"),
    MILLIS("Millis"),
    SECONDS("Seconds"),
    MINUTES("Minutes"),
    HOURS("Hours"),
    HALF_DAYS("HalfDays"),
    DAYS("Days"),
    WEEKS("Weeks"),
    MONTHS("Months"),
    YEARS("Years"),
    DECADES("Decades"),
    CENTURIES("Centuries"),
    MILLENNIA("Millennia"),
    ERAS("Eras"),
    FOREVER("Forever");

    public final String a;

    static {
        Duration.j(1L);
        Duration.j(1000L);
        Duration.j(1000000L);
        Duration.ofSeconds(1L);
        Duration.ofSeconds(60L);
        Duration.ofSeconds(3600L);
        Duration.ofSeconds(43200L);
        Duration.ofSeconds(86400L);
        Duration.ofSeconds(604800L);
        Duration.ofSeconds(2629746L);
        Duration.ofSeconds(31556952L);
        Duration.ofSeconds(315569520L);
        Duration.ofSeconds(3155695200L);
        Duration.ofSeconds(31556952000L);
        Duration.ofSeconds(31556952000000000L);
        Duration.ofSeconds(Long.MAX_VALUE, 999999999L);
    }

    ChronoUnit(String str) {
        this.a = str;
    }

    @Override // j$.time.temporal.p
    public long between(Temporal temporal, Temporal temporal2) {
        return temporal.f(temporal2, this);
    }

    @Override // j$.time.temporal.p
    public final Temporal h(Temporal temporal, long j) {
        return temporal.c(j, this);
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.a;
    }
}
