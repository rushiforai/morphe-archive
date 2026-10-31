package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49801a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49802b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49803c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49804d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49805e;

    public v(long j11, String placement, String slotId, String requestId, String candidateId) {
        Intrinsics.g(placement, "placement");
        Intrinsics.g(slotId, "slotId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(candidateId, "candidateId");
        this.f49801a = j11;
        this.f49802b = placement;
        this.f49803c = slotId;
        this.f49804d = requestId;
        this.f49805e = candidateId;
    }

    @Override // dx.o
    public final long a() {
        return this.f49801a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49803c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49802b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49804d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return this.f49801a == vVar.f49801a && Intrinsics.b(this.f49802b, vVar.f49802b) && Intrinsics.b(this.f49803c, vVar.f49803c) && Intrinsics.b(this.f49804d, vVar.f49804d) && Intrinsics.b(this.f49805e, vVar.f49805e);
    }

    public final int hashCode() {
        return this.f49805e.hashCode() + b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49801a) * 31, 31, this.f49802b), 31, this.f49803c), 31, this.f49804d);
    }

    public final String toString() {
        StringBuilder sbL = a80.m.l(this.f49801a, "AdRequested(timestampMs=", ", placement=", t.b(this.f49802b));
        b.c0.D(sbL, ", slotId=", this.f49803c, ", requestId=", this.f49804d);
        return b.c0.r(sbL, ", candidateId=", this.f49805e, ")");
    }
}
