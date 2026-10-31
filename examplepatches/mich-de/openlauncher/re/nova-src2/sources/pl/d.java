package pl;

/* loaded from: classes3.dex */
public final class d extends com.google.crypto.tink.shaded.protobuf.x {
    private static final d DEFAULT_INSTANCE;
    public static final int KEY_SIZE_FIELD_NUMBER = 1;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int bitField0_;
    private int keySize_;
    private f params_;

    static {
        d dVar = new d();
        DEFAULT_INSTANCE = dVar;
        com.google.crypto.tink.shaded.protobuf.x.t(d.class, dVar);
    }

    public static d A(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (d) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(d dVar, int i5) {
        dVar.keySize_ = i5;
    }

    public static void w(d dVar, f fVar) {
        dVar.getClass();
        dVar.params_ = fVar;
        dVar.bitField0_ |= 1;
    }

    public static c z() {
        return (c) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000", new Object[]{"bitField0_", "keySize_", "params_"});
        }
        if (iF == 3) {
            return new d();
        }
        if (iF == 4) {
            return new c(DEFAULT_INSTANCE);
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
        synchronized (d.class) {
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

    public final int x() {
        return this.keySize_;
    }

    public final f y() {
        f fVar = this.params_;
        return fVar == null ? f.w() : fVar;
    }
}
