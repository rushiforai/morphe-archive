package du;

import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.model.Source;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f49525a;

    /* renamed from: b, reason: collision with root package name */
    public final int f49526b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f49527c;

    /* renamed from: d, reason: collision with root package name */
    public final String f49528d;

    /* renamed from: e, reason: collision with root package name */
    public final Source f49529e;

    /* renamed from: f, reason: collision with root package name */
    public final String f49530f;

    public c(String clientSecret, int i5, boolean z11, String str, Source source, String str2) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f49525a = clientSecret;
        this.f49526b = i5;
        this.f49527c = z11;
        this.f49528d = str;
        this.f49529e = source;
        this.f49530f = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f49525a, cVar.f49525a) && this.f49526b == cVar.f49526b && this.f49527c == cVar.f49527c && Intrinsics.b(this.f49528d, cVar.f49528d) && Intrinsics.b(this.f49529e, cVar.f49529e) && Intrinsics.b(this.f49530f, cVar.f49530f);
    }

    public final int hashCode() {
        int iF = c9.f(u4.a(this.f49526b, this.f49525a.hashCode() * 31, 31), 31, this.f49527c);
        String str = this.f49528d;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        Source source = this.f49529e;
        int iHashCode2 = (iHashCode + (source == null ? 0 : source.hashCode())) * 31;
        String str2 = this.f49530f;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("Validated(clientSecret=", this.f49526b, this.f49525a, ", flowOutcome=", ", canCancelSource=");
        c9.s(", sourceId=", this.f49528d, ", source=", sbV, this.f49527c);
        sbV.append(this.f49529e);
        sbV.append(", stripeAccountId=");
        sbV.append(this.f49530f);
        sbV.append(")");
        return sbV.toString();
    }
}
