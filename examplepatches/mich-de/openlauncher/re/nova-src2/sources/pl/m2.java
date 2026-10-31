package pl;

/* loaded from: classes3.dex */
public final class m2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final m2 DEFAULT_INSTANCE;
    public static final int MODULUS_SIZE_IN_BITS_FIELD_NUMBER = 2;
    public static final int PARAMS_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PUBLIC_EXPONENT_FIELD_NUMBER = 3;
    private int bitField0_;
    private int modulusSizeInBits_;
    private o2 params_;
    private com.google.crypto.tink.shaded.protobuf.i publicExponent_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;

    static {
        m2 m2Var = new m2();
        DEFAULT_INSTANCE = m2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(m2.class, m2Var);
    }

    public static l2 B() {
        return (l2) DEFAULT_INSTANCE.g();
    }

    public static m2 C(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (m2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(m2 m2Var, o2 o2Var) {
        m2Var.getClass();
        m2Var.params_ = o2Var;
        m2Var.bitField0_ |= 1;
    }

    public static void w(m2 m2Var, int i5) {
        m2Var.modulusSizeInBits_ = i5;
    }

    public static void x(m2 m2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        m2Var.getClass();
        m2Var.publicExponent_ = gVar;
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
            return new m2();
        }
        if (iF == 4) {
            return new l2(DEFAULT_INSTANCE);
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
        synchronized (m2.class) {
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

    public final o2 z() {
        o2 o2Var = this.params_;
        return o2Var == null ? o2.y() : o2Var;
    }
}
