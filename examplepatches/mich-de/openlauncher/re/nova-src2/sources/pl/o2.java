package pl;

/* loaded from: classes3.dex */
public final class o2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final o2 DEFAULT_INSTANCE;
    public static final int MGF1_HASH_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int SALT_LENGTH_FIELD_NUMBER = 3;
    public static final int SIG_HASH_FIELD_NUMBER = 1;
    private int mgf1Hash_;
    private int saltLength_;
    private int sigHash_;

    static {
        o2 o2Var = new o2();
        DEFAULT_INSTANCE = o2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(o2.class, o2Var);
    }

    public static n2 C() {
        return (n2) DEFAULT_INSTANCE.g();
    }

    public static void v(o2 o2Var, x0 x0Var) {
        o2Var.getClass();
        o2Var.sigHash_ = x0Var.getNumber();
    }

    public static void w(o2 o2Var, x0 x0Var) {
        o2Var.getClass();
        o2Var.mgf1Hash_ = x0Var.getNumber();
    }

    public static void x(o2 o2Var, int i5) {
        o2Var.saltLength_ = i5;
    }

    public static o2 y() {
        return DEFAULT_INSTANCE;
    }

    public final int A() {
        return this.saltLength_;
    }

    public final x0 B() {
        x0 x0VarA = x0.a(this.sigHash_);
        return x0VarA == null ? x0.UNRECOGNIZED : x0VarA;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001\f\u0002\f\u0003\u0004", new Object[]{"sigHash_", "mgf1Hash_", "saltLength_"});
        }
        if (iF == 3) {
            return new o2();
        }
        if (iF == 4) {
            return new n2(DEFAULT_INSTANCE);
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
        synchronized (o2.class) {
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

    public final x0 z() {
        x0 x0VarA = x0.a(this.mgf1Hash_);
        return x0VarA == null ? x0.UNRECOGNIZED : x0VarA;
    }
}
