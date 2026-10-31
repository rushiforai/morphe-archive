package t80;

import b.c0;
import b.c9;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final String f88918a;

    /* renamed from: b, reason: collision with root package name */
    public final long f88919b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f88920c;

    /* renamed from: d, reason: collision with root package name */
    public final String f88921d;

    /* renamed from: e, reason: collision with root package name */
    public final List f88922e;

    public i(String str, long j11, boolean z11, String str2, List list) {
        this.f88918a = str;
        this.f88919b = j11;
        this.f88920c = z11;
        this.f88921d = str2;
        this.f88922e = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f88918a, iVar.f88918a) && this.f88919b == iVar.f88919b && this.f88920c == iVar.f88920c && Intrinsics.b(this.f88921d, iVar.f88921d) && Intrinsics.b(this.f88922e, iVar.f88922e);
    }

    public final int hashCode() {
        return this.f88922e.hashCode() + io.branch.engage.sesame_lite.internal.a.a(this.f88921d, c9.f(c0.d(this.f88918a.hashCode() * 31, 31, this.f88919b), 31, this.f88920c), 31);
    }

    public final String toString() {
        return "EventInfo(eventId=" + this.f88918a + ", startTimeUTCmills=" + this.f88919b + ", isAllDay=" + this.f88920c + ", label=" + this.f88921d + ", extraCta=" + this.f88922e + ")";
    }
}
