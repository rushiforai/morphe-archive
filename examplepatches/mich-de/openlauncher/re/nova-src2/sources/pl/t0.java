package pl;

/* loaded from: classes3.dex */
public final class t0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final t0 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PUBLIC_KEY_FIELD_NUMBER = 3;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private v0 publicKey_;
    private int version_;

    static {
        t0 t0Var = new t0();
        DEFAULT_INSTANCE = t0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(t0.class, t0Var);
    }

    public static s0 A() {
        return (s0) DEFAULT_INSTANCE.g();
    }

    public static t0 B(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (t0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 C() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(t0 t0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        t0Var.getClass();
        t0Var.keyValue_ = gVar;
    }

    public static void w(t0 t0Var, v0 v0Var) {
        t0Var.getClass();
        t0Var.publicKey_ = v0Var;
        t0Var.bitField0_ |= 1;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002\n\u0003ဉ\u0000", new Object[]{"bitField0_", "version_", "keyValue_", "publicKey_"});
        }
        if (iF == 3) {
            return new t0();
        }
        if (iF == 4) {
            return new s0(DEFAULT_INSTANCE);
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
        synchronized (t0.class) {
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

    public final v0 y() {
        v0 v0Var = this.publicKey_;
        return v0Var == null ? v0.w() : v0Var;
    }

    public final int z() {
        return this.version_;
    }
}
