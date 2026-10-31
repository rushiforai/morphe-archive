package pl;

/* loaded from: classes3.dex */
public final class p extends com.google.crypto.tink.shaded.protobuf.x {
    private static final p DEFAULT_INSTANCE;
    public static final int IV_SIZE_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int ivSize_;

    static {
        p pVar = new p();
        DEFAULT_INSTANCE = pVar;
        com.google.crypto.tink.shaded.protobuf.x.t(p.class, pVar);
    }

    public static void v(p pVar, int i5) {
        pVar.ivSize_ = i5;
    }

    public static p w() {
        return DEFAULT_INSTANCE;
    }

    public static o y() {
        return (o) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"ivSize_"});
        }
        if (iF == 3) {
            return new p();
        }
        if (iF == 4) {
            return new o(DEFAULT_INSTANCE);
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
        synchronized (p.class) {
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
        return this.ivSize_;
    }
}
