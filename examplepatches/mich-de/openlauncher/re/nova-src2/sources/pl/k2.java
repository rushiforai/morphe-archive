package pl;

/* loaded from: classes3.dex */
public final class k2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final k2 DEFAULT_INSTANCE;
    public static final int E_FIELD_NUMBER = 4;
    public static final int N_FIELD_NUMBER = 3;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i e_;
    private com.google.crypto.tink.shaded.protobuf.i n_;
    private g2 params_;
    private int version_;

    static {
        k2 k2Var = new k2();
        DEFAULT_INSTANCE = k2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(k2.class, k2Var);
    }

    public k2() {
        com.google.crypto.tink.shaded.protobuf.g gVar = com.google.crypto.tink.shaded.protobuf.i.f34608b;
        this.n_ = gVar;
        this.e_ = gVar;
    }

    public static j2 D() {
        return (j2) DEFAULT_INSTANCE.g();
    }

    public static k2 E(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (k2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 F() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(k2 k2Var, g2 g2Var) {
        k2Var.getClass();
        k2Var.params_ = g2Var;
        k2Var.bitField0_ |= 1;
    }

    public static void w(k2 k2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        k2Var.getClass();
        k2Var.n_ = gVar;
    }

    public static void x(k2 k2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        k2Var.getClass();
        k2Var.e_ = gVar;
    }

    public static k2 y() {
        return DEFAULT_INSTANCE;
    }

    public final com.google.crypto.tink.shaded.protobuf.i A() {
        return this.n_;
    }

    public final g2 B() {
        g2 g2Var = this.params_;
        return g2Var == null ? g2.w() : g2Var;
    }

    public final int C() {
        return this.version_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n", new Object[]{"bitField0_", "version_", "params_", "n_", "e_"});
        }
        if (iF == 3) {
            return new k2();
        }
        if (iF == 4) {
            return new j2(DEFAULT_INSTANCE);
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
        synchronized (k2.class) {
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

    public final com.google.crypto.tink.shaded.protobuf.i z() {
        return this.e_;
    }
}
