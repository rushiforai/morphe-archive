package ll;

import b.c0;
import java.util.Objects;
import x7.u;

/* loaded from: classes.dex */
public final class d extends p {

    /* renamed from: a, reason: collision with root package name */
    public final int f74998a;

    /* renamed from: b, reason: collision with root package name */
    public final int f74999b;

    /* renamed from: c, reason: collision with root package name */
    public final c f75000c;

    public d(int i5, int i11, c cVar) {
        this.f74998a = i5;
        this.f74999b = i11;
        this.f75000c = cVar;
    }

    public static u b() {
        u uVar = new u();
        uVar.f95208a = null;
        uVar.f95209b = null;
        uVar.f95210c = c.f74996e;
        return uVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f75000c != c.f74996e;
    }

    public final int c() {
        c cVar = c.f74996e;
        int i5 = this.f74999b;
        c cVar2 = this.f75000c;
        if (cVar2 == cVar) {
            return i5;
        }
        if (cVar2 != c.f74993b && cVar2 != c.f74994c && cVar2 != c.f74995d) {
            throw new IllegalStateException("Unknown variant");
        }
        return i5 + 5;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return dVar.f74998a == this.f74998a && dVar.c() == c() && dVar.f75000c == this.f75000c;
    }

    public final int hashCode() {
        return Objects.hash(d.class, Integer.valueOf(this.f74998a), Integer.valueOf(this.f74999b), this.f75000c);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AES-CMAC Parameters (variant: ");
        sb2.append(this.f75000c);
        sb2.append(", ");
        sb2.append(this.f74999b);
        sb2.append("-byte tags, and ");
        return c0.o(sb2, this.f74998a, "-byte key)");
    }
}
