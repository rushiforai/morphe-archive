package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f49773a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49774b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49775c;

    /* renamed from: d, reason: collision with root package name */
    public final Long f49776d;

    /* renamed from: e, reason: collision with root package name */
    public final Long f49777e;

    /* renamed from: f, reason: collision with root package name */
    public final String f49778f;

    /* renamed from: g, reason: collision with root package name */
    public final u f49779g;

    /* renamed from: h, reason: collision with root package name */
    public final x0 f49780h;

    /* renamed from: i, reason: collision with root package name */
    public final int f49781i;

    public r0(String candidateId, String requestId, long j11, Long l9, Long l11, String str, u presentationKind, x0 x0Var, int i5) {
        Intrinsics.g(candidateId, "candidateId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(presentationKind, "presentationKind");
        this.f49773a = candidateId;
        this.f49774b = requestId;
        this.f49775c = j11;
        this.f49776d = l9;
        this.f49777e = l11;
        this.f49778f = str;
        this.f49779g = presentationKind;
        this.f49780h = x0Var;
        this.f49781i = i5;
    }

    public static r0 a(r0 r0Var, Long l9, Long l11, int i5) {
        String candidateId = r0Var.f49773a;
        String requestId = r0Var.f49774b;
        long j11 = r0Var.f49775c;
        if ((i5 & 8) != 0) {
            l9 = r0Var.f49776d;
        }
        String str = r0Var.f49778f;
        u presentationKind = r0Var.f49779g;
        x0 x0Var = r0Var.f49780h;
        int i11 = r0Var.f49781i;
        Intrinsics.g(candidateId, "candidateId");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(presentationKind, "presentationKind");
        return new r0(candidateId, requestId, j11, l9, l11, str, presentationKind, x0Var, i11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r0)) {
            return false;
        }
        r0 r0Var = (r0) obj;
        return Intrinsics.b(this.f49773a, r0Var.f49773a) && Intrinsics.b(this.f49774b, r0Var.f49774b) && this.f49775c == r0Var.f49775c && Intrinsics.b(this.f49776d, r0Var.f49776d) && Intrinsics.b(this.f49777e, r0Var.f49777e) && Intrinsics.b(this.f49778f, r0Var.f49778f) && this.f49779g == r0Var.f49779g && this.f49780h == r0Var.f49780h && this.f49781i == r0Var.f49781i;
    }

    public final int hashCode() {
        int iD = b.c0.d(b.c0.e(this.f49773a.hashCode() * 31, 31, this.f49774b), 31, this.f49775c);
        Long l9 = this.f49776d;
        int iHashCode = (iD + (l9 == null ? 0 : l9.hashCode())) * 31;
        Long l11 = this.f49777e;
        int iHashCode2 = (iHashCode + (l11 == null ? 0 : l11.hashCode())) * 31;
        String str = this.f49778f;
        return Integer.hashCode(this.f49781i) + ((this.f49780h.hashCode() + ((this.f49779g.hashCode() + ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("PresentationEntry(candidateId=", this.f49773a, ", requestId=", this.f49774b, ", shownAtMs=");
        sbW.append(this.f49775c);
        sbW.append(", hiddenAtMs=");
        sbW.append(this.f49776d);
        sbW.append(", impressedAtMs=");
        sbW.append(this.f49777e);
        sbW.append(", adapterName=");
        sbW.append(this.f49778f);
        sbW.append(", presentationKind=");
        sbW.append(this.f49779g);
        sbW.append(", warmth=");
        sbW.append(this.f49780h);
        sbW.append(", reuseCount=");
        sbW.append(this.f49781i);
        sbW.append(")");
        return sbW.toString();
    }
}
