package pu;

/* loaded from: classes4.dex */
public final class i0 implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f83049a;

    public i0(boolean z11) {
        this.f83049a = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i0) && this.f83049a == ((i0) obj).f83049a;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f83049a);
    }

    public final String toString() {
        return a80.m.i("Show(isChecked=", ")", this.f83049a);
    }
}
