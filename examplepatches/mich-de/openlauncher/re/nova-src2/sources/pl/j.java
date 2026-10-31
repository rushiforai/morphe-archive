package pl;

/* loaded from: classes3.dex */
public final class j extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int AES_CTR_KEY_FORMAT_FIELD_NUMBER = 1;
    private static final j DEFAULT_INSTANCE;
    public static final int HMAC_KEY_FORMAT_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private n aesCtrKeyFormat_;
    private int bitField0_;
    private b1 hmacKeyFormat_;

    static {
        j jVar = new j();
        DEFAULT_INSTANCE = jVar;
        com.google.crypto.tink.shaded.protobuf.x.t(j.class, jVar);
    }

    public static j A(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (j) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(j jVar, n nVar) {
        jVar.getClass();
        jVar.aesCtrKeyFormat_ = nVar;
        jVar.bitField0_ |= 1;
    }

    public static void w(j jVar, b1 b1Var) {
        jVar.getClass();
        jVar.hmacKeyFormat_ = b1Var;
        jVar.bitField0_ |= 2;
    }

    public static i z() {
        return (i) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"bitField0_", "aesCtrKeyFormat_", "hmacKeyFormat_"});
        }
        if (iF == 3) {
            return new j();
        }
        if (iF == 4) {
            return new i(DEFAULT_INSTANCE);
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
        synchronized (j.class) {
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

    public final n x() {
        n nVar = this.aesCtrKeyFormat_;
        return nVar == null ? n.x() : nVar;
    }

    public final b1 y() {
        b1 b1Var = this.hmacKeyFormat_;
        return b1Var == null ? b1.x() : b1Var;
    }
}
