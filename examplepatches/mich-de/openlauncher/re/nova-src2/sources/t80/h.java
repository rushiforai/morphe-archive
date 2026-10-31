package t80;

import b.c0;
import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final String f88913a;

    /* renamed from: b, reason: collision with root package name */
    public final String f88914b;

    /* renamed from: c, reason: collision with root package name */
    public final String f88915c;

    /* renamed from: d, reason: collision with root package name */
    public final List f88916d;

    /* renamed from: e, reason: collision with root package name */
    public final long f88917e;

    public h(String str, String str2, String str3, List list, long j11) {
        this.f88913a = str;
        this.f88914b = str2;
        this.f88915c = str3;
        this.f88916d = list;
        this.f88917e = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f88913a, hVar.f88913a) && Intrinsics.b(this.f88914b, hVar.f88914b) && Intrinsics.b(this.f88915c, hVar.f88915c) && Intrinsics.b(this.f88916d, hVar.f88916d) && this.f88917e == hVar.f88917e;
    }

    public final int hashCode() {
        int iHashCode = this.f88913a.hashCode() * 31;
        String str = this.f88914b;
        return Long.hashCode(this.f88917e) + u4.c(io.branch.engage.sesame_lite.internal.a.a(this.f88915c, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31), 31, this.f88916d);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("EventData(id=", this.f88913a, ", label=", this.f88914b, ", time=");
        sbW.append(this.f88915c);
        sbW.append(", extraCta=");
        sbW.append(this.f88916d);
        sbW.append(", startTimeUTCmills=");
        return a2.c.i(this.f88917e, ")", sbW);
    }
}
