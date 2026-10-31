package pl;

/* loaded from: classes3.dex */
public final class u2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final u2 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 3;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private y2 params_;
    private int version_;

    static {
        u2 u2Var = new u2();
        DEFAULT_INSTANCE = u2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(u2.class, u2Var);
    }

    public static t2 A() {
        return (t2) DEFAULT_INSTANCE.g();
    }

    public static u2 B(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (u2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(u2 u2Var, y2 y2Var) {
        u2Var.getClass();
        u2Var.params_ = y2Var;
        u2Var.bitField0_ |= 1;
    }

    public static void w(u2 u2Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        u2Var.getClass();
        u2Var.keyValue_ = gVar;
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
            return new u2();
        }
        if (iF == 4) {
            return new t2(DEFAULT_INSTANCE);
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
        synchronized (u2.class) {
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

    public final com.google.crypto.tink.shaded.protobuf.i x() {
        return this.keyValue_;
    }

    public final y2 y() {
        y2 y2Var = this.params_;
        return y2Var == null ? y2.w() : y2Var;
    }

    public final int z() {
        return this.version_;
    }
}
