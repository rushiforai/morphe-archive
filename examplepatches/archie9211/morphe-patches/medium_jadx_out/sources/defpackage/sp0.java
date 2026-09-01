package defpackage;

import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sp0 {
    public final yp0 a;
    public final List b;
    public final byte[] c;

    public sp0(yp0 yp0Var, List list, byte[] bArr) {
        list.getClass();
        this.a = yp0Var;
        this.b = list;
        this.c = bArr;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!sp0.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        sp0 sp0Var = (sp0) obj;
        if (!this.a.equals(sp0Var.a) || !g76.L(this.b, sp0Var.b)) {
            return false;
        }
        byte[] bArr = sp0Var.c;
        byte[] bArr2 = this.c;
        return bArr2 != null ? bArr != null && Arrays.equals(bArr2, bArr) : bArr == null;
    }

    public final int hashCode() {
        int iP = wgd.p(this.a.a.hashCode() * 31, 31, this.b);
        byte[] bArr = this.c;
        return iP + (bArr != null ? Arrays.hashCode(bArr) : 0);
    }

    public final String toString() {
        String string = Arrays.toString(this.c);
        StringBuilder sb = new StringBuilder("BatchData(id=");
        sb.append(this.a);
        sb.append(", data=");
        sb.append(this.b);
        sb.append(", metadata=");
        return ka1.v(sb, string, ")");
    }
}
