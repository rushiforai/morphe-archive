package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cx7 {
    public final String a;
    public final Map b;

    public cx7(String str, Map map) {
        this.a = str;
        this.b = nk7.A0(map);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cx7)) {
            return false;
        }
        cx7 cx7Var = (cx7) obj;
        return g76.L(this.a, cx7Var.a) && g76.L(this.b, cx7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Key(key=" + this.a + ", extras=" + this.b + ')';
    }
}
