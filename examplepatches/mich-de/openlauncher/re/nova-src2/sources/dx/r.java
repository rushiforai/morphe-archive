package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements o {

    /* renamed from: a, reason: collision with root package name */
    public final long f49765a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49766b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49767c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49768d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49769e;

    /* renamed from: f, reason: collision with root package name */
    public final long f49770f;

    /* renamed from: g, reason: collision with root package name */
    public final u f49771g;

    /* renamed from: h, reason: collision with root package name */
    public final String f49772h;

    public r(long j11, String placement, String slotId, String requestId, String candidateId, long j12, u presentationKind, String str) {
        x0 x0Var = x0.f49820a;
        Intrinsics.g(placement, "placement");
        Intrinsics.g(slotId, "slotId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(candidateId, "candidateId");
        Intrinsics.g(presentationKind, "presentationKind");
        this.f49765a = j11;
        this.f49766b = placement;
        this.f49767c = slotId;
        this.f49768d = requestId;
        this.f49769e = candidateId;
        this.f49770f = j12;
        this.f49771g = presentationKind;
        this.f49772h = str;
    }

    @Override // dx.o
    public final long a() {
        return this.f49765a;
    }

    @Override // dx.o
    public final String b() {
        return this.f49767c;
    }

    @Override // dx.o
    public final String c() {
        return this.f49766b;
    }

    @Override // dx.o
    public final String d() {
        return this.f49768d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.f49765a != rVar.f49765a || !Intrinsics.b(this.f49766b, rVar.f49766b) || !Intrinsics.b(this.f49767c, rVar.f49767c) || !Intrinsics.b(this.f49768d, rVar.f49768d) || !Intrinsics.b(this.f49769e, rVar.f49769e) || this.f49770f != rVar.f49770f || this.f49771g != rVar.f49771g || !Intrinsics.b(this.f49772h, rVar.f49772h)) {
            return false;
        }
        x0 x0Var = x0.f49820a;
        return true;
    }

    public final int hashCode() {
        int iHashCode = (this.f49771g.hashCode() + b.c0.d(b.c0.e(b.c0.e(b.c0.e(b.c0.e(Long.hashCode(this.f49765a) * 31, 31, this.f49766b), 31, this.f49767c), 31, this.f49768d), 31, this.f49769e), 31, this.f49770f)) * 31;
        String str = this.f49772h;
        return x0.f49820a.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String strB = t.b(this.f49766b);
        x0 x0Var = x0.f49820a;
        StringBuilder sbL = a80.m.l(this.f49765a, "AdLoaded(timestampMs=", ", placement=", strB);
        b.c0.D(sbL, ", slotId=", this.f49767c, ", requestId=", this.f49768d);
        b.c0.C(sbL, ", candidateId=", this.f49769e, ", latencyMs=");
        sbL.append(this.f49770f);
        sbL.append(", presentationKind=");
        sbL.append(this.f49771g);
        sbL.append(", adapterName=");
        sbL.append(this.f49772h);
        sbL.append(", warmth=");
        sbL.append(x0Var);
        sbL.append(")");
        return sbL.toString();
    }
}
