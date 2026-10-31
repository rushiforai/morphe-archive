package o2;

import b.u4;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: k, reason: collision with root package name */
    public static int f79251k;

    /* renamed from: l, reason: collision with root package name */
    public static final f f79252l = new f(0);

    /* renamed from: a, reason: collision with root package name */
    public final String f79253a;

    /* renamed from: b, reason: collision with root package name */
    public final float f79254b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79255c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79256d;

    /* renamed from: e, reason: collision with root package name */
    public final float f79257e;

    /* renamed from: f, reason: collision with root package name */
    public final j0 f79258f;

    /* renamed from: g, reason: collision with root package name */
    public final long f79259g;

    /* renamed from: h, reason: collision with root package name */
    public final int f79260h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f79261i;

    /* renamed from: j, reason: collision with root package name */
    public final int f79262j;

    public g(String str, float f11, float f12, float f13, float f14, j0 j0Var, long j11, int i5, boolean z11) {
        int i11;
        synchronized (f79252l) {
            i11 = f79251k;
            f79251k = i11 + 1;
        }
        this.f79253a = str;
        this.f79254b = f11;
        this.f79255c = f12;
        this.f79256d = f13;
        this.f79257e = f14;
        this.f79258f = j0Var;
        this.f79259g = j11;
        this.f79260h = i5;
        this.f79261i = z11;
        this.f79262j = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (!Intrinsics.b(this.f79253a, gVar.f79253a) || !y3.f.a(this.f79254b, gVar.f79254b) || !y3.f.a(this.f79255c, gVar.f79255c) || this.f79256d != gVar.f79256d || this.f79257e != gVar.f79257e || !this.f79258f.equals(gVar.f79258f)) {
            return false;
        }
        long j11 = gVar.f79259g;
        int i5 = i2.s.n;
        return ULong.a(this.f79259g, j11) && this.f79260h == gVar.f79260h && this.f79261i == gVar.f79261i;
    }

    public final int hashCode() {
        int iHashCode = (this.f79258f.hashCode() + a80.m.d(this.f79257e, a80.m.d(this.f79256d, a80.m.d(this.f79255c, a80.m.d(this.f79254b, this.f79253a.hashCode() * 31, 31), 31), 31), 31)) * 31;
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Boolean.hashCode(this.f79261i) + u4.a(this.f79260h, b.c0.d(iHashCode, 31, this.f79259g), 31);
    }
}
