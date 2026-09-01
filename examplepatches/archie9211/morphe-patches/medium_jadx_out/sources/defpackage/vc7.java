package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vc7 {
    public final bc7 a;
    public final Throwable b;

    public vc7(bc7 bc7Var) {
        this.a = bc7Var;
        this.b = null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vc7)) {
            return false;
        }
        vc7 vc7Var = (vc7) obj;
        bc7 bc7Var = this.a;
        if (bc7Var != null && bc7Var == vc7Var.a) {
            return true;
        }
        Throwable th = this.b;
        if (th == null || vc7Var.b == null) {
            return false;
        }
        return th.toString().equals(th.toString());
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    public vc7(Throwable th) {
        this.b = th;
        this.a = null;
    }
}
