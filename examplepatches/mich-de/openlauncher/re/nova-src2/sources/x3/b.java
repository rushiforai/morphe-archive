package x3;

import b.c9;
import i2.t0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b implements o {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f95002a;

    /* renamed from: b, reason: collision with root package name */
    public final float f95003b;

    public b(t0 t0Var, float f11) {
        this.f95002a = t0Var;
        this.f95003b = f11;
    }

    @Override // x3.o
    public final float a() {
        return this.f95003b;
    }

    @Override // x3.o
    public final long b() {
        int i5 = i2.s.n;
        return i2.s.f61147m;
    }

    @Override // x3.o
    public final i2.p c() {
        return this.f95002a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f95002a, bVar.f95002a) && Float.compare(this.f95003b, bVar.f95003b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f95003b) + (this.f95002a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BrushStyle(value=");
        sb2.append(this.f95002a);
        sb2.append(", alpha=");
        return c9.k(sb2, this.f95003b, ')');
    }
}
