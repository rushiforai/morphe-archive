package x3;

import b.u4;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: c, reason: collision with root package name */
    public static final i f95013c = new i(f.f95009c, 17);

    /* renamed from: a, reason: collision with root package name */
    public final float f95014a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95015b;

    public i(float f11, int i5) {
        this.f95014a = f11;
        this.f95015b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        float f11 = iVar.f95014a;
        float f12 = f.f95008b;
        return Float.compare(this.f95014a, f11) == 0 && this.f95015b == iVar.f95015b;
    }

    public final int hashCode() {
        float f11 = f.f95008b;
        return Integer.hashCode(0) + u4.a(this.f95015b, Float.hashCode(this.f95014a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LineHeightStyle(alignment=");
        sb2.append((Object) f.b(this.f95014a));
        sb2.append(", trim=");
        int i5 = this.f95015b;
        sb2.append((Object) (i5 == 1 ? "LineHeightStyle.Trim.FirstLineTop" : i5 == 16 ? "LineHeightStyle.Trim.LastLineBottom" : i5 == 17 ? "LineHeightStyle.Trim.Both" : i5 == 0 ? "LineHeightStyle.Trim.None" : "Invalid"));
        sb2.append(",mode=Mode(value=0))");
        return sb2.toString();
    }
}
