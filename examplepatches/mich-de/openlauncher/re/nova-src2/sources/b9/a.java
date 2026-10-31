package b9;

import x8.l;
import x8.r;

/* loaded from: classes2.dex */
public final class a implements e {

    /* renamed from: b, reason: collision with root package name */
    public final int f17641b;

    public a(int i5) {
        this.f17641b = i5;
        if (i5 <= 0) {
            throw new IllegalArgumentException("durationMillis must be > 0.");
        }
    }

    @Override // b9.e
    public final f a(g gVar, l lVar) {
        if ((lVar instanceof r) && ((r) lVar).f95369c != 1) {
            return new b(gVar, lVar, this.f17641b);
        }
        return new d(gVar, lVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof a) {
            return this.f17641b == ((a) obj).f17641b;
        }
        return false;
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + (this.f17641b * 31);
    }
}
