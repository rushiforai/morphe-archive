package kl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public final Class f71636a;

    /* renamed from: b, reason: collision with root package name */
    public final tl.a f71637b;

    public t0(Class cls, tl.a aVar) {
        this.f71636a = cls;
        this.f71637b = aVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof t0)) {
            return false;
        }
        t0 t0Var = (t0) obj;
        return t0Var.f71636a.equals(this.f71636a) && t0Var.f71637b.equals(this.f71637b);
    }

    public final int hashCode() {
        return Objects.hash(this.f71636a, this.f71637b);
    }

    public final String toString() {
        return this.f71636a.getSimpleName() + ", object identifier: " + this.f71637b;
    }
}
