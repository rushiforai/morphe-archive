package pl;

/* loaded from: classes3.dex */
public final class q2 extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int CRT_FIELD_NUMBER = 8;
    private static final q2 DEFAULT_INSTANCE;
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
    private s2 publicKey_;
    private com.google.crypto.tink.shaded.protobuf.i q_;
    private int version_;

    static {
        q2 q2Var = new q2();
        DEFAULT_INSTANCE = q2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(q2.class, q2Var);
    }

    public q2() {
        com.google.crypto.tink.shaded.protobuf.g gVar = com.google.crypto.tink.shaded.protobuf.i.f34608b;
        this.d_ = gVar;
        this.p_ = gVar;
        this.q_ = gVar;
        this.dp_ = gVar;
        this.dq_ = gVar;
        this.crt_ = gVar;
    }

    public static void A(q2 q2Var, s2 s2Var) {
        q2Var.getClass();
        q2Var.publicKey_ = s2Var;
        q2Var.bitField0_ |= 1;
    }

    public static void B(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.d_ = gVar;
    }

    public static void C(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.p_ = gVar;
    }

    public static p2 L() {
        return (p2) DEFAULT_INSTANCE.g();
    }

    public static q2 M(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (q2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 N() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(q2 q2Var) {
        q2Var.version_ = 0;
    }

    public static void w(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.q_ = gVar;
    }

    public static void x(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.dp_ = gVar;
    }

    public static void y(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.dq_ = gVar;
    }

    public static void z(q2 q2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        q2Var.getClass();
        q2Var.crt_ = gVar;
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

    public final s2 I() {
        s2 s2Var = this.publicKey_;
        return s2Var == null ? s2.z() : s2Var;
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
            return new q2();
        }
        if (iF == 4) {
            return new p2(DEFAULT_INSTANCE);
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
        synchronized (q2.class) {
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
