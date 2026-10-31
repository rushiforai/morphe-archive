package e0;

/* loaded from: classes2.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final float f50132a;

    /* renamed from: b, reason: collision with root package name */
    public final i2.p f50133b;

    public u(float f11, i2.p pVar) {
        this.f50132a = f11;
        this.f50133b = pVar;
    }

    public final i2.p a() {
        return this.f50133b;
    }

    public final float b() {
        return this.f50132a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return y3.f.a(this.f50132a, uVar.f50132a) && this.f50133b.equals(uVar.f50133b);
    }

    public final int hashCode() {
        return this.f50133b.hashCode() + (Float.hashCode(this.f50132a) * 31);
    }

    public final String toString() {
        return "BorderStroke(width=" + ((Object) y3.f.b(this.f50132a)) + ", brush=" + this.f50133b + ')';
    }
}
