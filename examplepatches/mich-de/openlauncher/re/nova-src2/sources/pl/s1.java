package pl;

/* loaded from: classes3.dex */
public final class s1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final s1 DEFAULT_INSTANCE;
    public static final int KEY_INFO_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PRIMARY_KEY_ID_FIELD_NUMBER = 1;
    private com.google.crypto.tink.shaded.protobuf.a0 keyInfo_ = com.google.crypto.tink.shaded.protobuf.v0.f34676e;
    private int primaryKeyId_;

    static {
        s1 s1Var = new s1();
        DEFAULT_INSTANCE = s1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(s1.class, s1Var);
    }

    public static void v(s1 s1Var, int i5) {
        s1Var.primaryKeyId_ = i5;
    }

    public static void w(s1 s1Var, r1 r1Var) {
        s1Var.getClass();
        com.google.crypto.tink.shaded.protobuf.a0 a0Var = s1Var.keyInfo_;
        if (!((com.google.crypto.tink.shaded.protobuf.b) a0Var).f34574a) {
            s1Var.keyInfo_ = a0Var.m(a0Var.size() * 2);
        }
        s1Var.keyInfo_.add(r1Var);
    }

    public static p1 x() {
        return (p1) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"primaryKeyId_", "keyInfo_", r1.class});
        }
        if (iF == 3) {
            return new s1();
        }
        if (iF == 4) {
            return new p1(DEFAULT_INSTANCE);
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
        synchronized (s1.class) {
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
