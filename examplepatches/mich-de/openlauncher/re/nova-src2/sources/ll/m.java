package ll;

import b.c0;
import java.util.Objects;

/* loaded from: classes.dex */
public final class m extends p {

    /* renamed from: a, reason: collision with root package name */
    public final int f75027a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75028b;

    /* renamed from: c, reason: collision with root package name */
    public final l f75029c;

    /* renamed from: d, reason: collision with root package name */
    public final k f75030d;

    public m(int i5, int i11, l lVar, k kVar) {
        this.f75027a = i5;
        this.f75028b = i11;
        this.f75029c = lVar;
        this.f75030d = kVar;
    }

    public static x7.h b() {
        x7.h hVar = new x7.h(8, false);
        hVar.f95137b = null;
        hVar.f95138c = null;
        hVar.f95139d = null;
        hVar.f95140e = l.f75025e;
        return hVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f75029c != l.f75025e;
    }

    public final int c() {
        l lVar = l.f75025e;
        int i5 = this.f75028b;
        l lVar2 = this.f75029c;
        if (lVar2 == lVar) {
            return i5;
        }
        if (lVar2 != l.f75022b && lVar2 != l.f75023c && lVar2 != l.f75024d) {
            throw new IllegalStateException("Unknown variant");
        }
        return i5 + 5;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return mVar.f75027a == this.f75027a && mVar.c() == c() && mVar.f75029c == this.f75029c && mVar.f75030d == this.f75030d;
    }

    public final int hashCode() {
        return Objects.hash(m.class, Integer.valueOf(this.f75027a), Integer.valueOf(this.f75028b), this.f75029c, this.f75030d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HMAC Parameters (variant: ");
        sb2.append(this.f75029c);
        sb2.append(", hashType: ");
        sb2.append(this.f75030d);
        sb2.append(", ");
        sb2.append(this.f75028b);
        sb2.append("-byte tags, and ");
        return c0.o(sb2, this.f75027a, "-byte key)");
    }
}
