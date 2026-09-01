package j$.time.chrono;

import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.temporal.Temporal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface j extends Temporal, Comparable {
    a a();

    b e();

    j g(ZoneId zoneId);

    ZoneOffset getOffset();

    ZoneId getZone();

    e l();

    j o(ZoneId zoneId);

    LocalTime toLocalTime();

    long z();
}
