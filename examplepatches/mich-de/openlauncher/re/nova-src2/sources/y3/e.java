package y3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e implements c {

    /* renamed from: a, reason: collision with root package name */
    public final float f96599a;

    /* renamed from: b, reason: collision with root package name */
    public final float f96600b;

    /* renamed from: c, reason: collision with root package name */
    public final z3.a f96601c;

    public e(float f11, float f12, z3.a aVar) {
        this.f96599a = f11;
        this.f96600b = f12;
        this.f96601c = aVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Float.compare(this.f96599a, eVar.f96599a) == 0 && Float.compare(this.f96600b, eVar.f96600b) == 0 && Intrinsics.b(this.f96601c, eVar.f96601c);
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f96599a;
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f96600b;
    }

    public final int hashCode() {
        return this.f96601c.hashCode() + a80.m.d(this.f96600b, Float.hashCode(this.f96599a) * 31, 31);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public final float mo97toDpGaN1DYA(long j11) {
        if (q.a(p.b(j11), 4294967296L)) {
            return this.f96601c.b(p.c(j11));
        }
        throw new IllegalStateException("Only Sp can convert to Px");
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public final long mo104toSp0xMU5do(float f11) {
        return w20.h.m(this.f96601c.a(f11), 4294967296L);
    }

    public final String toString() {
        return "DensityWithConverter(density=" + this.f96599a + ", fontScale=" + this.f96600b + ", converter=" + this.f96601c + ')';
    }
}
