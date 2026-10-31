package w1;

import a2.c;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f93639a;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && this.f93639a == ((a) obj).f93639a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f93639a);
    }

    public final String toString() {
        return c.m(new StringBuilder("DeltaCounter(count="), this.f93639a, ')');
    }
}
