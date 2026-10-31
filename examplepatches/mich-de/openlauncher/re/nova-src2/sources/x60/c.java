package x60;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;

/* loaded from: classes4.dex */
public enum c implements d {
    /* JADX INFO: Fake field, exist only in values array */
    YOTTA("Y", 24),
    /* JADX INFO: Fake field, exist only in values array */
    ZETTA("Z", 21),
    /* JADX INFO: Fake field, exist only in values array */
    EXA("E", 18),
    /* JADX INFO: Fake field, exist only in values array */
    PICO("P", 15),
    /* JADX INFO: Fake field, exist only in values array */
    GIGA("T", 12),
    /* JADX INFO: Fake field, exist only in values array */
    GIGA("G", 9),
    /* JADX INFO: Fake field, exist only in values array */
    MEGA("M", 6),
    KILO("k", 3),
    /* JADX INFO: Fake field, exist only in values array */
    HECTO("h", 2),
    /* JADX INFO: Fake field, exist only in values array */
    DEKA("da", 1),
    DECI("d", -1),
    CENTI("c", -2),
    MILLI(InneractiveMediationDefs.GENDER_MALE, -3),
    MICRO("µ", -6),
    NANO("n", -9),
    /* JADX INFO: Fake field, exist only in values array */
    PICO("p", -12),
    FEMTO(InneractiveMediationDefs.GENDER_FEMALE, -15),
    /* JADX INFO: Fake field, exist only in values array */
    ATTO("a", -18),
    /* JADX INFO: Fake field, exist only in values array */
    ZEPTO("z", -21),
    /* JADX INFO: Fake field, exist only in values array */
    YOCTO("y", -24);


    /* renamed from: a, reason: collision with root package name */
    public final String f95120a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95121b;

    c(String str, int i5) {
        this.f95120a = str;
        this.f95121b = i5;
    }

    public static e c(e eVar) {
        return ((dc0.b) eVar).n(KILO);
    }

    public static e d(e eVar) {
        return ((dc0.b) eVar).n(MICRO);
    }

    public static e g(e eVar) {
        return ((dc0.b) eVar).n(MILLI);
    }

    @Override // x60.d
    public final int a() {
        return this.f95121b;
    }

    @Override // x60.d
    public final /* bridge */ /* synthetic */ Integer b() {
        return 10;
    }
}
