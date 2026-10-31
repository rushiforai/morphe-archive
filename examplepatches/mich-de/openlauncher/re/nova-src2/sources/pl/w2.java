package pl;

/* loaded from: classes3.dex */
public final class w2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final w2 DEFAULT_INSTANCE;
    public static final int PARAMS_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private y2 params_;
    private int version_;

    static {
        w2 w2Var = new w2();
        DEFAULT_INSTANCE = w2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(w2.class, w2Var);
    }

    public static void v(w2 w2Var, y2 y2Var) {
        w2Var.getClass();
        w2Var.params_ = y2Var;
        w2Var.bitField0_ |= 1;
    }

    public static v2 y() {
        return (v2) DEFAULT_INSTANCE.g();
    }

    public static w2 z(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (w2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0003\u0002\u0000\u0000\u0000\u0001\u000b\u0003ဉ\u0000", new Object[]{"bitField0_", "version_", "params_"});
        }
        if (iF == 3) {
            return new w2();
        }
        if (iF == 4) {
            return new v2(DEFAULT_INSTANCE);
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
        synchronized (w2.class) {
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

    public final y2 w() {
        y2 y2Var = this.params_;
        return y2Var == null ? y2.w() : y2Var;
    }

    public final int x() {
        return this.version_;
    }
}
