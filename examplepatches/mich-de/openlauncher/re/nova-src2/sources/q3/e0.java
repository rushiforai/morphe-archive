package q3;

/* loaded from: classes2.dex */
public final class e0 extends p {

    /* renamed from: d, reason: collision with root package name */
    public final t5.d0 f83548d;

    public e0(t5.d0 d0Var) {
        this.f83548d = d0Var;
    }

    public final t5.d0 c() {
        return this.f83548d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e0) {
            return this.f83548d.equals(((e0) obj).f83548d);
        }
        return false;
    }

    public final int hashCode() {
        return this.f83548d.hashCode();
    }

    public final String toString() {
        return "LoadedFontFamily(typeface=" + this.f83548d + ')';
    }
}
