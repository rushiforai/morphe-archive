package lo;

import b.c0;
import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f75066a;

    /* renamed from: b, reason: collision with root package name */
    public final c f75067b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75068c;

    /* renamed from: d, reason: collision with root package name */
    public final long f75069d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f75070e;

    public a(String str, c cVar, int i5, long j11, Integer num) {
        this.f75066a = str;
        this.f75067b = cVar;
        this.f75068c = i5;
        this.f75069d = j11;
        this.f75070e = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f75066a.equals(aVar.f75066a) && this.f75067b == aVar.f75067b && this.f75068c == aVar.f75068c && this.f75069d == aVar.f75069d && Intrinsics.b(this.f75070e, aVar.f75070e);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f(c9.f(c0.d(u4.a(this.f75068c, (this.f75067b.hashCode() + (this.f75066a.hashCode() * 31)) * 31, 31), 31, this.f75069d), 31, true), 31, true), 31, true);
        Integer num = this.f75070e;
        return iF + (num == null ? 0 : num.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AiSurface(id=");
        sb2.append(this.f75066a);
        sb2.append(", displayMode=");
        sb2.append(this.f75067b);
        sb2.append(", minScoreThreshold=");
        sb2.append(this.f75068c);
        sb2.append(", maxFrequencyMs=");
        sb2.append(this.f75069d);
        sb2.append(", requiresConsent=true, enabledByDefault=true, userToggleable=true, sensitivityFloor=");
        return a2.c.o(sb2, this.f75070e, ')');
    }
}
