package pl;

/* loaded from: classes3.dex */
public final class n1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final n1 DEFAULT_INSTANCE;
    public static final int KEY_DATA_FIELD_NUMBER = 1;
    public static final int KEY_ID_FIELD_NUMBER = 3;
    public static final int OUTPUT_PREFIX_TYPE_FIELD_NUMBER = 4;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int STATUS_FIELD_NUMBER = 2;
    private int bitField0_;
    private g1 keyData_;
    private int keyId_;
    private int outputPrefixType_;
    private int status_;

    static {
        n1 n1Var = new n1();
        DEFAULT_INSTANCE = n1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(n1.class, n1Var);
    }

    public static m1 E() {
        return (m1) DEFAULT_INSTANCE.g();
    }

    public static void v(n1 n1Var, g1 g1Var) {
        n1Var.getClass();
        n1Var.keyData_ = g1Var;
        n1Var.bitField0_ |= 1;
    }

    public static void w(n1 n1Var, b2 b2Var) {
        n1Var.getClass();
        n1Var.outputPrefixType_ = b2Var.getNumber();
    }

    public static void x(n1 n1Var, h1 h1Var) {
        n1Var.getClass();
        n1Var.status_ = h1Var.getNumber();
    }

    public static void y(n1 n1Var, int i5) {
        n1Var.keyId_ = i5;
    }

    public final int A() {
        return this.keyId_;
    }

    public final b2 B() {
        b2 b2VarA = b2.a(this.outputPrefixType_);
        return b2VarA == null ? b2.UNRECOGNIZED : b2VarA;
    }

    public final h1 C() {
        int i5 = this.status_;
        h1 h1Var = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? null : h1.DESTROYED : h1.DISABLED : h1.ENABLED : h1.UNKNOWN_STATUS;
        return h1Var == null ? h1.UNRECOGNIZED : h1Var;
    }

    public final boolean D() {
        return (this.bitField0_ & 1) != 0;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002\f\u0003\u000b\u0004\f", new Object[]{"bitField0_", "keyData_", "status_", "keyId_", "outputPrefixType_"});
        }
        if (iF == 3) {
            return new n1();
        }
        if (iF == 4) {
            return new m1(DEFAULT_INSTANCE);
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
        synchronized (n1.class) {
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

    public final g1 z() {
        g1 g1Var = this.keyData_;
        return g1Var == null ? g1.y() : g1Var;
    }
}
