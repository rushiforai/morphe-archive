package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y3 implements Serializable {
    public final String a;
    public final String b;

    public y3(String str, String str2) {
        this.a = str2;
        this.b = epe.J(str) ? null : str;
    }

    private final Object writeReplace() {
        return new x3(this.a);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y3) {
            y3 y3Var = (y3) obj;
            String str = y3Var.b;
            String str2 = this.b;
            if ((str == null ? str2 == null : str.equals(str2)) && y3Var.a.equals(this.a)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.b;
        return this.a.hashCode() ^ (str != null ? str.hashCode() : 0);
    }
}
