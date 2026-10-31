package pl;

/* loaded from: classes3.dex */
public final class l0 extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int CURVE_FIELD_NUMBER = 2;
    private static final l0 DEFAULT_INSTANCE;
    public static final int ENCODING_FIELD_NUMBER = 3;
    public static final int HASH_TYPE_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int curve_;
    private int encoding_;
    private int hashType_;

    static {
        l0 l0Var = new l0();
        DEFAULT_INSTANCE = l0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(l0.class, l0Var);
    }

    public static k0 C() {
        return (k0) DEFAULT_INSTANCE.g();
    }

    public static void v(l0 l0Var, x0 x0Var) {
        l0Var.getClass();
        l0Var.hashType_ = x0Var.getNumber();
    }

    public static void w(l0 l0Var, w0 w0Var) {
        l0Var.getClass();
        l0Var.curve_ = w0Var.getNumber();
    }

    public static void x(l0 l0Var, q0 q0Var) {
        l0Var.getClass();
        l0Var.encoding_ = q0Var.getNumber();
    }

    public static l0 z() {
        return DEFAULT_INSTANCE;
    }

    public final q0 A() {
        int i5 = this.encoding_;
        q0 q0Var = i5 != 0 ? i5 != 1 ? i5 != 2 ? null : q0.DER : q0.IEEE_P1363 : q0.UNKNOWN_ENCODING;
        return q0Var == null ? q0.UNRECOGNIZED : q0Var;
    }

    public final x0 B() {
        x0 x0VarA = x0.a(this.hashType_);
        return x0VarA == null ? x0.UNRECOGNIZED : x0VarA;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u0003\f", new Object[]{"hashType_", "curve_", "encoding_"});
        }
        if (iF == 3) {
            return new l0();
        }
        if (iF == 4) {
            return new k0(DEFAULT_INSTANCE);
        }
        if (iF == 5) {
            return DEFAULT_INSTANCE;
        }
        if (iF != 6) {
            throw null;
        }
        com.google.crypto.tink.shaded.protobuf.t0 t0Var = PARSER;
        if (t0Var != null) {
            return t0Var;
        }
        synchronized (l0.class) {
            try {
                wVar = PARSER;
                if (wVar == null) {
                    wVar = new com.google.crypto.tink.shaded.protobuf.w();
                    PARSER = wVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return wVar;
    }

    public final w0 y() {
        int i5 = this.curve_;
        w0 w0Var = i5 != 0 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? null : w0.CURVE25519 : w0.NIST_P521 : w0.NIST_P384 : w0.NIST_P256 : w0.UNKNOWN_CURVE;
        return w0Var == null ? w0.UNRECOGNIZED : w0Var;
    }
}
