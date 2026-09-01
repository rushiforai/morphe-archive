package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p66 {
    public final String a;

    public p66(String str) {
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof p66) {
            return en7.u(this.a, ((p66) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        hx4Var.a("token", this.a);
        return hx4Var.toString();
    }
}
