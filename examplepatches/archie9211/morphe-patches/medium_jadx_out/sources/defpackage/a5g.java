package defpackage;

import j$.util.Objects;
import java.security.GeneralSecurityException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a5g extends t0g {
    public final e1g a;
    public final int b;

    public a5g(e1g e1gVar, int i) {
        this.a = e1gVar;
        this.b = i;
    }

    public static a5g b(e1g e1gVar, int i) throws GeneralSecurityException {
        if (i >= 8 && i <= 12) {
            return new a5g(e1gVar, i);
        }
        ygf.l("Salt size must be between 8 and 12 bytes");
        return null;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.a != e1g.i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a5g)) {
            return false;
        }
        a5g a5gVar = (a5g) obj;
        return a5gVar.a == this.a && a5gVar.b == this.b;
    }

    public final int hashCode() {
        return Objects.hash(a5g.class, this.a, Integer.valueOf(this.b));
    }

    public final String toString() {
        return ho2.C(this.b, "X-AES-GCM Parameters (variant: ", String.valueOf(this.a), "salt_size_bytes: ", ")");
    }
}
