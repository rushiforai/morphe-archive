package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class esg extends dlg {
    public final b3g a;

    public esg(b3g b3gVar) {
        this.a = b3gVar;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof esg) && ((esg) obj).a == this.a;
    }

    public final int hashCode() {
        return Objects.hash(esg.class, this.a);
    }

    public final String toString() {
        String str = this.a.b;
        return y30.s(new StringBuilder(str.length() + 30), "Ed25519 Parameters (variant: ", str, ")");
    }
}
