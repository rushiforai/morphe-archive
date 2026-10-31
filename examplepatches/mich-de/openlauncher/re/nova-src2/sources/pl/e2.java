package pl;

/* loaded from: classes3.dex */
public final class e2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final e2 DEFAULT_INSTANCE;
    public static final int MODULUS_SIZE_IN_BITS_FIELD_NUMBER = 2;
    public static final int PARAMS_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PUBLIC_EXPONENT_FIELD_NUMBER = 3;
    private int bitField0_;
    private int modulusSizeInBits_;
    private g2 params_;
    private com.google.crypto.tink.shaded.protobuf.i publicExponent_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;

    static {
        e2 e2Var = new e2();
        DEFAULT_INSTANCE = e2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(e2.class, e2Var);
    }

    public static d2 B() {
        return (d2) DEFAULT_INSTANCE.g();
    }

    public static e2 C(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (e2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(e2 e2Var, g2 g2Var) {
        e2Var.getClass();
        e2Var.params_ = g2Var;
        e2Var.bitField0_ |= 1;
    }

    public static void w(e2 e2Var, int i5) {
        e2Var.modulusSizeInBits_ = i5;
    }

    public static void x(e2 e2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        e2Var.getClass();
        e2Var.publicExponent_ = gVar;
    }

    public final com.google.crypto.tink.shaded.protobuf.i A() {
        return this.publicExponent_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b\u0003\n", new Object[]{"bitField0_", "params_", "modulusSizeInBits_", "publicExponent_"});
        }
        if (iF == 3) {
            return new e2();
        }
        if (iF == 4) {
            return new d2(DEFAULT_INSTANCE);
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
        synchronized (e2.class) {
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

    public final int y() {
        return this.modulusSizeInBits_;
    }

    public final g2 z() {
        g2 g2Var = this.params_;
        return g2Var == null ? g2.w() : g2Var;
    }
}
