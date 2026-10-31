package pl;

/* loaded from: classes3.dex */
public final class p0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final p0 DEFAULT_INSTANCE;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    public static final int X_FIELD_NUMBER = 3;
    public static final int Y_FIELD_NUMBER = 4;
    private int bitField0_;
    private l0 params_;
    private int version_;
    private com.google.crypto.tink.shaded.protobuf.i x_;
    private com.google.crypto.tink.shaded.protobuf.i y_;

    static {
        p0 p0Var = new p0();
        DEFAULT_INSTANCE = p0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(p0.class, p0Var);
    }

    public p0() {
        com.google.crypto.tink.shaded.protobuf.g gVar = com.google.crypto.tink.shaded.protobuf.i.f34608b;
        this.x_ = gVar;
        this.y_ = gVar;
    }

    public static o0 D() {
        return (o0) DEFAULT_INSTANCE.g();
    }

    public static p0 E(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (p0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 F() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(p0 p0Var, l0 l0Var) {
        p0Var.getClass();
        p0Var.params_ = l0Var;
        p0Var.bitField0_ |= 1;
    }

    public static void w(p0 p0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        p0Var.getClass();
        p0Var.x_ = gVar;
    }

    public static void x(p0 p0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        p0Var.getClass();
        p0Var.y_ = gVar;
    }

    public static p0 y() {
        return DEFAULT_INSTANCE;
    }

    public final int A() {
        return this.version_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i B() {
        return this.x_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i C() {
        return this.y_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n\u0004\n", new Object[]{"bitField0_", "version_", "params_", "x_", "y_"});
        }
        if (iF == 3) {
            return new p0();
        }
        if (iF == 4) {
            return new o0(DEFAULT_INSTANCE);
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
        synchronized (p0.class) {
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

    public final l0 z() {
        l0 l0Var = this.params_;
        return l0Var == null ? l0.z() : l0Var;
    }
}
