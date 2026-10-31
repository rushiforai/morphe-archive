package x7;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f95133a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95134b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95135c;

    public g(String workSpecId, int i5, int i11) {
        Intrinsics.g(workSpecId, "workSpecId");
        this.f95133a = workSpecId;
        this.f95134b = i5;
        this.f95135c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f95133a, gVar.f95133a) && this.f95134b == gVar.f95134b && this.f95135c == gVar.f95135c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95135c) + u4.a(this.f95134b, this.f95133a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SystemIdInfo(workSpecId=");
        sb2.append(this.f95133a);
        sb2.append(", generation=");
        sb2.append(this.f95134b);
        sb2.append(", systemId=");
        return a2.c.m(sb2, this.f95135c, ')');
    }
}
