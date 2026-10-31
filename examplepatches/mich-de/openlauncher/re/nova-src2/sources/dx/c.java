package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f49687a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49688b;

    public c(String str, String str2) {
        this.f49687a = str;
        this.f49688b = str2;
        if (r70.k.U0(str)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (r70.k.U0(str2)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }

    @Override // dx.f
    public final String a() {
        return this.f49687a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f49687a, cVar.f49687a) && Intrinsics.b(this.f49688b, cVar.f49688b);
    }

    public final int hashCode() {
        return this.f49688b.hashCode() + (this.f49687a.hashCode() * 31);
    }

    public final String toString() {
        return b.c0.n("Icon(candidateId=", this.f49687a, ", adUnitId=", this.f49688b, ")");
    }
}
