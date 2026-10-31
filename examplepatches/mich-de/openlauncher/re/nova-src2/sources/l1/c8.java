package l1;

/* loaded from: classes2.dex */
public final class c8 {

    /* renamed from: a, reason: collision with root package name */
    public final float f73119a;

    /* renamed from: b, reason: collision with root package name */
    public final float f73120b;

    /* renamed from: c, reason: collision with root package name */
    public final float f73121c;

    public c8(float f11, float f12, float f13) {
        this.f73119a = f11;
        this.f73120b = f12;
        this.f73121c = f13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c8)) {
            return false;
        }
        c8 c8Var = (c8) obj;
        return y3.f.a(this.f73119a, c8Var.f73119a) && y3.f.a(this.f73120b, c8Var.f73120b) && y3.f.a(this.f73121c, c8Var.f73121c);
    }

    public final int hashCode() {
        return Float.hashCode(this.f73121c) + a80.m.d(this.f73120b, Float.hashCode(this.f73119a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TabPosition(left=");
        float f11 = this.f73119a;
        sb2.append((Object) y3.f.b(f11));
        sb2.append(", right=");
        float f12 = this.f73120b;
        sb2.append((Object) y3.f.b(f11 + f12));
        sb2.append(", width=");
        sb2.append((Object) y3.f.b(f12));
        sb2.append(", contentWidth=");
        sb2.append((Object) y3.f.b(this.f73121c));
        sb2.append(')');
        return sb2.toString();
    }
}
