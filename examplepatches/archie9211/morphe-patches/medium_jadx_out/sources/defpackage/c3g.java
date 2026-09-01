package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c3g extends t0g {
    public final b3g a;

    public c3g(b3g b3gVar) {
        this.a = b3gVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.a != b3g.e;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof c3g) && ((c3g) obj).a == this.a;
    }

    public final int hashCode() {
        return Objects.hash(c3g.class, this.a);
    }

    public final String toString() {
        return ev6.x("ChaCha20Poly1305 Parameters (variant: ", String.valueOf(this.a), ")");
    }
}
