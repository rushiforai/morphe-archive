package j$.time.chrono;

import j$.time.LocalTime;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAmount;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface b extends Temporal, j$.time.temporal.l, Comparable {
    a a();

    @Override // j$.time.temporal.Temporal
    b b(long j, j$.time.temporal.n nVar);

    @Override // j$.time.temporal.Temporal
    b c(long j, j$.time.temporal.p pVar);

    @Override // j$.time.temporal.TemporalAccessor
    boolean d(j$.time.temporal.n nVar);

    boolean equals(Object obj);

    @Override // j$.time.temporal.Temporal
    long f(Temporal temporal, j$.time.temporal.p pVar);

    int hashCode();

    b n(long j, j$.time.temporal.p pVar);

    b p(j$.time.temporal.l lVar);

    long t();

    String toString();

    e u(LocalTime localTime);

    m v();

    b x(TemporalAmount temporalAmount);

    /* JADX INFO: renamed from: y */
    int compareTo(b bVar);
}
