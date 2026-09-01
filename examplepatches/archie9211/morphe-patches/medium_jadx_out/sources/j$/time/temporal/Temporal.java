package j$.time.temporal;

import j$.time.LocalDate;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface Temporal extends TemporalAccessor {
    Temporal b(long j, n nVar);

    Temporal c(long j, p pVar);

    long f(Temporal temporal, p pVar);

    /* JADX INFO: renamed from: i */
    Temporal p(LocalDate localDate);

    Temporal q(long j, ChronoUnit chronoUnit);
}
