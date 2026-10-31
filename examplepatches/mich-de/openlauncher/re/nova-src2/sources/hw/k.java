package hw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final i f60744a;

    /* renamed from: b, reason: collision with root package name */
    public final i f60745b;

    /* renamed from: c, reason: collision with root package name */
    public final j f60746c;

    /* renamed from: d, reason: collision with root package name */
    public final l f60747d;

    public k(i iVar, i iVar2, j jVar, l lVar) {
        this.f60744a = iVar;
        this.f60745b = iVar2;
        this.f60746c = jVar;
        this.f60747d = lVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f60744a, kVar.f60744a) && Intrinsics.b(this.f60745b, kVar.f60745b) && Intrinsics.b(this.f60746c, kVar.f60746c) && Intrinsics.b(this.f60747d, kVar.f60747d);
    }

    public final int hashCode() {
        return this.f60747d.hashCode() + ((this.f60746c.hashCode() + ((this.f60745b.hashCode() + (this.f60744a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "PrimaryButtonStyle(colorsLight=" + this.f60744a + ", colorsDark=" + this.f60745b + ", shape=" + this.f60746c + ", typography=" + this.f60747d + ")";
    }
}
