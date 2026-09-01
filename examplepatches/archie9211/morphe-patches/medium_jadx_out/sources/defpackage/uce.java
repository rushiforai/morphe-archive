package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uce implements wce {
    public final b24 a;
    public final boolean b;

    public uce(b24 b24Var, boolean z) {
        this.a = b24Var;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uce)) {
            return false;
        }
        uce uceVar = (uce) obj;
        return this.a.equals(uceVar.a) && this.b == uceVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Error(errorState=" + this.a + ", isEligibleToOfflineMode=" + this.b + ")";
    }
}
