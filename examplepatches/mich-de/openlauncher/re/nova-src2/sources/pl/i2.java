package pl;

/* loaded from: classes3.dex */
public final class i2 extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int CRT_FIELD_NUMBER = 8;
    private static final i2 DEFAULT_INSTANCE;
    public static final int DP_FIELD_NUMBER = 6;
    public static final int DQ_FIELD_NUMBER = 7;
    public static final int D_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PUBLIC_KEY_FIELD_NUMBER = 2;
    public static final int P_FIELD_NUMBER = 4;
    public static final int Q_FIELD_NUMBER = 5;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i crt_;
    private com.google.crypto.tink.shaded.protobuf.i d_;
    private com.google.crypto.tink.shaded.protobuf.i dp_;
    private com.google.crypto.tink.shaded.protobuf.i dq_;
    private com.google.crypto.tink.shaded.protobuf.i p_;
    private k2 publicKey_;
    private com.google.crypto.tink.shaded.protobuf.i q_;
    private int version_;

    static {
        i2 i2Var = new i2();
        DEFAULT_INSTANCE = i2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(i2.class, i2Var);
    }

    public i2() {
        com.google.crypto.tink.shaded.protobuf.g gVar = com.google.crypto.tink.shaded.protobuf.i.f34608b;
        this.d_ = gVar;
        this.p_ = gVar;
        this.q_ = gVar;
        this.dp_ = gVar;
        this.dq_ = gVar;
        this.crt_ = gVar;
    }

    public static void A(i2 i2Var, k2 k2Var) {
        i2Var.getClass();
        i2Var.publicKey_ = k2Var;
        i2Var.bitField0_ |= 1;
    }

    public static void B(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.d_ = gVar;
    }

    public static void C(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.p_ = gVar;
    }

    public static h2 L() {
        return (h2) DEFAULT_INSTANCE.g();
    }

    public static i2 M(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (i2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 N() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(i2 i2Var) {
        i2Var.version_ = 0;
    }

    public static void w(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.q_ = gVar;
    }

    public static void x(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.dp_ = gVar;
    }

    public static void y(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.dq_ = gVar;
    }

    public static void z(i2 i2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        i2Var.getClass();
        i2Var.crt_ = gVar;
    }

    public final com.google.crypto.tink.shaded.protobuf.i D() {
        return this.crt_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i E() {
        return this.d_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i F() {
        return this.dp_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i G() {
        return this.dq_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i H() {
        return this.p_;
    }

    public final k2 I() {
        k2 k2Var = this.publicKey_;
        return k2Var == null ? k2.y() : k2Var;
    }

    public final com.google.crypto.tink.shaded.protobuf.i J() {
        return this.q_;
    }

    public final int K() {
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\b\u0000\u0001\u0001\b\b\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n\u0005\n\u0006\n\u0007\n\b\n", new Object[]{"bitField0_", "version_", "publicKey_", "d_", "p_", "q_", "dp_", "dq_", "crt_"});
        }
        if (iF == 3) {
            return new i2();
        }
        if (iF == 4) {
            return new h2(DEFAULT_INSTANCE);
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
        synchronized (i2.class) {
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
}
