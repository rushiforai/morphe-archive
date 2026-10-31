package pl;

/* loaded from: classes3.dex */
public final class n0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final n0 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PUBLIC_KEY_FIELD_NUMBER = 2;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private p0 publicKey_;
    private int version_;

    static {
        n0 n0Var = new n0();
        DEFAULT_INSTANCE = n0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(n0.class, n0Var);
    }

    public static m0 A() {
        return (m0) DEFAULT_INSTANCE.g();
    }

    public static n0 B(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (n0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 C() {
        return DEFAULT_INSTANCE.k();
    }

    public static void v(n0 n0Var, p0 p0Var) {
        n0Var.getClass();
        n0Var.publicKey_ = p0Var;
        n0Var.bitField0_ |= 1;
    }

    public static void w(n0 n0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        n0Var.getClass();
        n0Var.keyValue_ = gVar;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"bitField0_", "version_", "publicKey_", "keyValue_"});
        }
        if (iF == 3) {
            return new n0();
        }
        if (iF == 4) {
            return new m0(DEFAULT_INSTANCE);
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
        synchronized (n0.class) {
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

    public final p0 y() {
        p0 p0Var = this.publicKey_;
        return p0Var == null ? p0.y() : p0Var;
    }

    public final int z() {
        return this.version_;
    }
}
