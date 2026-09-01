package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qmc implements rmc {
    public final String a;
    public final boolean b;

    public qmc(String str, boolean z) {
        str.getClass();
        this.a = str;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qmc)) {
            return false;
        }
        qmc qmcVar = (qmc) obj;
        return g76.L(this.a, qmcVar.a) && this.b == qmcVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z("ServiceChecked(name=", this.a, ", isEnabled=", ")", this.b);
    }
}
