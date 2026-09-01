package j$.time.format;

import j$.time.ZoneId;
import j$.time.temporal.TemporalAccessor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s implements TemporalAccessor {
    public final /* synthetic */ j$.time.chrono.b a;
    public final /* synthetic */ TemporalAccessor b;
    public final /* synthetic */ j$.time.chrono.a c;
    public final /* synthetic */ ZoneId d;

    public s(j$.time.chrono.b bVar, TemporalAccessor temporalAccessor, j$.time.chrono.a aVar, ZoneId zoneId) {
        this.a = bVar;
        this.b = temporalAccessor;
        this.c = aVar;
        this.d = zoneId;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        j$.time.chrono.b bVar = this.a;
        return (bVar == null || !nVar.isDateBased()) ? this.b.d(nVar) : bVar.d(nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.a(this, nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        j$.time.chrono.b bVar = this.a;
        return (bVar == null || !nVar.isDateBased()) ? this.b.j(nVar) : bVar.j(nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(a aVar) {
        return aVar == j$.time.temporal.o.b ? this.c : aVar == j$.time.temporal.o.a ? this.d : aVar == j$.time.temporal.o.c ? this.b.m(aVar) : aVar.g(this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        j$.time.chrono.b bVar = this.a;
        return (bVar == null || !nVar.isDateBased()) ? this.b.s(nVar) : bVar.s(nVar);
    }

    public final String toString() {
        String str;
        String str2 = "";
        j$.time.chrono.a aVar = this.c;
        if (aVar != null) {
            str = " with chronology " + aVar;
        } else {
            str = "";
        }
        ZoneId zoneId = this.d;
        if (zoneId != null) {
            str2 = " with zone " + zoneId;
        }
        return this.b + str + str2;
    }
}
