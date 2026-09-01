package j$.time.format;

import j$.time.ZoneId;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class t {
    public final TemporalAccessor a;
    public final DateTimeFormatter b;
    public int c;

    public t(TemporalAccessor temporalAccessor, DateTimeFormatter dateTimeFormatter) {
        j$.time.chrono.a aVar = dateTimeFormatter.e;
        if (aVar != null) {
            j$.time.chrono.a aVar2 = (j$.time.chrono.a) temporalAccessor.m(j$.time.temporal.o.b);
            ZoneId zoneId = (ZoneId) temporalAccessor.m(j$.time.temporal.o.a);
            j$.time.chrono.b bVarJ = null;
            aVar = Objects.equals(aVar, aVar2) ? null : aVar;
            Objects.equals(null, zoneId);
            if (aVar != null) {
                j$.time.chrono.a aVar3 = aVar != null ? aVar : aVar2;
                if (aVar != null) {
                    if (temporalAccessor.d(j$.time.temporal.a.EPOCH_DAY)) {
                        bVarJ = aVar3.j(temporalAccessor);
                    } else if (aVar != j$.time.chrono.s.c || aVar2 != null) {
                        for (j$.time.temporal.a aVar4 : j$.time.temporal.a.values()) {
                            if (aVar4.isDateBased() && temporalAccessor.d(aVar4)) {
                                throw new j$.time.c("Unable to apply override chronology '" + aVar + "' because the temporal object being formatted contains date fields but does not represent a whole date: " + temporalAccessor);
                            }
                        }
                    }
                }
                temporalAccessor = new s(bVarJ, temporalAccessor, aVar3, zoneId);
            }
        }
        this.a = temporalAccessor;
        this.b = dateTimeFormatter;
    }

    public final Long a(j$.time.temporal.n nVar) {
        int i = this.c;
        TemporalAccessor temporalAccessor = this.a;
        if (i <= 0 || temporalAccessor.d(nVar)) {
            return Long.valueOf(temporalAccessor.s(nVar));
        }
        return null;
    }

    public final String toString() {
        return this.a.toString();
    }
}
