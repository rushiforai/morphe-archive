package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m5g extends t0g {
    public final d1g a;

    public m5g(d1g d1gVar) {
        this.a = d1gVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.a != d1g.r;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof m5g) && ((m5g) obj).a == this.a;
    }

    public final int hashCode() {
        return Objects.hash(m5g.class, this.a);
    }

    public final String toString() {
        return ev6.x("XChaCha20Poly1305 Parameters (variant: ", String.valueOf(this.a), ")");
    }
}
