package ux;

import b.c0;
import b.u4;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f91605a;

    /* renamed from: b, reason: collision with root package name */
    public final int f91606b;

    /* renamed from: c, reason: collision with root package name */
    public final int f91607c;

    public d(String str, int i5, int i11) {
        this.f91605a = str;
        this.f91606b = i5;
        this.f91607c = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f91605a.equals(dVar.f91605a) && this.f91606b == dVar.f91606b && this.f91607c == dVar.f91607c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f91607c) + u4.a(this.f91606b, this.f91605a.hashCode() * 31, 31);
    }

    public final String toString() {
        return c0.o(c0.v("ConsentCardInfo(emoji=", this.f91606b, this.f91605a, ", titleRes=", ", descriptionRes="), this.f91607c, ")");
    }
}
