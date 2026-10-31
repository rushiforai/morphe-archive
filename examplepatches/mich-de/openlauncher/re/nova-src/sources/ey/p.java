package ey;

import b.u4;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f53171a;

    /* renamed from: b, reason: collision with root package name */
    public final u f53172b;

    /* renamed from: c, reason: collision with root package name */
    public final List f53173c;

    /* renamed from: d, reason: collision with root package name */
    public final List f53174d;

    public p(String str, u uVar, List list, List list2) {
        this.f53171a = str;
        this.f53172b = uVar;
        this.f53173c = list;
        this.f53174d = list2;
    }

    public final List a() {
        return this.f53174d;
    }

    public final String b() {
        return this.f53171a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f53171a, pVar.f53171a) && Intrinsics.b(this.f53172b, pVar.f53172b) && Intrinsics.b(this.f53173c, pVar.f53173c) && Intrinsics.b(this.f53174d, pVar.f53174d);
    }

    public final int hashCode() {
        int iHashCode = this.f53171a.hashCode() * 31;
        u uVar = this.f53172b;
        return this.f53174d.hashCode() + u4.c((iHashCode + (uVar == null ? 0 : uVar.hashCode())) * 31, 31, this.f53173c);
    }

    public final String toString() {
        return "CardDisplayModel(name=" + this.f53171a + ", header=" + this.f53172b + ", headerButtons=" + this.f53173c + ", content=" + this.f53174d + ")";
    }
}
