package pl;

/* loaded from: classes3.dex */
public final class b1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final b1 DEFAULT_INSTANCE;
    public static final int KEY_SIZE_FIELD_NUMBER = 2;
    public static final int PARAMS_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 3;
    private int bitField0_;
    private int keySize_;
    private d1 params_;
    private int version_;

    static {
        b1 b1Var = new b1();
        DEFAULT_INSTANCE = b1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(b1.class, b1Var);
    }

    public static a1 B() {
        return (a1) DEFAULT_INSTANCE.g();
    }

    public static b1 C(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (b1) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(b1 b1Var, d1 d1Var) {
        b1Var.getClass();
        b1Var.params_ = d1Var;
        b1Var.bitField0_ |= 1;
    }

    public static void w(b1 b1Var, int i5) {
        b1Var.keySize_ = i5;
    }

    public static b1 x() {
        return DEFAULT_INSTANCE;
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002\u000b\u0003\u000b", new Object[]{"bitField0_", "params_", "keySize_", "version_"});
        }
        if (iF == 3) {
            return new b1();
        }
        if (iF == 4) {
            return new a1(DEFAULT_INSTANCE);
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
        synchronized (b1.class) {
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

    public final d1 z() {
        d1 d1Var = this.params_;
        return d1Var == null ? d1.x() : d1Var;
    }
}
