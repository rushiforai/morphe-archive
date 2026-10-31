package pl;

/* loaded from: classes.dex */
public final class z0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final z0 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 3;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private d1 params_;
    private int version_;

    static {
        z0 z0Var = new z0();
        DEFAULT_INSTANCE = z0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(z0.class, z0Var);
    }

    public static y0 C() {
        return (y0) DEFAULT_INSTANCE.g();
    }

    public static z0 D(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (z0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 E() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(z0 z0Var, d1 d1Var) {
        z0Var.getClass();
        z0Var.params_ = d1Var;
        z0Var.bitField0_ |= 1;
    }

    public static void x(z0 z0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        z0Var.getClass();
        z0Var.keyValue_ = gVar;
    }

    public static z0 y() {
        return DEFAULT_INSTANCE;
    }

    public final d1 A() {
        d1 d1Var = this.params_;
        return d1Var == null ? d1.x() : d1Var;
    }

    public final int B() {
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"bitField0_", "version_", "params_", "keyValue_"});
        }
        if (iF == 3) {
            return new z0();
        }
        if (iF == 4) {
            return new y0();
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
        synchronized (z0.class) {
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
        return this.keyValue_;
    }
}
