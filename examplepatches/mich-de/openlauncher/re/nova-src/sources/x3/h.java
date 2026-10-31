package x3;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final int f95012a;

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return this.f95012a == ((h) obj).f95012a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95012a);
    }

    public final String toString() {
        int i5 = this.f95012a;
        return i5 == 1 ? "LineHeightStyle.Trim.FirstLineTop" : i5 == 16 ? "LineHeightStyle.Trim.LastLineBottom" : i5 == 17 ? "LineHeightStyle.Trim.Both" : i5 == 0 ? "LineHeightStyle.Trim.None" : "Invalid";
    }
}
