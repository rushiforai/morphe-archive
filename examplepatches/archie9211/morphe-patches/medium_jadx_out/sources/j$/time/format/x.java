package j$.time.format;

import com.squareup.wire.internal.MathMethodsKt;
import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalTime;
import j$.time.Period;
import j$.time.ZoneId;
import j$.time.ZoneOffset;
import j$.time.temporal.TemporalAccessor;
import j$.util.Objects;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class x implements TemporalAccessor {
    public ZoneId b;
    public j$.time.chrono.a c;
    public boolean d;
    public y e;
    public j$.time.chrono.b f;
    public LocalTime g;
    public final Map a = new HashMap();
    public Period h = Period.d;

    public final void A() {
        if (((HashMap) this.a).containsKey(j$.time.temporal.a.INSTANT_SECONDS)) {
            ZoneId zoneId = this.b;
            if (zoneId != null) {
                B(zoneId);
                return;
            }
            Long l = (Long) ((HashMap) this.a).get(j$.time.temporal.a.OFFSET_SECONDS);
            if (l != null) {
                B(ZoneOffset.ofTotalSeconds(l.intValue()));
            }
        }
    }

    public final void B(ZoneId zoneId) {
        Map map = this.a;
        j$.time.temporal.a aVar = j$.time.temporal.a.INSTANT_SECONDS;
        F(this.c.N(Instant.A(((Long) ((HashMap) map).remove(aVar)).longValue(), 0), zoneId).e());
        G(aVar, j$.time.temporal.a.SECOND_OF_DAY, Long.valueOf(r5.toLocalTime().M()));
    }

    public final void C(long j, long j2, long j3, long j4) {
        if (this.e == y.LENIENT) {
            long jO = j$.time.a.O(j$.time.a.O(j$.time.a.O(j$.time.a.T(j, 3600000000000L), j$.time.a.T(j2, 60000000000L)), j$.time.a.T(j3, MathMethodsKt.NANOS_PER_SECOND)), j4);
            E(LocalTime.E(j$.time.a.R(jO, 86400000000000L)), Period.a(0, 0, (int) j$.time.a.S(jO, 86400000000000L)));
            return;
        }
        j$.time.temporal.a aVar = j$.time.temporal.a.MINUTE_OF_HOUR;
        int iA = aVar.b.a(j2, aVar);
        j$.time.temporal.a aVar2 = j$.time.temporal.a.NANO_OF_SECOND;
        int iA2 = aVar2.b.a(j4, aVar2);
        if (this.e == y.SMART && j == 24 && iA == 0 && j3 == 0 && iA2 == 0) {
            E(LocalTime.g, Period.a(0, 0, 1));
            return;
        }
        j$.time.temporal.a aVar3 = j$.time.temporal.a.HOUR_OF_DAY;
        int iA3 = aVar3.b.a(j, aVar3);
        j$.time.temporal.a aVar4 = j$.time.temporal.a.SECOND_OF_MINUTE;
        E(LocalTime.of(iA3, iA, aVar4.b.a(j3, aVar4), iA2), Period.d);
    }

    public final void D() {
        Map map = this.a;
        j$.time.temporal.a aVar = j$.time.temporal.a.CLOCK_HOUR_OF_DAY;
        if (((HashMap) map).containsKey(aVar)) {
            long jLongValue = ((Long) ((HashMap) this.a).remove(aVar)).longValue();
            y yVar = this.e;
            if (yVar == y.STRICT || (yVar == y.SMART && jLongValue != 0)) {
                aVar.s(jLongValue);
            }
            j$.time.temporal.a aVar2 = j$.time.temporal.a.HOUR_OF_DAY;
            if (jLongValue == 24) {
                jLongValue = 0;
            }
            G(aVar, aVar2, Long.valueOf(jLongValue));
        }
        Map map2 = this.a;
        j$.time.temporal.a aVar3 = j$.time.temporal.a.CLOCK_HOUR_OF_AMPM;
        if (((HashMap) map2).containsKey(aVar3)) {
            long jLongValue2 = ((Long) ((HashMap) this.a).remove(aVar3)).longValue();
            y yVar2 = this.e;
            if (yVar2 == y.STRICT || (yVar2 == y.SMART && jLongValue2 != 0)) {
                aVar3.s(jLongValue2);
            }
            G(aVar3, j$.time.temporal.a.HOUR_OF_AMPM, Long.valueOf(jLongValue2 != 12 ? jLongValue2 : 0L));
        }
        Map map3 = this.a;
        j$.time.temporal.a aVar4 = j$.time.temporal.a.AMPM_OF_DAY;
        if (((HashMap) map3).containsKey(aVar4)) {
            Map map4 = this.a;
            j$.time.temporal.a aVar5 = j$.time.temporal.a.HOUR_OF_AMPM;
            if (((HashMap) map4).containsKey(aVar5)) {
                long jLongValue3 = ((Long) ((HashMap) this.a).remove(aVar4)).longValue();
                long jLongValue4 = ((Long) ((HashMap) this.a).remove(aVar5)).longValue();
                if (this.e == y.LENIENT) {
                    G(aVar4, j$.time.temporal.a.HOUR_OF_DAY, Long.valueOf(j$.time.a.O(j$.time.a.T(jLongValue3, 12L), jLongValue4)));
                } else {
                    aVar4.s(jLongValue3);
                    aVar5.s(jLongValue3);
                    G(aVar4, j$.time.temporal.a.HOUR_OF_DAY, Long.valueOf((jLongValue3 * 12) + jLongValue4));
                }
            }
        }
        Map map5 = this.a;
        j$.time.temporal.a aVar6 = j$.time.temporal.a.NANO_OF_DAY;
        if (((HashMap) map5).containsKey(aVar6)) {
            long jLongValue5 = ((Long) ((HashMap) this.a).remove(aVar6)).longValue();
            if (this.e != y.LENIENT) {
                aVar6.s(jLongValue5);
            }
            G(aVar6, j$.time.temporal.a.HOUR_OF_DAY, Long.valueOf(jLongValue5 / 3600000000000L));
            G(aVar6, j$.time.temporal.a.MINUTE_OF_HOUR, Long.valueOf((jLongValue5 / 60000000000L) % 60));
            G(aVar6, j$.time.temporal.a.SECOND_OF_MINUTE, Long.valueOf((jLongValue5 / MathMethodsKt.NANOS_PER_SECOND) % 60));
            G(aVar6, j$.time.temporal.a.NANO_OF_SECOND, Long.valueOf(jLongValue5 % MathMethodsKt.NANOS_PER_SECOND));
        }
        Map map6 = this.a;
        j$.time.temporal.a aVar7 = j$.time.temporal.a.MICRO_OF_DAY;
        if (((HashMap) map6).containsKey(aVar7)) {
            long jLongValue6 = ((Long) ((HashMap) this.a).remove(aVar7)).longValue();
            if (this.e != y.LENIENT) {
                aVar7.s(jLongValue6);
            }
            G(aVar7, j$.time.temporal.a.SECOND_OF_DAY, Long.valueOf(jLongValue6 / 1000000));
            G(aVar7, j$.time.temporal.a.MICRO_OF_SECOND, Long.valueOf(jLongValue6 % 1000000));
        }
        Map map7 = this.a;
        j$.time.temporal.a aVar8 = j$.time.temporal.a.MILLI_OF_DAY;
        if (((HashMap) map7).containsKey(aVar8)) {
            long jLongValue7 = ((Long) ((HashMap) this.a).remove(aVar8)).longValue();
            if (this.e != y.LENIENT) {
                aVar8.s(jLongValue7);
            }
            G(aVar8, j$.time.temporal.a.SECOND_OF_DAY, Long.valueOf(jLongValue7 / 1000));
            G(aVar8, j$.time.temporal.a.MILLI_OF_SECOND, Long.valueOf(jLongValue7 % 1000));
        }
        Map map8 = this.a;
        j$.time.temporal.a aVar9 = j$.time.temporal.a.SECOND_OF_DAY;
        if (((HashMap) map8).containsKey(aVar9)) {
            long jLongValue8 = ((Long) ((HashMap) this.a).remove(aVar9)).longValue();
            if (this.e != y.LENIENT) {
                aVar9.s(jLongValue8);
            }
            G(aVar9, j$.time.temporal.a.HOUR_OF_DAY, Long.valueOf(jLongValue8 / 3600));
            G(aVar9, j$.time.temporal.a.MINUTE_OF_HOUR, Long.valueOf((jLongValue8 / 60) % 60));
            G(aVar9, j$.time.temporal.a.SECOND_OF_MINUTE, Long.valueOf(jLongValue8 % 60));
        }
        Map map9 = this.a;
        j$.time.temporal.a aVar10 = j$.time.temporal.a.MINUTE_OF_DAY;
        if (((HashMap) map9).containsKey(aVar10)) {
            long jLongValue9 = ((Long) ((HashMap) this.a).remove(aVar10)).longValue();
            if (this.e != y.LENIENT) {
                aVar10.s(jLongValue9);
            }
            G(aVar10, j$.time.temporal.a.HOUR_OF_DAY, Long.valueOf(jLongValue9 / 60));
            G(aVar10, j$.time.temporal.a.MINUTE_OF_HOUR, Long.valueOf(jLongValue9 % 60));
        }
        Map map10 = this.a;
        j$.time.temporal.a aVar11 = j$.time.temporal.a.NANO_OF_SECOND;
        if (((HashMap) map10).containsKey(aVar11)) {
            long jLongValue10 = ((Long) ((HashMap) this.a).get(aVar11)).longValue();
            y yVar3 = this.e;
            y yVar4 = y.LENIENT;
            if (yVar3 != yVar4) {
                aVar11.s(jLongValue10);
            }
            Map map11 = this.a;
            j$.time.temporal.a aVar12 = j$.time.temporal.a.MICRO_OF_SECOND;
            if (((HashMap) map11).containsKey(aVar12)) {
                long jLongValue11 = ((Long) ((HashMap) this.a).remove(aVar12)).longValue();
                if (this.e != yVar4) {
                    aVar12.s(jLongValue11);
                }
                jLongValue10 = (jLongValue10 % 1000) + (jLongValue11 * 1000);
                G(aVar12, aVar11, Long.valueOf(jLongValue10));
            }
            Map map12 = this.a;
            j$.time.temporal.a aVar13 = j$.time.temporal.a.MILLI_OF_SECOND;
            if (((HashMap) map12).containsKey(aVar13)) {
                long jLongValue12 = ((Long) ((HashMap) this.a).remove(aVar13)).longValue();
                if (this.e != yVar4) {
                    aVar13.s(jLongValue12);
                }
                G(aVar13, aVar11, Long.valueOf((jLongValue10 % 1000000) + (jLongValue12 * 1000000)));
            }
        }
        Map map13 = this.a;
        j$.time.temporal.a aVar14 = j$.time.temporal.a.HOUR_OF_DAY;
        if (((HashMap) map13).containsKey(aVar14)) {
            Map map14 = this.a;
            j$.time.temporal.a aVar15 = j$.time.temporal.a.MINUTE_OF_HOUR;
            if (((HashMap) map14).containsKey(aVar15)) {
                Map map15 = this.a;
                j$.time.temporal.a aVar16 = j$.time.temporal.a.SECOND_OF_MINUTE;
                if (((HashMap) map15).containsKey(aVar16) && ((HashMap) this.a).containsKey(aVar11)) {
                    C(((Long) ((HashMap) this.a).remove(aVar14)).longValue(), ((Long) ((HashMap) this.a).remove(aVar15)).longValue(), ((Long) ((HashMap) this.a).remove(aVar16)).longValue(), ((Long) ((HashMap) this.a).remove(aVar11)).longValue());
                }
            }
        }
    }

    public final void E(LocalTime localTime, Period period) {
        LocalTime localTime2 = this.g;
        if (localTime2 == null) {
            this.g = localTime;
            this.h = period;
            return;
        }
        if (!localTime2.equals(localTime)) {
            j$.time.h.g("Conflict found: Fields resolved to different times: ", this.g, " ", localTime);
            return;
        }
        Period period2 = this.h;
        Period period3 = Period.d;
        if (period2 == period3 || period == period3 || period2.equals(period)) {
            this.h = period;
        } else {
            j$.time.h.g("Conflict found: Fields resolved to different excess periods: ", this.h, " ", period);
        }
    }

    public final void F(j$.time.chrono.b bVar) {
        j$.time.chrono.b bVar2 = this.f;
        if (bVar2 != null) {
            if (bVar == null || bVar2.equals(bVar)) {
                return;
            }
            j$.time.h.g("Conflict found: Fields resolved to two different dates: ", this.f, " ", bVar);
            return;
        }
        if (bVar != null) {
            if (this.c.equals(bVar.a())) {
                this.f = bVar;
                return;
            }
            throw new j$.time.c("ChronoLocalDate must use the effective parsed chronology: " + this.c);
        }
    }

    public final void G(j$.time.temporal.n nVar, j$.time.temporal.a aVar, Long l) {
        Long l2 = (Long) ((HashMap) this.a).put(aVar, l);
        if (l2 == null || l2.longValue() == l.longValue()) {
            return;
        }
        throw new j$.time.c("Conflict found: " + aVar + " " + l2 + " differs from " + aVar + " " + l + " while resolving  " + nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        if (((HashMap) this.a).containsKey(nVar)) {
            return true;
        }
        j$.time.chrono.b bVar = this.f;
        if (bVar != null && bVar.d(nVar)) {
            return true;
        }
        LocalTime localTime = this.g;
        if (localTime == null || !localTime.d(nVar)) {
            return (nVar == null || (nVar instanceof j$.time.temporal.a) || !nVar.h(this)) ? false : true;
        }
        return true;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.a(this, nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.d(this, nVar);
    }

    public final void k(TemporalAccessor temporalAccessor) {
        Iterator it2 = ((HashMap) this.a).entrySet().iterator();
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            j$.time.temporal.n nVar = (j$.time.temporal.n) entry.getKey();
            if (temporalAccessor.d(nVar)) {
                try {
                    long jS = temporalAccessor.s(nVar);
                    long jLongValue = ((Long) entry.getValue()).longValue();
                    if (jS != jLongValue) {
                        throw new j$.time.c("Conflict found: Field " + nVar + " " + jS + " differs from " + nVar + " " + jLongValue + " derived from " + temporalAccessor);
                    }
                    it2.remove();
                } catch (RuntimeException unused) {
                    continue;
                }
            }
        }
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(a aVar) {
        if (aVar == j$.time.temporal.o.a) {
            return this.b;
        }
        if (aVar == j$.time.temporal.o.b) {
            return this.c;
        }
        if (aVar == j$.time.temporal.o.f) {
            j$.time.chrono.b bVar = this.f;
            if (bVar != null) {
                return LocalDate.C(bVar);
            }
            return null;
        }
        if (aVar == j$.time.temporal.o.g) {
            return this.g;
        }
        if (aVar == j$.time.temporal.o.d) {
            Long l = (Long) ((HashMap) this.a).get(j$.time.temporal.a.OFFSET_SECONDS);
            if (l != null) {
                return ZoneOffset.ofTotalSeconds(l.intValue());
            }
            ZoneId zoneId = this.b;
            return zoneId instanceof ZoneOffset ? zoneId : aVar.g(this);
        }
        if (aVar == j$.time.temporal.o.e) {
            return aVar.g(this);
        }
        if (aVar == j$.time.temporal.o.c) {
            return null;
        }
        return aVar.g(this);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        Objects.requireNonNull(nVar, "field");
        Long l = (Long) ((HashMap) this.a).get(nVar);
        if (l != null) {
            return l.longValue();
        }
        j$.time.chrono.b bVar = this.f;
        if (bVar != null && bVar.d(nVar)) {
            return this.f.s(nVar);
        }
        LocalTime localTime = this.g;
        if (localTime != null && localTime.d(nVar)) {
            return this.g.s(nVar);
        }
        if (nVar instanceof j$.time.temporal.a) {
            throw new j$.time.temporal.q(j$.time.d.a("Unsupported field: ", nVar));
        }
        return nVar.m(this);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(64);
        sb.append(this.a);
        sb.append(',');
        sb.append(this.c);
        if (this.b != null) {
            sb.append(',');
            sb.append(this.b);
        }
        if (this.f != null || this.g != null) {
            sb.append(" resolved to ");
            j$.time.chrono.b bVar = this.f;
            if (bVar != null) {
                sb.append(bVar);
                if (this.g != null) {
                    sb.append('T');
                    sb.append(this.g);
                }
            } else {
                sb.append(this.g);
            }
        }
        return sb.toString();
    }
}
