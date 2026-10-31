package ai;

/* loaded from: classes3.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final String f13245a;

    /* renamed from: b, reason: collision with root package name */
    public final String f13246b;

    /* renamed from: c, reason: collision with root package name */
    public final long f13247c;

    /* renamed from: d, reason: collision with root package name */
    public final long f13248d;

    /* renamed from: e, reason: collision with root package name */
    public final long f13249e;

    /* renamed from: f, reason: collision with root package name */
    public final long f13250f;

    /* renamed from: g, reason: collision with root package name */
    public final long f13251g;

    /* renamed from: h, reason: collision with root package name */
    public final Long f13252h;

    /* renamed from: i, reason: collision with root package name */
    public final Long f13253i;

    /* renamed from: j, reason: collision with root package name */
    public final Long f13254j;

    /* renamed from: k, reason: collision with root package name */
    public final Boolean f13255k;

    public q(String str, String str2, long j11, long j12, long j13, long j14, long j15, Long l9, Long l11, Long l12, Boolean bool) {
        sg.w.e(str);
        sg.w.e(str2);
        sg.w.c(j11 >= 0);
        sg.w.c(j12 >= 0);
        sg.w.c(j13 >= 0);
        sg.w.c(j15 >= 0);
        this.f13245a = str;
        this.f13246b = str2;
        this.f13247c = j11;
        this.f13248d = j12;
        this.f13249e = j13;
        this.f13250f = j14;
        this.f13251g = j15;
        this.f13252h = l9;
        this.f13253i = l11;
        this.f13254j = l12;
        this.f13255k = bool;
    }

    public final q a(long j11) {
        return new q(this.f13245a, this.f13246b, this.f13247c, this.f13248d, this.f13249e, j11, this.f13251g, this.f13252h, this.f13253i, this.f13254j, this.f13255k);
    }

    public final q b(Boolean bool, Long l9, Long l11) {
        return new q(this.f13245a, this.f13246b, this.f13247c, this.f13248d, this.f13249e, this.f13250f, this.f13251g, this.f13252h, l9, l11, bool);
    }
}
