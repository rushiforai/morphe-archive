package e1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public final r f51375a;

    /* renamed from: b, reason: collision with root package name */
    public final r f51376b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f51377c;

    public s(r rVar, r rVar2, boolean z11) {
        this.f51375a = rVar;
        this.f51376b = rVar2;
        this.f51377c = z11;
    }

    public static s a(s sVar, r rVar, r rVar2, boolean z11, int i5) {
        if ((i5 & 1) != 0) {
            rVar = sVar.f51375a;
        }
        if ((i5 & 2) != 0) {
            rVar2 = sVar.f51376b;
        }
        sVar.getClass();
        return new s(rVar, rVar2, z11);
    }

    public final r b() {
        return this.f51376b;
    }

    public final r c() {
        return this.f51375a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Intrinsics.b(this.f51375a, sVar.f51375a) && Intrinsics.b(this.f51376b, sVar.f51376b) && this.f51377c == sVar.f51377c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f51377c) + ((this.f51376b.hashCode() + (this.f51375a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Selection(start=");
        sb2.append(this.f51375a);
        sb2.append(", end=");
        sb2.append(this.f51376b);
        sb2.append(", handlesCrossed=");
        return a2.c.p(sb2, this.f51377c, ')');
    }
}
