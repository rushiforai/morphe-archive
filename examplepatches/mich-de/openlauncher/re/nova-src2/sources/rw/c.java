package rw;

import a80.m;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends d {

    /* renamed from: a, reason: collision with root package name */
    public final String f86452a;

    /* renamed from: b, reason: collision with root package name */
    public final g f86453b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f86454c;

    public c(String route, g gVar, boolean z11) {
        Intrinsics.g(route, "route");
        this.f86452a = route;
        this.f86453b = gVar;
        this.f86454c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f86452a, cVar.f86452a) && Intrinsics.b(this.f86453b, cVar.f86453b) && this.f86454c == cVar.f86454c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f86454c) + (((this.f86452a.hashCode() * 31) + (this.f86453b == null ? 0 : 122269371)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NavigateTo(route=");
        sb2.append(this.f86452a);
        sb2.append(", popUpTo=");
        sb2.append(this.f86453b);
        sb2.append(", isSingleTop=");
        return m.k(sb2, this.f86454c, ")");
    }
}
