package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49756a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49757b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49758c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49759d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49760e;

    /* renamed from: f, reason: collision with root package name */
    public final n f49761f;

    public q(long j11, String placement, String slotId, String requestId, String candidateId, n nVar) {
        Intrinsics.g(placement, "placement");
        Intrinsics.g(slotId, "slotId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(candidateId, "candidateId");
        this.f49756a = j11;
        this.f49757b = placement;
        this.f49758c = slotId;
        this.f49759d = requestId;
        this.f49760e = candidateId;
        this.f49761f = nVar;
    }

    @Override // dx.o
    public final long a() {
        return this.f49756a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49758c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49757b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49759d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return this.f49756a == qVar.f49756a && Intrinsics.b(this.f49757b, qVar.f49757b) && Intrinsics.b(this.f49758c, qVar.f49758c) && Intrinsics.b(this.f49759d, qVar.f49759d) && Intrinsics.b(this.f49760e, qVar.f49760e) && Intrinsics.b(this.f49761f, qVar.f49761f);
    }

    public final int hashCode() {
        return this.f49761f.hashCode() + b.c0.e(b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49756a) * 31, 31, this.f49757b), 31, this.f49758c), 31, this.f49759d), 31, this.f49760e);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f49756a, "AdLoadFailed(timestampMs=", ", placement=", t.b(this.f49757b));
        b.c0.D(sbL, ", slotId=", this.f49758c, ", requestId=", this.f49759d);
        sbL.append(", candidateId=");
        sbL.append(this.f49760e);
        sbL.append(", error=");
        sbL.append(this.f49761f);
        sbL.append(")");
        return sbL.toString();
    }
}
