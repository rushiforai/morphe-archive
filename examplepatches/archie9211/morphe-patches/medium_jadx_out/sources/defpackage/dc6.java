package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class dc6 {
    public int d() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public final uc6 e() {
        if (this instanceof uc6) {
            return (uc6) this;
        }
        ik4.o("Not a JSON Object: ", this);
        return null;
    }

    public long f() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public String m() {
        throw new UnsupportedOperationException(getClass().getSimpleName());
    }

    public final String toString() {
        try {
            StringBuilder sb = new StringBuilder();
            yd6 yd6Var = new yd6(new auc(sb));
            yd6Var.U(euc.LENIENT);
            jc6.a.getClass();
            jc6.g(yd6Var, this);
            return sb.toString();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }
}
