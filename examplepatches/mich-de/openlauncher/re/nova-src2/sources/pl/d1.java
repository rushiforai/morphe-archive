package pl;

/* loaded from: classes3.dex */
public final class d1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final d1 DEFAULT_INSTANCE;
    public static final int HASH_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int TAG_SIZE_FIELD_NUMBER = 2;
    private int hash_;
    private int tagSize_;

    static {
        d1 d1Var = new d1();
        DEFAULT_INSTANCE = d1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(d1.class, d1Var);
    }

    public static c1 A() {
        return (c1) DEFAULT_INSTANCE.g();
    }

    public static void v(d1 d1Var, x0 x0Var) {
        d1Var.getClass();
        d1Var.hash_ = x0Var.getNumber();
    }

    public static void w(d1 d1Var, int i5) {
        d1Var.tagSize_ = i5;
    }

    public static d1 x() {
        return DEFAULT_INSTANCE;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\f\u0002\u000b", new Object[]{"hash_", "tagSize_"});
        }
        if (iF == 3) {
            return new d1();
        }
        if (iF == 4) {
            return new c1(DEFAULT_INSTANCE);
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
        synchronized (d1.class) {
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

    public final x0 y() {
        x0 x0VarA = x0.a(this.hash_);
        return x0VarA == null ? x0.UNRECOGNIZED : x0VarA;
    }

    public final int z() {
        return this.tagSize_;
    }
}
