package pl;

/* loaded from: classes.dex */
public final class a3 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final a3 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private int version_;

    static {
        a3 a3Var = new a3();
        DEFAULT_INSTANCE = a3Var;
        com.google.crypto.tink.shaded.protobuf.x.t(a3.class, a3Var);
    }

    public static a3 A(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (a3) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 B() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(a3 a3Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        a3Var.getClass();
        a3Var.keyValue_ = gVar;
    }

    public static z2 z() {
        return (z2) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0003\u0002\u0000\u0000\u0000\u0001\u000b\u0003\n", new Object[]{"version_", "keyValue_"});
        }
        if (iF == 3) {
            return new a3();
        }
        if (iF == 4) {
            return new z2();
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
        synchronized (a3.class) {
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

    public final com.google.crypto.tink.shaded.protobuf.i x() {
        return this.keyValue_;
    }

    public final int y() {
        return this.version_;
    }
}
