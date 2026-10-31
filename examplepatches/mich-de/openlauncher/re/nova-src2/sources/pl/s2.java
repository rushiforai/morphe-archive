package pl;

/* loaded from: classes3.dex */
public final class s2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final s2 DEFAULT_INSTANCE;
    public static final int E_FIELD_NUMBER = 4;
    public static final int N_FIELD_NUMBER = 3;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i e_;
    private com.google.crypto.tink.shaded.protobuf.i n_;
    private o2 params_;
    private int version_;

    static {
        s2 s2Var = new s2();
        DEFAULT_INSTANCE = s2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(s2.class, s2Var);
    }

    public s2() {
        com.google.crypto.tink.shaded.protobuf.g gVar = com.google.crypto.tink.shaded.protobuf.i.f34608b;
        this.n_ = gVar;
        this.e_ = gVar;
    }

    public static r2 E() {
        return (r2) DEFAULT_INSTANCE.g();
    }

    public static s2 F(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (s2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 G() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(s2 s2Var) {
        s2Var.version_ = 0;
    }

    public static void w(s2 s2Var, o2 o2Var) {
        s2Var.getClass();
        s2Var.params_ = o2Var;
        s2Var.bitField0_ |= 1;
    }

    public static void x(s2 s2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        s2Var.getClass();
        s2Var.n_ = gVar;
    }

    public static void y(s2 s2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        s2Var.getClass();
        s2Var.e_ = gVar;
    }

    public static s2 z() {
        return DEFAULT_INSTANCE;
    }

    public final com.google.crypto.tink.shaded.protobuf.i A() {
        return this.e_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i B() {
        return this.n_;
    }

    public final o2 C() {
        o2 o2Var = this.params_;
        return o2Var == null ? o2.y() : o2Var;
    }

    public final int D() {
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
            return new s2();
        }
        if (iF == 4) {
            return new r2(DEFAULT_INSTANCE);
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
        synchronized (s2.class) {
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
