package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49749a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49750b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49751c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49752d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49753e;

    public p(long j11, String placement, String slotId, String requestId, String candidateId) {
        Intrinsics.g(placement, "placement");
        Intrinsics.g(slotId, "slotId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(candidateId, "candidateId");
        this.f49749a = j11;
        this.f49750b = placement;
        this.f49751c = slotId;
        this.f49752d = requestId;
        this.f49753e = candidateId;
    }

    @Override // dx.o
    public final long a() {
        return this.f49749a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49751c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49750b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49752d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return this.f49749a == pVar.f49749a && Intrinsics.b(this.f49750b, pVar.f49750b) && Intrinsics.b(this.f49751c, pVar.f49751c) && Intrinsics.b(this.f49752d, pVar.f49752d) && Intrinsics.b(this.f49753e, pVar.f49753e);
    }

    public final int hashCode() {
        return this.f49753e.hashCode() + b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49749a) * 31, 31, this.f49750b), 31, this.f49751c), 31, this.f49752d);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f49749a, "AdImpressionRecorded(timestampMs=", ", placement=", t.b(this.f49750b));
        b.c0.D(sbL, ", slotId=", this.f49751c, ", requestId=", this.f49752d);
        return b.c0.r(sbL, ", candidateId=", this.f49753e, ")");
    }
}
