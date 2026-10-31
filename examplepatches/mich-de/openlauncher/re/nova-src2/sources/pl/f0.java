package pl;

/* loaded from: classes.dex */
public final class f0 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final f0 DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private int version_;

    static {
        f0 f0Var = new f0();
        DEFAULT_INSTANCE = f0Var;
        com.google.crypto.tink.shaded.protobuf.x.t(f0.class, f0Var);
    }

    public static f0 A(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (f0) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 B() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(f0 f0Var, com.google.crypto.tink.shaded.protobuf.g gVar) {
        f0Var.getClass();
        f0Var.keyValue_ = gVar;
    }

    public static e0 z() {
        return (e0) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u000b\u0002\n", new Object[]{"version_", "keyValue_"});
        }
        if (iF == 3) {
            return new f0();
        }
        if (iF == 4) {
            return new e0();
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
        synchronized (f0.class) {
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
