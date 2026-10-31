package kl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final Class f71614a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f71615b;

    public m0(Class cls, Class cls2) {
        this.f71614a = cls;
        this.f71615b = cls2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return m0Var.f71614a.equals(this.f71614a) && m0Var.f71615b.equals(this.f71615b);
    }

    public final int hashCode() {
        return Objects.hash(this.f71614a, this.f71615b);
    }

    public final String toString() {
        return this.f71614a.getSimpleName() + " with primitive type: " + this.f71615b.getSimpleName();
    }
}
