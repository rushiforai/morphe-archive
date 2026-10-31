package dx;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49782a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49783b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49784c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49785d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49786e;

    /* renamed from: f, reason: collision with root package name */
    public final long f49787f;

    /* renamed from: g, reason: collision with root package name */
    public final String f49788g;

    /* renamed from: h, reason: collision with root package name */
    public final int f49789h;

    /* renamed from: i, reason: collision with root package name */
    public final String f49790i;

    public s(long j11, String placement, String str, String str2, String str3, long j12, String str4, int i5, String str5) {
        Intrinsics.g(placement, "placement");
        this.f49782a = j11;
        this.f49783b = placement;
        this.f49784c = str;
        this.f49785d = str2;
        this.f49786e = str3;
        this.f49787f = j12;
        this.f49788g = str4;
        this.f49789h = i5;
        this.f49790i = str5;
    }

    @Override // dx.o
    public final long a() {
        return this.f49782a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49784c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49783b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49785d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f49782a == sVar.f49782a && Intrinsics.b(this.f49783b, sVar.f49783b) && Intrinsics.b(this.f49784c, sVar.f49784c) && Intrinsics.b(this.f49785d, sVar.f49785d) && Intrinsics.b(this.f49786e, sVar.f49786e) && this.f49787f == sVar.f49787f && Intrinsics.b(this.f49788g, sVar.f49788g) && this.f49789h == sVar.f49789h && Intrinsics.b(this.f49790i, sVar.f49790i);
    }

    public final int hashCode() {
        int iA = u4.a(this.f49789h, b.c0.e(b.c0.d(b.c0.e(b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49782a) * 31, 31, this.f49783b), 31, this.f49784c), 31, this.f49785d), 31, this.f49786e), 31, this.f49787f), 31, this.f49788g), 31);
        String str = this.f49790i;
        return iA + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f49782a, "AdPaid(timestampMs=", ", placement=", t.b(this.f49783b));
        b.c0.D(sbL, ", slotId=", this.f49784c, ", requestId=", this.f49785d);
        b.c0.C(sbL, ", candidateId=", this.f49786e, ", revenueMicros=");
        sbL.append(this.f49787f);
        sbL.append(", currencyCode=");
        sbL.append(this.f49788g);
        sbL.append(", precision=");
        sbL.append(this.f49789h);
        sbL.append(", adapterName=");
        sbL.append(this.f49790i);
        sbL.append(")");
        return sbL.toString();
    }
}
