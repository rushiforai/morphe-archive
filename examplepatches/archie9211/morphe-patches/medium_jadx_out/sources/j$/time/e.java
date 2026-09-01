package j$.time;

import j$.time.temporal.ChronoUnit;
import j$.time.temporal.Temporal;
import j$.time.temporal.TemporalAccessor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class e implements TemporalAccessor, j$.time.temporal.l {
    public static final e FRIDAY;
    public static final e MONDAY;
    public static final e SATURDAY;
    public static final e SUNDAY;
    public static final e THURSDAY;
    public static final e TUESDAY;
    public static final e WEDNESDAY;
    public static final e[] a;
    public static final /* synthetic */ e[] b;

    static {
        e eVar = new e("MONDAY", 0);
        MONDAY = eVar;
        e eVar2 = new e("TUESDAY", 1);
        TUESDAY = eVar2;
        e eVar3 = new e("WEDNESDAY", 2);
        WEDNESDAY = eVar3;
        e eVar4 = new e("THURSDAY", 3);
        THURSDAY = eVar4;
        e eVar5 = new e("FRIDAY", 4);
        FRIDAY = eVar5;
        e eVar6 = new e("SATURDAY", 5);
        SATURDAY = eVar6;
        e eVar7 = new e("SUNDAY", 6);
        SUNDAY = eVar7;
        b = new e[]{eVar, eVar2, eVar3, eVar4, eVar5, eVar6, eVar7};
        a = values();
    }

    public static e A(int i) {
        if (i >= 1 && i <= 7) {
            return a[i - 1];
        }
        h.d("Invalid value for DayOfWeek: ", i);
        return null;
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) b.clone();
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final boolean d(j$.time.temporal.n nVar) {
        return nVar instanceof j$.time.temporal.a ? nVar == j$.time.temporal.a.DAY_OF_WEEK : nVar != null && nVar.h(this);
    }

    public final int getValue() {
        return ordinal() + 1;
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final int h(j$.time.temporal.n nVar) {
        return nVar == j$.time.temporal.a.DAY_OF_WEEK ? getValue() : j$.time.temporal.o.a(this, nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return nVar == j$.time.temporal.a.DAY_OF_WEEK ? nVar.k() : j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(getValue(), j$.time.temporal.a.DAY_OF_WEEK);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final Object m(j$.time.format.a aVar) {
        return aVar == j$.time.temporal.o.c ? ChronoUnit.DAYS : j$.time.temporal.o.c(this, aVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final long s(j$.time.temporal.n nVar) {
        if (nVar == j$.time.temporal.a.DAY_OF_WEEK) {
            return getValue();
        }
        if (nVar instanceof j$.time.temporal.a) {
            throw new j$.time.temporal.q(d.a("Unsupported field: ", nVar));
        }
        return nVar.m(this);
    }
}
