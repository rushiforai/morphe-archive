package b10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s2 {

    /* renamed from: a, reason: collision with root package name */
    public final p1.e1 f16898a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f16899b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f16900c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f16901d;

    /* renamed from: e, reason: collision with root package name */
    public final p1.e1 f16902e;

    /* renamed from: f, reason: collision with root package name */
    public final p1.e1 f16903f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f16904g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.e1 f16905h;

    /* renamed from: i, reason: collision with root package name */
    public final p1.e1 f16906i;

    public s2(p1.e1 e1Var, p1.e1 e1Var2, p1.e1 e1Var3, p1.e1 e1Var4, p1.e1 e1Var5, p1.e1 e1Var6, p1.e1 e1Var7, p1.e1 e1Var8, p1.e1 e1Var9) {
        this.f16898a = e1Var;
        this.f16899b = e1Var2;
        this.f16900c = e1Var3;
        this.f16901d = e1Var4;
        this.f16902e = e1Var5;
        this.f16903f = e1Var6;
        this.f16904g = e1Var7;
        this.f16905h = e1Var8;
        this.f16906i = e1Var9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s2)) {
            return false;
        }
        s2 s2Var = (s2) obj;
        return Intrinsics.b(this.f16898a, s2Var.f16898a) && Intrinsics.b(this.f16899b, s2Var.f16899b) && Intrinsics.b(this.f16900c, s2Var.f16900c) && Intrinsics.b(this.f16901d, s2Var.f16901d) && Intrinsics.b(this.f16902e, s2Var.f16902e) && Intrinsics.b(this.f16903f, s2Var.f16903f) && Intrinsics.b(this.f16904g, s2Var.f16904g) && Intrinsics.b(this.f16905h, s2Var.f16905h) && Intrinsics.b(this.f16906i, s2Var.f16906i);
    }

    public final int hashCode() {
        return this.f16906i.hashCode() + ((this.f16905h.hashCode() + ((this.f16904g.hashCode() + ((this.f16903f.hashCode() + ((this.f16902e.hashCode() + ((this.f16901d.hashCode() + ((this.f16900c.hashCode() + ((this.f16899b.hashCode() + (this.f16898a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "WhatsNewOnboardingModel(muNovaSettings=" + this.f16898a + ", muDrawer=" + this.f16899b + ", muFolders=" + this.f16900c + ", muSearch=" + this.f16901d + ", muBadges=" + this.f16902e + ", branchShortcuts=" + this.f16903f + ", branchContacts=" + this.f16904g + ", autocompleteService=" + this.f16905h + ", mediaLite=" + this.f16906i + ")";
    }
}
