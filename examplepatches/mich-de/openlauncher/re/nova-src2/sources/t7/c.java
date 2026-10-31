package t7;

/* loaded from: classes2.dex */
public final class c extends d {

    /* renamed from: a, reason: collision with root package name */
    public final int f88762a;

    public c(int i5) {
        this.f88762a = i5;
    }

    public final int a() {
        return this.f88762a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && this.f88762a == ((c) obj).f88762a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f88762a);
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("ConstraintsNotMet(reason="), this.f88762a, ')');
    }
}
