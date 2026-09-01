package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fna implements ina {
    public final b24 a;

    public fna(b24 b24Var) {
        this.a = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof fna) && this.a.equals(((fna) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ho2.E("Error(errorState=", this.a, PdtluglzAX.njjYneKnm);
    }
}
