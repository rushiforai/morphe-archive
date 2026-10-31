package pl;

/* loaded from: classes3.dex */
public final class w1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final w1 DEFAULT_INSTANCE;
    public static final int KEY_URI_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private String keyUri_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        w1 w1Var = new w1();
        DEFAULT_INSTANCE = w1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(w1.class, w1Var);
    }

    public static void v(w1 w1Var, String str) {
        w1Var.getClass();
        str.getClass();
        w1Var.keyUri_ = str;
    }

    public static w1 w() {
        return DEFAULT_INSTANCE;
    }

    public static v1 y() {
        return (v1) DEFAULT_INSTANCE.g();
    }

    public static w1 z(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (w1) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001Ȉ", new Object[]{"keyUri_"});
        }
        if (iF == 3) {
            return new w1();
        }
        if (iF == 4) {
            return new v1(DEFAULT_INSTANCE);
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
        synchronized (w1.class) {
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

    public final String x() {
        return this.keyUri_;
    }
}
