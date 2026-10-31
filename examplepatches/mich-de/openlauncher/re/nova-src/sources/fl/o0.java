package fl;

import java.util.Objects;

/* loaded from: classes.dex */
public final class o0 extends c {

    /* renamed from: a, reason: collision with root package name */
    public final j f55398a;

    public o0(j jVar) {
        this.f55398a = jVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f55398a != j.A;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof o0) && ((o0) obj).f55398a == this.f55398a;
    }

    public final int hashCode() {
        return Objects.hash(o0.class, this.f55398a);
    }

    public final String toString() {
        return "XChaCha20Poly1305 Parameters (variant: " + this.f55398a + ")";
    }
}
