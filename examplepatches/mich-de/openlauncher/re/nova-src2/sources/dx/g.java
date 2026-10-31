package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49700a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49701b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49702c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49703d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49704e;

    public g(long j11, String placement, String str, String str2, String str3) {
        Intrinsics.g(placement, "placement");
        this.f49700a = j11;
        this.f49701b = placement;
        this.f49702c = str;
        this.f49703d = str2;
        this.f49704e = str3;
    }

    @Override // dx.o
    public final long a() {
        return this.f49700a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49702c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49701b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49703d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f49700a == gVar.f49700a && Intrinsics.b(this.f49701b, gVar.f49701b) && Intrinsics.b(this.f49702c, gVar.f49702c) && Intrinsics.b(this.f49703d, gVar.f49703d) && Intrinsics.b(this.f49704e, gVar.f49704e);
    }

    public final int hashCode() {
        return this.f49704e.hashCode() + b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49700a) * 31, 31, this.f49701b), 31, this.f49702c), 31, this.f49703d);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f49700a, "AdClick(timestampMs=", ", placement=", t.b(this.f49701b));
        b.c0.D(sbL, ", slotId=", this.f49702c, ", requestId=", this.f49703d);
        return b.c0.r(sbL, ", candidateId=", this.f49704e, ")");
    }
}
