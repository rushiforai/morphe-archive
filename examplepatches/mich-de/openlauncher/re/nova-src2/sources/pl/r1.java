package pl;

/* loaded from: classes3.dex */
public final class r1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final r1 DEFAULT_INSTANCE;
    public static final int KEY_ID_FIELD_NUMBER = 3;
    public static final int OUTPUT_PREFIX_TYPE_FIELD_NUMBER = 4;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int STATUS_FIELD_NUMBER = 2;
    public static final int TYPE_URL_FIELD_NUMBER = 1;
    private int keyId_;
    private int outputPrefixType_;
    private int status_;
    private String typeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        r1 r1Var = new r1();
        DEFAULT_INSTANCE = r1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(r1.class, r1Var);
    }

    public static void v(r1 r1Var, String str) {
        r1Var.getClass();
        str.getClass();
        r1Var.typeUrl_ = str;
    }

    public static void w(r1 r1Var, b2 b2Var) {
        r1Var.getClass();
        r1Var.outputPrefixType_ = b2Var.getNumber();
    }

    public static void x(r1 r1Var, h1 h1Var) {
        r1Var.getClass();
        r1Var.status_ = h1Var.getNumber();
    }

    public static void y(r1 r1Var, int i5) {
        r1Var.keyId_ = i5;
    }

    public static q1 z() {
        return (q1) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0004\u0000\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001Ȉ\u0002\f\u0003\u000b\u0004\f", new Object[]{"typeUrl_", "status_", "keyId_", "outputPrefixType_"});
        }
        if (iF == 3) {
            return new r1();
        }
        if (iF == 4) {
            return new q1(DEFAULT_INSTANCE);
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
        synchronized (r1.class) {
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
