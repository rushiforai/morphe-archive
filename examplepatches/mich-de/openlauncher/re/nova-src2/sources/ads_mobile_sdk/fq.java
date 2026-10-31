package ads_mobile_sdk;

import b.c0;
import b.t2;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class fq {

    /* renamed from: h, reason: collision with root package name */
    public static final b.h2 f3456h = new b.h2();

    /* renamed from: a, reason: collision with root package name */
    public final List f3457a;

    /* renamed from: b, reason: collision with root package name */
    public final String f3458b;

    /* renamed from: c, reason: collision with root package name */
    public final String f3459c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f3460d;

    /* renamed from: e, reason: collision with root package name */
    public final String f3461e;

    /* renamed from: f, reason: collision with root package name */
    public String f3462f;

    /* renamed from: g, reason: collision with root package name */
    public final List f3463g;

    public fq(List list, String str, String str2, boolean z11, String url, String str3, List list2) {
        Intrinsics.g(url, "url");
        this.f3457a = list;
        this.f3458b = str;
        this.f3459c = str2;
        this.f3460d = z11;
        this.f3461e = url;
        this.f3462f = str3;
        this.f3463g = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fq)) {
            return false;
        }
        fq fqVar = (fq) obj;
        return Intrinsics.b(this.f3457a, fqVar.f3457a) && Intrinsics.b(this.f3458b, fqVar.f3458b) && Intrinsics.b(this.f3459c, fqVar.f3459c) && this.f3460d == fqVar.f3460d && Intrinsics.b(this.f3461e, fqVar.f3461e) && Intrinsics.b(this.f3462f, fqVar.f3462f) && Intrinsics.b(this.f3463g, fqVar.f3463g);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        List list = this.f3457a;
        int iHashCode = (list == null ? 0 : list.hashCode()) * 31;
        String str = this.f3458b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f3459c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        boolean z11 = this.f3460d;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iA = t2.a(this.f3461e, (iHashCode3 + i5) * 31);
        String str3 = this.f3462f;
        int iHashCode4 = (iA + (str3 == null ? 0 : str3.hashCode())) * 31;
        List list2 = this.f3463g;
        return iHashCode4 + (list2 != null ? list2.hashCode() : 0);
    }

    public final String toString() {
        String str = this.f3462f;
        StringBuilder sb2 = new StringBuilder("BuildAdUrlResult(errors=");
        sb2.append(this.f3457a);
        sb2.append(", baseUri=");
        sb2.append(this.f3458b);
        sb2.append(", postParameters=");
        a80.m.q(this.f3459c, ", includeCookies=", ", url=", sb2, this.f3460d);
        c0.D(sb2, this.f3461e, ", queryWithFlattenedBlobParams=", str, ", csrbErrors=");
        return a80.m.j(sb2, this.f3463g, ")");
    }
}
