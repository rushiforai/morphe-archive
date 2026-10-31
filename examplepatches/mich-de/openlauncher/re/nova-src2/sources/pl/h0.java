package pl;

/* loaded from: classes3.dex */
public final class h0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final h0 DEFAULT_INSTANCE;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;

    static {
        h0 h0Var = new h0();
        DEFAULT_INSTANCE = h0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(h0.class, h0Var);
    }

    public static h0 v() {
        return DEFAULT_INSTANCE;
    }

    public static void w(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0000", null);
        }
        if (iF == 3) {
            return new h0();
        }
        if (iF == 4) {
            return new g0(DEFAULT_INSTANCE, 0);
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
        synchronized (h0.class) {
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
}
