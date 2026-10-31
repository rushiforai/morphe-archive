package ads_mobile_sdk;

import b.t2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class g42 {

    /* renamed from: a, reason: collision with root package name */
    public final long f3636a;

    /* renamed from: b, reason: collision with root package name */
    public final String f3637b;

    /* renamed from: c, reason: collision with root package name */
    public final String f3638c;

    public g42(long j11, String gwsQueryId, String url) {
        f42 f42Var = f42.f3155a;
        Intrinsics.g(gwsQueryId, "gwsQueryId");
        Intrinsics.g(url, "url");
        this.f3636a = j11;
        this.f3637b = gwsQueryId;
        this.f3638c = url;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g42)) {
            return false;
        }
        g42 g42Var = (g42) obj;
        if (this.f3636a != g42Var.f3636a || !Intrinsics.b(this.f3637b, g42Var.f3637b) || !Intrinsics.b(this.f3638c, g42Var.f3638c)) {
            return false;
        }
        f42 f42Var = f42.f3155a;
        return true;
    }

    public final int hashCode() {
        return f42.f3155a.hashCode() + t2.a(this.f3638c, t2.a(this.f3637b, Long.hashCode(this.f3636a) * 31));
    }

    public final String toString() {
        f42 f42Var = f42.f3155a;
        StringBuilder sbL = a80.m.l(this.f3636a, "OfflineBufferedPingRecord(timestamp=", ", gwsQueryId=", this.f3637b);
        sbL.append(", url=");
        sbL.append(this.f3638c);
        sbL.append(", eventState=");
        sbL.append(f42Var);
        sbL.append(")");
        return sbL.toString();
    }
}
