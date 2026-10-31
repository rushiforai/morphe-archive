package j00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final z f68447a;

    /* renamed from: b, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.c f68448b;

    public a0(z zVar, com.teslacoilsw.launcher.search.hero.c cVar) {
        this.f68447a = zVar;
        this.f68448b = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return Intrinsics.b(this.f68447a, a0Var.f68447a) && Intrinsics.b(this.f68448b, a0Var.f68448b);
    }

    public final int hashCode() {
        return this.f68448b.hashCode() + (this.f68447a.hashCode() * 31);
    }

    public final String toString() {
        return "ListEntryWithCardContent(listEntry=" + this.f68447a + ", cardContent=" + this.f68448b + ")";
    }
}
