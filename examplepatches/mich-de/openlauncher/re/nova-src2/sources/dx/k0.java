package dx;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final Long f49733a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f49734b;

    /* renamed from: c, reason: collision with root package name */
    public final String f49735c;

    /* renamed from: d, reason: collision with root package name */
    public final int f49736d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49737e;

    /* renamed from: f, reason: collision with root package name */
    public final u f49738f;

    /* renamed from: g, reason: collision with root package name */
    public final x0 f49739g;

    public k0(Long l9, Long l11, String str, int i5, String candidateId, u presentationKind, x0 x0Var) {
        Intrinsics.g(candidateId, "candidateId");
        Intrinsics.g(presentationKind, "presentationKind");
        this.f49733a = l9;
        this.f49734b = l11;
        this.f49735c = str;
        this.f49736d = i5;
        this.f49737e = candidateId;
        this.f49738f = presentationKind;
        this.f49739g = x0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k0)) {
            return false;
        }
        k0 k0Var = (k0) obj;
        return Intrinsics.b(this.f49733a, k0Var.f49733a) && Intrinsics.b(this.f49734b, k0Var.f49734b) && Intrinsics.b(this.f49735c, k0Var.f49735c) && this.f49736d == k0Var.f49736d && Intrinsics.b(this.f49737e, k0Var.f49737e) && this.f49738f == k0Var.f49738f && this.f49739g == k0Var.f49739g;
    }

    public final int hashCode() {
        Long l9 = this.f49733a;
        int iHashCode = (l9 == null ? 0 : l9.hashCode()) * 31;
        Long l11 = this.f49734b;
        int iHashCode2 = (iHashCode + (l11 == null ? 0 : l11.hashCode())) * 31;
        String str = this.f49735c;
        return this.f49739g.hashCode() + ((this.f49738f.hashCode() + b.c0.e(u4.a(this.f49736d, (iHashCode2 + (str != null ? str.hashCode() : 0)) * 31, 31), 31, this.f49737e)) * 31);
    }

    public final String toString() {
        return "LeaseMeta(loadedAtMs=" + this.f49733a + ", impressedAtMs=" + this.f49734b + ", adapterName=" + this.f49735c + ", reuseCount=" + this.f49736d + ", candidateId=" + this.f49737e + ", presentationKind=" + this.f49738f + ", warmth=" + this.f49739g + ")";
    }
}
