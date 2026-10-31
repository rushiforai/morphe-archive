package i20;

import b.c0;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f61194a;

    /* renamed from: b, reason: collision with root package name */
    public final List f61195b;

    /* renamed from: c, reason: collision with root package name */
    public final long f61196c;

    /* renamed from: d, reason: collision with root package name */
    public final String f61197d;

    public a(long j11, String str, List list, boolean z11) {
        this.f61194a = z11;
        this.f61195b = list;
        this.f61196c = j11;
        this.f61197d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f61194a == aVar.f61194a && Intrinsics.b(this.f61195b, aVar.f61195b) && this.f61196c == aVar.f61196c && Intrinsics.b(this.f61197d, aVar.f61197d);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f61194a) * 31;
        List list = this.f61195b;
        int iD = c0.d((iHashCode + (list == null ? 0 : list.hashCode())) * 31, 31, this.f61196c);
        String str = this.f61197d;
        return iD + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        return "ApiResult(hasError=" + this.f61194a + ", links=" + this.f61195b + ", bytesReceived=" + this.f61196c + ", resultType=" + this.f61197d + ")";
    }
}
