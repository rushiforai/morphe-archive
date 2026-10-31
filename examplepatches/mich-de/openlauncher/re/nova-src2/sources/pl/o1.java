package pl;

/* loaded from: classes3.dex */
public final class o1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final o1 DEFAULT_INSTANCE;
    public static final int KEY_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PRIMARY_KEY_ID_FIELD_NUMBER = 1;
    private com.google.crypto.tink.shaded.protobuf.a0 key_ = com.google.crypto.tink.shaded.protobuf.v0.f34676e;
    private int primaryKeyId_;

    static {
        o1 o1Var = new o1();
        DEFAULT_INSTANCE = o1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(o1.class, o1Var);
    }

    public static l1 B() {
        return (l1) DEFAULT_INSTANCE.g();
    }

    public static o1 C(byte[] bArr, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (o1) com.google.crypto.tink.shaded.protobuf.x.s(DEFAULT_INSTANCE, bArr, pVar);
    }

    public static void v(o1 o1Var, int i5) {
        o1Var.primaryKeyId_ = i5;
    }

    public static void w(o1 o1Var, n1 n1Var) {
        o1Var.getClass();
        com.google.crypto.tink.shaded.protobuf.a0 a0Var = o1Var.key_;
        if (!((com.google.crypto.tink.shaded.protobuf.b) a0Var).f34574a) {
            o1Var.key_ = a0Var.m(a0Var.size() * 2);
        }
        o1Var.key_.add(n1Var);
    }

    public final int A() {
        return this.primaryKeyId_;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"primaryKeyId_", "key_", n1.class});
        }
        if (iF == 3) {
            return new o1();
        }
        if (iF == 4) {
            return new l1(DEFAULT_INSTANCE);
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
        synchronized (o1.class) {
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

    public final n1 x(int i5) {
        return (n1) this.key_.get(i5);
    }

    public final int y() {
        return this.key_.size();
    }

    public final com.google.crypto.tink.shaded.protobuf.a0 z() {
        return this.key_;
    }
}
