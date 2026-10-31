package pl;

/* loaded from: classes.dex */
public final class u1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final u1 DEFAULT_INSTANCE;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private w1 params_;
    private int version_;

    static {
        u1 u1Var = new u1();
        DEFAULT_INSTANCE = u1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(u1.class, u1Var);
    }

    public static u1 A(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (u1) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 B() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(u1 u1Var, w1 w1Var) {
        u1Var.getClass();
        u1Var.params_ = w1Var;
        u1Var.bitField0_ |= 1;
    }

    public static t1 z() {
        return (t1) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000", new Object[]{"bitField0_", "version_", "params_"});
        }
        if (iF == 3) {
            return new u1();
        }
        if (iF == 4) {
            return new t1();
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
        synchronized (u1.class) {
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

    public final w1 x() {
        w1 w1Var = this.params_;
        return w1Var == null ? w1.w() : w1Var;
    }

    public final int y() {
        return this.version_;
    }
}
