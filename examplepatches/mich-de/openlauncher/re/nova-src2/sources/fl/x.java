package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class x extends c {

    /* renamed from: a, reason: collision with root package name */
    public final j f55429a;

    public x(j jVar) {
        this.f55429a = jVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55429a != j.f55353v;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof x) && ((x) obj).f55429a == this.f55429a;
    }

    public final int hashCode() {
        return Objects.hash(x.class, this.f55429a);
    }

    public final String toString() {
        return "ChaCha20Poly1305 Parameters (variant: " + this.f55429a + ")";
    }
}
