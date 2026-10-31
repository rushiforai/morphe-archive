package kl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public final Class f71640a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f71641b;

    public u0(Class cls, Class cls2) {
        this.f71640a = cls;
        this.f71641b = cls2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return u0Var.f71640a.equals(this.f71640a) && u0Var.f71641b.equals(this.f71641b);
    }

    public final int hashCode() {
        return Objects.hash(this.f71640a, this.f71641b);
    }

    public final String toString() {
        return this.f71640a.getSimpleName() + " with serialization type: " + this.f71641b.getSimpleName();
    }
}
