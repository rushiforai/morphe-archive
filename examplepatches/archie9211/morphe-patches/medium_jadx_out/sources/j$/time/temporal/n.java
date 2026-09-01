package j$.time.temporal;

import j$.time.format.x;
import j$.time.format.y;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public interface n {
    boolean h(TemporalAccessor temporalAccessor);

    r i(TemporalAccessor temporalAccessor);

    boolean isDateBased();

    TemporalAccessor j(Map map, x xVar, y yVar);

    r k();

    long m(TemporalAccessor temporalAccessor);

    Temporal q(Temporal temporal, long j);
}
