package pl;

/* loaded from: classes3.dex */
public final class j1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final j1 DEFAULT_INSTANCE;
    public static final int OUTPUT_PREFIX_TYPE_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int TYPE_URL_FIELD_NUMBER = 1;
    public static final int VALUE_FIELD_NUMBER = 2;
    private int outputPrefixType_;
    private String typeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private com.google.crypto.tink.shaded.protobuf.i value_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;

    static {
        j1 j1Var = new j1();
        DEFAULT_INSTANCE = j1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(j1.class, j1Var);
    }

    public static i1 C() {
        return (i1) DEFAULT_INSTANCE.g();
    }

    public static j1 D(byte[] bArr, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (j1) com.google.crypto.tink.shaded.protobuf.x.s(DEFAULT_INSTANCE, bArr, pVar);
    }

    public static void v(j1 j1Var, String str) {
        j1Var.getClass();
        str.getClass();
        j1Var.typeUrl_ = str;
    }

    public static void w(j1 j1Var, com.google.crypto.tink.shaded.protobuf.i iVar) {
        j1Var.getClass();
        iVar.getClass();
        j1Var.value_ = iVar;
    }

    public static void x(j1 j1Var, b2 b2Var) {
        j1Var.getClass();
        j1Var.outputPrefixType_ = b2Var.getNumber();
    }

    public static j1 y() {
        return DEFAULT_INSTANCE;
    }

    public final String A() {
        return this.typeUrl_;
    }

    public final com.google.crypto.tink.shaded.protobuf.i B() {
        return this.value_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\n\u0003\f", new Object[]{"typeUrl_", "value_", "outputPrefixType_"});
        }
        if (iF == 3) {
            return new j1();
        }
        if (iF == 4) {
            return new i1(DEFAULT_INSTANCE);
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
        synchronized (j1.class) {
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

    public final b2 z() {
        b2 b2VarA = b2.a(this.outputPrefixType_);
        return b2VarA == null ? b2.UNRECOGNIZED : b2VarA;
    }
}
