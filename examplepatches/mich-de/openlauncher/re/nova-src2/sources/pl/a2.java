package pl;

/* loaded from: classes3.dex */
public final class a2 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final a2 DEFAULT_INSTANCE;
    public static final int DEK_TEMPLATE_FIELD_NUMBER = 2;
    public static final int KEK_URI_FIELD_NUMBER = 1;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private int bitField0_;
    private j1 dekTemplate_;
    private String kekUri_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        a2 a2Var = new a2();
        DEFAULT_INSTANCE = a2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(a2.class, a2Var);
    }

    public static z1 A() {
        return (z1) DEFAULT_INSTANCE.g();
    }

    public static a2 B(com.google.crypto.tink.shaded.protobuf.i iVar, com.google.crypto.tink.shaded.protobuf.p pVar) {
        return (a2) com.google.crypto.tink.shaded.protobuf.x.r(DEFAULT_INSTANCE, iVar, pVar);
    }

    public static void v(a2 a2Var, String str) {
        a2Var.getClass();
        str.getClass();
        a2Var.kekUri_ = str;
    }

    public static void w(a2 a2Var, j1 j1Var) {
        a2Var.getClass();
        j1Var.getClass();
        a2Var.dekTemplate_ = j1Var;
        a2Var.bitField0_ |= 1;
    }

    public static a2 x() {
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001Ȉ\u0002ဉ\u0000", new Object[]{"bitField0_", "kekUri_", "dekTemplate_"});
        }
        if (iF == 3) {
            return new a2();
        }
        if (iF == 4) {
            return new z1(DEFAULT_INSTANCE);
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
        synchronized (a2.class) {
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

    public final j1 y() {
        j1 j1Var = this.dekTemplate_;
        return j1Var == null ? j1.y() : j1Var;
    }

    public final String z() {
        return this.kekUri_;
    }
}
