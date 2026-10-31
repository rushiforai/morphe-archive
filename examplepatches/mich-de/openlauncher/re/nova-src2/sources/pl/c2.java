package pl;

/* loaded from: classes.dex */
public final class c2 extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int CONFIG_NAME_FIELD_NUMBER = 1;
    private static final c2 DEFAULT_INSTANCE;
    public static final int ENTRY_FIELD_NUMBER = 2;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER;
    private String configName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private com.google.crypto.tink.shaded.protobuf.a0 entry_ = com.google.crypto.tink.shaded.protobuf.v0.f34676e;

    static {
        c2 c2Var = new c2();
        DEFAULT_INSTANCE = c2Var;
        com.google.crypto.tink.shaded.protobuf.x.t(c2.class, c2Var);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001Ȉ\u0002\u001b", new Object[]{"configName_", "entry_", k1.class});
        }
        if (iF == 3) {
            return new c2();
        }
        if (iF == 4) {
            return new g0();
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
        synchronized (c2.class) {
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
