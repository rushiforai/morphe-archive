package x3;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: c, reason: collision with root package name */
    public static final s f95033c = new s(2, false);

    /* renamed from: d, reason: collision with root package name */
    public static final s f95034d = new s(1, true);

    /* renamed from: a, reason: collision with root package name */
    public final int f95035a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f95036b;

    public s(int i5, boolean z11) {
        this.f95035a = i5;
        this.f95036b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return this.f95035a == sVar.f95035a && this.f95036b == sVar.f95036b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f95036b) + (Integer.hashCode(this.f95035a) * 31);
    }

    public final String toString() {
        return equals(f95033c) ? "TextMotion.Static" : equals(f95034d) ? "TextMotion.Animated" : "Invalid";
    }
}
