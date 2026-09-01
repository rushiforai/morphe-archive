package defpackage;

import android.util.Base64;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kk0 {
    public final String a;
    public final byte[] b;
    public final z0a c;

    public kk0(String str, byte[] bArr, z0a z0aVar) {
        this.a = str;
        this.b = bArr;
        this.c = z0aVar;
    }

    public static m50 a() {
        m50 m50Var = new m50(10, false);
        z0a z0aVar = z0a.DEFAULT;
        if (z0aVar != null) {
            m50Var.d = z0aVar;
            return m50Var;
        }
        z72.c("Null priority");
        return null;
    }

    public final kk0 b(z0a z0aVar) {
        m50 m50VarA = a();
        m50VarA.L(this.a);
        if (z0aVar == null) {
            z72.c("Null priority");
            return null;
        }
        m50VarA.d = z0aVar;
        m50VarA.c = this.b;
        return m50VarA.k();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof kk0) {
            kk0 kk0Var = (kk0) obj;
            if (this.a.equals(kk0Var.a) && Arrays.equals(this.b, kk0Var.b) && this.c.equals(kk0Var.c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.c.hashCode() ^ ((((this.a.hashCode() ^ 1000003) * 1000003) ^ Arrays.hashCode(this.b)) * 1000003);
    }

    public final String toString() {
        byte[] bArr = this.b;
        String strEncodeToString = bArr == null ? "" : Base64.encodeToString(bArr, 2);
        StringBuilder sb = new StringBuilder("TransportContext(");
        sb.append(this.a);
        sb.append(", ");
        sb.append(this.c);
        sb.append(", ");
        return ka1.v(sb, strEncodeToString, ")");
    }
}
