package j$.time.chrono;

import j$.time.LocalTime;
import j$.time.ZoneId;
import j$.time.temporal.Temporal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface e extends Temporal, j$.time.temporal.l, Comparable {
    a a();

    b e();

    j r(ZoneId zoneId);

    LocalTime toLocalTime();

    /* JADX INFO: renamed from: w */
    int compareTo(e eVar);
}
