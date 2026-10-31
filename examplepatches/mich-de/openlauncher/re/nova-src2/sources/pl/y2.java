package pl;

/* loaded from: classes3.dex */
public final class y2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final y2 DEFAULT_INSTANCE;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int SALT_SIZE_FIELD_NUMBER = 1;
    private int saltSize_;

    static {
        y2 y2Var = new y2();
        DEFAULT_INSTANCE = y2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(y2.class, y2Var);
    }

    public static void v(y2 y2Var, int i5) {
        y2Var.saltSize_ = i5;
    }

    public static y2 w() {
        return DEFAULT_INSTANCE;
    }

    public static x2 y() {
        return (x2) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"saltSize_"});
        }
        if (iF == 3) {
            return new y2();
        }
        if (iF == 4) {
            return new x2(DEFAULT_INSTANCE);
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
        synchronized (y2.class) {
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
        return this.saltSize_;
    }
}
