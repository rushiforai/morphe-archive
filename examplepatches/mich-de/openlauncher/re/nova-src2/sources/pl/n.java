package pl;

/* loaded from: classes3.dex */
public final class n extends com.google.crypto.tink.shaded.protobuf.x {
    private static final n DEFAULT_INSTANCE;
    public static final int KEY_SIZE_FIELD_NUMBER = 2;
    public static final int PARAMS_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int bitField0_;
    private int keySize_;
    private p params_;

    static {
        n nVar = new n();
        DEFAULT_INSTANCE = nVar;
        com.google.crypto.tink.shaded.protobuf.x.t(n.class, nVar);
    }

    public static m A() {
        return (m) DEFAULT_INSTANCE.g();
    }

    public static void v(n nVar, p pVar) {
        nVar.getClass();
        nVar.params_ = pVar;
        nVar.bitField0_ |= 1;
    }

    public static void w(n nVar, int i5) {
        nVar.keySize_ = i5;
    }

    public static n x() {
        return DEFAULT_INSTANCE;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b", new Object[]{"bitField0_", "params_", "keySize_"});
        }
        if (iF == 3) {
            return new n();
        }
        if (iF == 4) {
            return new m(DEFAULT_INSTANCE);
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
        synchronized (n.class) {
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

    public final int y() {
        return this.keySize_;
    }

    public final p z() {
        p pVar = this.params_;
        return pVar == null ? p.w() : pVar;
    }
}
