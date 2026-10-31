package pl;

/* loaded from: classes.dex */
public final class r extends com.google.crypto.tink.shaded.protobuf.x {
    private static final r DEFAULT_INSTANCE;
    public static final int KEY_VALUE_FIELD_NUMBER = 3;
    public static final int PARAMS_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int VERSION_FIELD_NUMBER = 1;
    private int bitField0_;
    private com.google.crypto.tink.shaded.protobuf.i keyValue_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;
    private v params_;
    private int version_;

    static {
        r rVar = new r();
        DEFAULT_INSTANCE = rVar;
        com.google.crypto.tink.shaded.protobuf.x.t(r.class, rVar);
    }

    public static q B() {
        return (q) DEFAULT_INSTANCE.g();
    }

    public static r C(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (r) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static com.google.crypto.tink.shaded.protobuf.t0 D() {
        return DEFAULT_INSTANCE.k();
    }

    public static void w(r rVar, v vVar) {
        rVar.getClass();
        rVar.params_ = vVar;
        rVar.bitField0_ |= 1;
    }

    public static void x(r rVar, com.google.crypto.tink.shaded.protobuf.g gVar) {
        rVar.getClass();
        rVar.keyValue_ = gVar;
    }

    public final int A() {
        return this.version_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u000b\u0002ဉ\u0000\u0003\n", new Object[]{"bitField0_", "version_", "params_", "keyValue_"});
        }
        if (iF == 3) {
            return new r();
        }
        if (iF == 4) {
            return new q();
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
        synchronized (r.class) {
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

    public final com.google.crypto.tink.shaded.protobuf.i y() {
        return this.keyValue_;
    }

    public final v z() {
        v vVar = this.params_;
        return vVar == null ? v.w() : vVar;
    }
}
