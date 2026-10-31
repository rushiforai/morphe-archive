package pl;

/* loaded from: classes3.dex */
public final class j0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final j0 DEFAULT_INSTANCE;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 3;
    private int bitField0_;
    private l0 params_;
    private int version_;

    static {
        j0 j0Var = new j0();
        DEFAULT_INSTANCE = j0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(j0.class, j0Var);
    }

    public static void v(j0 j0Var, l0 l0Var) {
        j0Var.getClass();
        j0Var.params_ = l0Var;
        j0Var.bitField0_ |= 1;
    }

    public static i0 x() {
        return (i0) DEFAULT_INSTANCE.g();
    }

    public static j0 y(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (j0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0002\u0003\u0002\u0000\u0000\u0000\u0002ဉ\u0000\u0003\u000b", new Object[]{"bitField0_", "params_", "version_"});
        }
        if (iF == 3) {
            return new j0();
        }
        if (iF == 4) {
            return new i0(DEFAULT_INSTANCE);
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
        synchronized (j0.class) {
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

    public final l0 w() {
        l0 l0Var = this.params_;
        return l0Var == null ? l0.z() : l0Var;
    }
}
