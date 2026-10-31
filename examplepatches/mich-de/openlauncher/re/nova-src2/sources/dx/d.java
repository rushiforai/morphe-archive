package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f49691a;

    /* renamed from: b, reason: collision with root package name */
    public final String f49692b;

    /* renamed from: c, reason: collision with root package name */
    public final l0 f49693c;

    public d(String str, String str2, l0 l0Var) {
        this.f49691a = str;
        this.f49692b = str2;
        this.f49693c = l0Var;
        if (r70.k.U0(str)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (r70.k.U0(str2)) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }

    @Override // dx.f
    public final String a() {
        return this.f49691a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f49691a, dVar.f49691a) && Intrinsics.b(this.f49692b, dVar.f49692b) && this.f49693c == dVar.f49693c;
    }

    public final int hashCode() {
        return this.f49693c.hashCode() + b.c0.e(this.f49691a.hashCode() * 31, 31, this.f49692b);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("Native(candidateId=", this.f49691a, ", adUnitId=", this.f49692b, ", template=");
        sbW.append(this.f49693c);
        sbW.append(")");
        return sbW.toString();
    }
}
