package k2;

import a80.m;
import b.u4;

/* loaded from: classes2.dex */
public final class k extends g {

    /* renamed from: a, reason: collision with root package name */
    public final float f70872a;

    /* renamed from: b, reason: collision with root package name */
    public final float f70873b;

    /* renamed from: c, reason: collision with root package name */
    public final int f70874c;

    /* renamed from: d, reason: collision with root package name */
    public final int f70875d;

    public k(float f11, float f12, int i5, int i11, int i12) {
        f12 = (i12 & 2) != 0 ? 4.0f : f12;
        i5 = (i12 & 4) != 0 ? 0 : i5;
        i11 = (i12 & 8) != 0 ? 0 : i11;
        this.f70872a = f11;
        this.f70873b = f12;
        this.f70874c = i5;
        this.f70875d = i11;
    }

    public final int a() {
        return this.f70874c;
    }

    public final int b() {
        return this.f70875d;
    }

    public final float c() {
        return this.f70873b;
    }

    public final float d() {
        return this.f70872a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f70872a == kVar.f70872a && this.f70873b == kVar.f70873b && this.f70874c == kVar.f70874c && this.f70875d == kVar.f70875d;
    }

    public final int hashCode() {
        return u4.a(this.f70875d, u4.a(this.f70874c, m.d(this.f70873b, Float.hashCode(this.f70872a) * 31, 31), 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Stroke(width=");
        sb2.append(this.f70872a);
        sb2.append(", miter=");
        sb2.append(this.f70873b);
        sb2.append(", cap=");
        String str = "Unknown";
        int i5 = this.f70874c;
        sb2.append((Object) (i5 == 0 ? "Butt" : i5 == 1 ? "Round" : i5 == 2 ? "Square" : "Unknown"));
        sb2.append(", join=");
        int i11 = this.f70875d;
        if (i11 == 0) {
            str = "Miter";
        } else if (i11 == 1) {
            str = "Round";
        } else if (i11 == 2) {
            str = "Bevel";
        }
        sb2.append((Object) str);
        sb2.append(", pathEffect=null)");
        return sb2.toString();
    }
}
