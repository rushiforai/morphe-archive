package pl;

/* loaded from: classes.dex */
public final class h extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int AES_CTR_KEY_FIELD_NUMBER = 2;
    private static final h DEFAULT_INSTANCE;
    public static final int HMAC_KEY_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private l aesCtrKey_;
    private int bitField0_;
    private z0 hmacKey_;
    private int version_;

    static {
        h hVar = new h();
        DEFAULT_INSTANCE = hVar;
        com.google.crypto.tink.shaded.protobuf.x.t(h.class, hVar);
    }

    public static g B() {
        return (g) DEFAULT_INSTANCE.g();
    }

    public static h C(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (h) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 D() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(h hVar, l lVar) {
        hVar.getClass();
        hVar.aesCtrKey_ = lVar;
        hVar.bitField0_ |= 1;
    }

    public static void x(h hVar, z0 z0Var) {
        hVar.getClass();
        hVar.hmacKey_ = z0Var;
        hVar.bitField0_ |= 2;
    }

    public final int A() {
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003ဉ\u0001", new Object[]{"bitField0_", "version_", "aesCtrKey_", "hmacKey_"});
        }
        if (iF == 3) {
            return new h();
        }
        if (iF == 4) {
            return new g();
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
        synchronized (h.class) {
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

    public final l y() {
        l lVar = this.aesCtrKey_;
        return lVar == null ? l.x() : lVar;
    }

    public final z0 z() {
        z0 z0Var = this.hmacKey_;
        return z0Var == null ? z0.y() : z0Var;
    }
}
