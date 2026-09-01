package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ca7 {
    public final w3 a;
    public final ce0 b;
    public final Set c;
    public final Set d;

    public ca7(w3 w3Var, ce0 ce0Var, Set set, Set set2) {
        this.a = w3Var;
        this.b = ce0Var;
        this.c = set;
        this.d = set2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ca7)) {
            return false;
        }
        ca7 ca7Var = (ca7) obj;
        return this.a.equals(ca7Var.a) && g76.L(this.b, ca7Var.b) && this.c.equals(ca7Var.c) && this.d.equals(ca7Var.d);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        ce0 ce0Var = this.b;
        return this.d.hashCode() + ((this.c.hashCode() + ((iHashCode + (ce0Var == null ? 0 : ce0Var.hashCode())) * 31)) * 31);
    }

    public final String toString() {
        return "LoginResult(accessToken=" + this.a + ", authenticationToken=" + this.b + ", recentlyGrantedPermissions=" + this.c + ", recentlyDeniedPermissions=" + this.d + ')';
    }
}
