package j$.time.chrono;

import j$.time.temporal.Temporal;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class t implements m {
    public static final t BCE;
    public static final t CE;
    public static final /* synthetic */ t[] a;

    static {
        t tVar = new t("BCE", 0);
        BCE = tVar;
        t tVar2 = new t("CE", 1);
        CE = tVar2;
        a = new t[]{tVar, tVar2};
    }

    public static t valueOf(String str) {
        return (t) Enum.valueOf(t.class, str);
    }

    public static t[] values() {
        return (t[]) a.clone();
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ boolean d(j$.time.temporal.n nVar) {
        return j$.time.a.u(this, nVar);
    }

    @Override // j$.time.chrono.m
    public final int getValue() {
        return ordinal();
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ int h(j$.time.temporal.n nVar) {
        return j$.time.a.p(this, nVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final j$.time.temporal.r j(j$.time.temporal.n nVar) {
        return j$.time.temporal.o.d(this, nVar);
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        return temporal.b(getValue(), j$.time.temporal.a.ERA);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ Object m(j$.time.format.a aVar) {
        return j$.time.a.y(this, aVar);
    }

    @Override // j$.time.temporal.TemporalAccessor
    public final /* synthetic */ long s(j$.time.temporal.n nVar) {
        return j$.time.a.r(this, nVar);
    }
}
