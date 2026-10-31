package pl;

/* loaded from: classes3.dex */
public final class g1 extends com.google.crypto.tink.shaded.protobuf.x {
    private static final g1 DEFAULT_INSTANCE;
    public static final int KEY_MATERIAL_TYPE_FIELD_NUMBER = 3;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int TYPE_URL_FIELD_NUMBER = 1;
    public static final int VALUE_FIELD_NUMBER = 2;
    private int keyMaterialType_;
    private String typeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private com.google.crypto.tink.shaded.protobuf.i value_ = com.google.crypto.tink.shaded.protobuf.i.f34608b;

    static {
        g1 g1Var = new g1();
        DEFAULT_INSTANCE = g1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(g1.class, g1Var);
    }

    public static e1 C() {
        return (e1) DEFAULT_INSTANCE.g();
    }

    public static void v(g1 g1Var, String str) {
        g1Var.getClass();
        str.getClass();
        g1Var.typeUrl_ = str;
    }

    public static void w(g1 g1Var, com.google.crypto.tink.shaded.protobuf.i iVar) {
        g1Var.getClass();
        iVar.getClass();
        g1Var.value_ = iVar;
    }

    public static void x(g1 g1Var, f1 f1Var) {
        g1Var.getClass();
        if (f1Var == f1.UNRECOGNIZED) {
            throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
        }
        g1Var.keyMaterialType_ = f1Var.f82624a;
    }

    public static g1 y() {
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
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\n\u0003\f", new Object[]{"typeUrl_", "value_", "keyMaterialType_"});
        }
        if (iF == 3) {
            return new g1();
        }
        if (iF == 4) {
            return new e1(DEFAULT_INSTANCE);
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
        synchronized (g1.class) {
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

    public final f1 z() {
        int i5 = this.keyMaterialType_;
        f1 f1Var = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? null : f1.REMOTE : f1.ASYMMETRIC_PUBLIC : f1.ASYMMETRIC_PRIVATE : f1.SYMMETRIC : f1.UNKNOWN_KEYMATERIAL;
        return f1Var == null ? f1.UNRECOGNIZED : f1Var;
    }
}
