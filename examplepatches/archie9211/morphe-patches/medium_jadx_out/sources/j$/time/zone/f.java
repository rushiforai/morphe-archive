package j$.time.zone;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import j$.time.Instant;
import j$.time.LocalDate;
import j$.time.LocalDateTime;
import j$.time.LocalTime;
import j$.time.ZoneOffset;
import j$.time.chrono.s;
import j$.time.l;
import j$.time.temporal.m;
import j$.util.Objects;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.TimeZone;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class f implements Serializable {
    public static final long[] i = new long[0];
    public static final e[] j = new e[0];
    public static final LocalDateTime[] k = new LocalDateTime[0];
    public static final b[] l = new b[0];
    private static final long serialVersionUID = 3044319355680032515L;
    public final long[] a;
    public final ZoneOffset[] b;
    public final long[] c;
    public final LocalDateTime[] d;
    public final ZoneOffset[] e;
    public final e[] f;
    public final TimeZone g;
    public final transient ConcurrentHashMap h = new ConcurrentHashMap();

    public f(long[] jArr, ZoneOffset[] zoneOffsetArr, long[] jArr2, ZoneOffset[] zoneOffsetArr2, e[] eVarArr) {
        this.a = jArr;
        this.b = zoneOffsetArr;
        this.c = jArr2;
        this.e = zoneOffsetArr2;
        this.f = eVarArr;
        if (jArr2.length == 0) {
            this.d = k;
        } else {
            ArrayList arrayList = new ArrayList();
            int i2 = 0;
            while (i2 < jArr2.length) {
                ZoneOffset zoneOffset = zoneOffsetArr2[i2];
                int i3 = i2 + 1;
                ZoneOffset zoneOffset2 = zoneOffsetArr2[i3];
                LocalDateTime localDateTimeD = LocalDateTime.D(jArr2[i2], 0, zoneOffset);
                if (zoneOffset2.getTotalSeconds() > zoneOffset.getTotalSeconds()) {
                    arrayList.add(localDateTimeD);
                    arrayList.add(localDateTimeD.F(zoneOffset2.getTotalSeconds() - zoneOffset.getTotalSeconds()));
                } else {
                    arrayList.add(localDateTimeD.F(zoneOffset2.getTotalSeconds() - zoneOffset.getTotalSeconds()));
                    arrayList.add(localDateTimeD);
                }
                i2 = i3;
            }
            this.d = (LocalDateTime[]) arrayList.toArray(new LocalDateTime[arrayList.size()]);
        }
        this.g = null;
    }

    public static Object a(LocalDateTime localDateTime, b bVar) {
        LocalDateTime localDateTime2 = bVar.b;
        if (bVar.d.getTotalSeconds() > bVar.c.getTotalSeconds()) {
            if (localDateTime.C(localDateTime2)) {
                return bVar.c;
            }
            if (!localDateTime.C(bVar.b.F(bVar.d.getTotalSeconds() - bVar.c.getTotalSeconds()))) {
                return bVar.d;
            }
        } else {
            if (!localDateTime.C(localDateTime2)) {
                return bVar.d;
            }
            if (localDateTime.C(bVar.b.F(bVar.d.getTotalSeconds() - bVar.c.getTotalSeconds()))) {
                return bVar.c;
            }
        }
        return bVar;
    }

    public static int c(long j2, ZoneOffset zoneOffset) {
        return LocalDate.M(j$.time.a.S(j2 + ((long) zoneOffset.getTotalSeconds()), 86400L)).getYear();
    }

    public static ZoneOffset g(int i2) {
        return ZoneOffset.ofTotalSeconds(i2 / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
    }

    private void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization via serialization delegate");
    }

    private Object writeReplace() {
        return new a(this.g != null ? (byte) 100 : (byte) 1, this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final b[] b(int i2) {
        LocalDate localDateB;
        b[] bVarArr = l;
        Integer numValueOf = Integer.valueOf(i2);
        b[] bVarArr2 = (b[]) this.h.get(numValueOf);
        if (bVarArr2 != null) {
            return bVarArr2;
        }
        long j2 = 1;
        int i3 = 0;
        int i4 = 1;
        if (this.g != null) {
            if (i2 < 1800) {
                return bVarArr;
            }
            LocalDateTime localDateTime = LocalDateTime.c;
            LocalDate localDateOf = LocalDate.of(i2 - 1, 12, 31);
            j$.time.temporal.a.HOUR_OF_DAY.s(0L);
            long jZ = j$.time.a.z(new LocalDateTime(localDateOf, LocalTime.h[0]), this.b[0]);
            long j3 = 1000;
            int offset = this.g.getOffset(jZ * 1000);
            long j4 = 31968000 + jZ;
            while (jZ < j4) {
                long j5 = jZ + 7776000;
                long j6 = j3;
                if (offset != this.g.getOffset(j5 * j6)) {
                    while (j5 - jZ > j2) {
                        long jS = j$.time.a.S(j5 + jZ, 2L);
                        if (this.g.getOffset(jS * j6) == offset) {
                            jZ = jS;
                        } else {
                            j5 = jS;
                        }
                        j2 = 1;
                    }
                    if (this.g.getOffset(jZ * j6) == offset) {
                        jZ = j5;
                    }
                    ZoneOffset zoneOffsetG = g(offset);
                    int offset2 = this.g.getOffset(jZ * j6);
                    ZoneOffset zoneOffsetG2 = g(offset2);
                    if (c(jZ, zoneOffsetG2) == i2) {
                        bVarArr = (b[]) Arrays.copyOf(bVarArr, bVarArr.length + 1);
                        bVarArr[bVarArr.length - 1] = new b(jZ, zoneOffsetG, zoneOffsetG2);
                    }
                    offset = offset2;
                } else {
                    jZ = j5;
                }
                j3 = j6;
                j2 = 1;
            }
            if (1916 <= i2 && i2 < 2100) {
                this.h.putIfAbsent(numValueOf, bVarArr);
            }
            return bVarArr;
        }
        e[] eVarArr = this.f;
        b[] bVarArr3 = new b[eVarArr.length];
        int i5 = 0;
        while (i5 < eVarArr.length) {
            e eVar = eVarArr[i5];
            byte b = eVar.b;
            l lVar = eVar.a;
            if (b < 0) {
                long j7 = i2;
                s.c.getClass();
                int iB = lVar.B(s.P(j7)) + 1 + eVar.b;
                LocalDate localDate = LocalDate.d;
                j$.time.temporal.a.YEAR.s(j7);
                Objects.requireNonNull(lVar, "month");
                j$.time.temporal.a.DAY_OF_MONTH.s(iB);
                localDateB = LocalDate.B(i2, lVar.getValue(), iB);
                j$.time.e eVar2 = eVar.c;
                if (eVar2 != null) {
                    localDateB = localDateB.i(new m(eVar2.getValue(), i4));
                }
            } else {
                LocalDate localDate2 = LocalDate.d;
                j$.time.temporal.a.YEAR.s(i2);
                Objects.requireNonNull(lVar, "month");
                j$.time.temporal.a.DAY_OF_MONTH.s(b);
                localDateB = LocalDate.B(i2, lVar.getValue(), b);
                j$.time.e eVar3 = eVar.c;
                if (eVar3 != null) {
                    localDateB = localDateB.i(new m(eVar3.getValue(), i3));
                }
            }
            if (eVar.e) {
                localDateB = localDateB.P(1L);
            }
            LocalDateTime localDateTimeOf = LocalDateTime.of(localDateB, eVar.d);
            d dVar = eVar.f;
            ZoneOffset zoneOffset = eVar.g;
            ZoneOffset zoneOffset2 = eVar.h;
            dVar.getClass();
            int i6 = c.a[dVar.ordinal()];
            if (i6 == 1) {
                localDateTimeOf = localDateTimeOf.F(zoneOffset2.getTotalSeconds() - ZoneOffset.UTC.getTotalSeconds());
            } else if (i6 == 2) {
                localDateTimeOf = localDateTimeOf.F(zoneOffset2.getTotalSeconds() - zoneOffset.getTotalSeconds());
            }
            bVarArr3[i5] = new b(localDateTimeOf, eVar.h, eVar.i);
            i5++;
            i3 = 0;
        }
        if (i2 < 2100) {
            this.h.putIfAbsent(numValueOf, bVarArr3);
        }
        return bVarArr3;
    }

    public final ZoneOffset d(Instant instant) {
        TimeZone timeZone = this.g;
        if (timeZone != null) {
            return g(timeZone.getOffset(instant.E()));
        }
        if (this.c.length == 0) {
            return this.b[0];
        }
        long epochSecond = instant.getEpochSecond();
        if (this.f.length > 0) {
            if (epochSecond > this.c[r7.length - 1]) {
                b[] bVarArrB = b(c(epochSecond, this.e[r7.length - 1]));
                b bVar = null;
                for (int i2 = 0; i2 < bVarArrB.length; i2++) {
                    bVar = bVarArrB[i2];
                    if (epochSecond < bVar.a) {
                        return bVar.c;
                    }
                }
                return bVar.d;
            }
        }
        int iBinarySearch = Arrays.binarySearch(this.c, epochSecond);
        if (iBinarySearch < 0) {
            iBinarySearch = (-iBinarySearch) - 2;
        }
        return this.e[iBinarySearch + 1];
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0068  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(j$.time.LocalDateTime r9) {
        /*
            Method dump skipped, instruction units count: 279
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.time.zone.f.e(j$.time.LocalDateTime):java.lang.Object");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Objects.equals(this.g, fVar.g) && Arrays.equals(this.a, fVar.a) && Arrays.equals(this.b, fVar.b) && Arrays.equals(this.c, fVar.c) && Arrays.equals(this.e, fVar.e) && Arrays.equals(this.f, fVar.f);
    }

    public final List f(LocalDateTime localDateTime) {
        Object objE = e(localDateTime);
        if (!(objE instanceof b)) {
            return Collections.singletonList((ZoneOffset) objE);
        }
        b bVar = (b) objE;
        return bVar.d.getTotalSeconds() > bVar.c.getTotalSeconds() ? Collections.EMPTY_LIST : j$.time.a.P(new Object[]{bVar.c, bVar.d});
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f) ^ ((((Objects.hashCode(this.g) ^ Arrays.hashCode(this.a)) ^ Arrays.hashCode(this.b)) ^ Arrays.hashCode(this.c)) ^ Arrays.hashCode(this.e));
    }

    public final String toString() {
        TimeZone timeZone = this.g;
        if (timeZone != null) {
            return "ZoneRules[timeZone=" + timeZone.getID() + "]";
        }
        return "ZoneRules[currentStandardOffset=" + this.b[r3.length - 1] + "]";
    }

    public f(ZoneOffset zoneOffset) {
        ZoneOffset[] zoneOffsetArr = {zoneOffset};
        this.b = zoneOffsetArr;
        long[] jArr = i;
        this.a = jArr;
        this.c = jArr;
        this.d = k;
        this.e = zoneOffsetArr;
        this.f = j;
        this.g = null;
    }

    public f(TimeZone timeZone) {
        ZoneOffset[] zoneOffsetArr = {g(timeZone.getRawOffset())};
        this.b = zoneOffsetArr;
        long[] jArr = i;
        this.a = jArr;
        this.c = jArr;
        this.d = k;
        this.e = zoneOffsetArr;
        this.f = j;
        this.g = timeZone;
    }
}
