package pl;

/* loaded from: classes3.dex */
public final class g2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final g2 DEFAULT_INSTANCE;
    public static final int HASH_TYPE_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int hashType_;

    static {
        g2 g2Var = new g2();
        DEFAULT_INSTANCE = g2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(g2.class, g2Var);
    }

    public static void v(g2 g2Var, x0 x0Var) {
        g2Var.getClass();
        g2Var.hashType_ = x0Var.getNumber();
    }

    public static g2 w() {
        return DEFAULT_INSTANCE;
    }

    public static f2 y() {
        return (f2) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\f", new Object[]{"hashType_"});
        }
        if (iF == 3) {
            return new g2();
        }
        if (iF == 4) {
            return new f2(DEFAULT_INSTANCE);
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
        synchronized (g2.class) {
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

    public final x0 x() {
        x0 x0VarA = x0.a(this.hashType_);
        return x0VarA == null ? x0.UNRECOGNIZED : x0VarA;
    }
}
