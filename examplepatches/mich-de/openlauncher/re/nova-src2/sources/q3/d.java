package q3;

/* loaded from: classes.dex */
public final class d implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f83544a;

    public d(int i5) {
        this.f83544a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && this.f83544a == ((d) obj).f83544a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f83544a);
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("AndroidFontResolveInterceptor(fontWeightAdjustment="), this.f83544a, ')');
    }
}
