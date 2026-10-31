package ql;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class h extends g0 {

    /* renamed from: a, reason: collision with root package name */
    public final g f84166a;

    public h(g gVar) {
        this.f84166a = gVar;
    }

    @Override // el.g
    public final boolean a() {
        return this.f84166a != g.f84164e;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof h) && ((h) obj).f84166a == this.f84166a;
    }

    public final int hashCode() {
        return Objects.hash(h.class, this.f84166a);
    }

    public final String toString() {
        return "Ed25519 Parameters (variant: " + this.f84166a + ")";
    }
}
