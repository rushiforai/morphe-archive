package defpackage;

import com.google.protobuf.CodedOutputStream$OutOfSpaceException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class aq1 {
    public static final Logger b = Logger.getLogger(aq1.class.getName());
    public static final boolean c = r2e.e;
    public zm7 a;

    public static int a(int i, f21 f21Var) {
        return b(f21Var) + h(i);
    }

    public static int b(f21 f21Var) {
        int size = f21Var.size();
        return j(size) + size;
    }

    public static int c(int i) {
        return h(i) + 4;
    }

    public static int d(int i) {
        return h(i) + 8;
    }

    public static int e(int i, cz7 cz7Var, brb brbVar) {
        return ((r1) cz7Var).getSerializedSize(brbVar) + (h(i) * 2);
    }

    public static int f(int i) {
        if (i >= 0) {
            return j(i);
        }
        return 10;
    }

    public static int g(String str) {
        int length;
        try {
            length = toe.a(str);
        } catch (roe unused) {
            length = str.getBytes(v56.a).length;
        }
        return j(length) + length;
    }

    public static int h(int i) {
        return j(i << 3);
    }

    public static int i(int i, int i2) {
        return j(i2) + h(i);
    }

    public static int j(int i) {
        if ((i & (-128)) == 0) {
            return 1;
        }
        if ((i & (-16384)) == 0) {
            return 2;
        }
        if (((-2097152) & i) == 0) {
            return 3;
        }
        return (i & (-268435456)) == 0 ? 4 : 5;
    }

    public static int k(long j) {
        int i;
        if (((-128) & j) == 0) {
            return 1;
        }
        if (j < 0) {
            return 10;
        }
        if (((-34359738368L) & j) != 0) {
            j >>>= 28;
            i = 6;
        } else {
            i = 2;
        }
        if (((-2097152) & j) != 0) {
            i += 2;
            j >>>= 14;
        }
        return (j & (-16384)) != 0 ? i + 1 : i;
    }

    public abstract void A(int i, String str);

    public abstract void B(String str);

    public abstract void C(int i, int i2);

    public abstract void D(int i, int i2);

    public abstract void E(int i);

    public abstract void F(int i, long j);

    public abstract void G(long j);

    public final void l(String str, roe roeVar) throws CodedOutputStream$OutOfSpaceException {
        b.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) roeVar);
        byte[] bytes = str.getBytes(v56.a);
        try {
            E(bytes.length);
            x(bytes, 0, bytes.length);
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(e);
        }
    }

    public abstract void m(byte b2);

    public abstract void n(int i, boolean z);

    public abstract void o(int i, byte[] bArr);

    public abstract void p(int i, f21 f21Var);

    public abstract void q(f21 f21Var);

    public abstract void r(int i, int i2);

    public abstract void s(int i);

    public abstract void t(int i, long j);

    public abstract void u(long j);

    public abstract void v(int i, int i2);

    public abstract void w(int i);

    public abstract void x(byte[] bArr, int i, int i2);

    public abstract void y(int i, cz7 cz7Var, brb brbVar);

    public abstract void z(cz7 cz7Var);
}
