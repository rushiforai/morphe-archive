package pl;

/* loaded from: classes3.dex */
public final class k1 extends com.google.crypto.tink.shaded.protobuf.x {
    public static final int CATALOGUE_NAME_FIELD_NUMBER = 5;
    private static final k1 DEFAULT_INSTANCE;
    public static final int KEY_MANAGER_VERSION_FIELD_NUMBER = 3;
    public static final int NEW_KEY_ALLOWED_FIELD_NUMBER = 4;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int PRIMITIVE_NAME_FIELD_NUMBER = 1;
    public static final int TYPE_URL_FIELD_NUMBER = 2;
    private int keyManagerVersion_;
    private boolean newKeyAllowed_;
    private String primitiveName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String typeUrl_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String catalogueName_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        k1 k1Var = new k1();
        DEFAULT_INSTANCE = k1Var;
        com.google.crypto.tink.shaded.protobuf.x.t(k1.class, k1Var);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0005\u0000\u0000\u0001\u0005\u0005\u0000\u0000\u0000\u0001Ȉ\u0002Ȉ\u0003\u000b\u0004\u0007\u0005Ȉ", new Object[]{"primitiveName_", "typeUrl_", "keyManagerVersion_", "newKeyAllowed_", "catalogueName_"});
        }
        if (iF == 3) {
            return new k1();
        }
        if (iF == 4) {
            return new g0(DEFAULT_INSTANCE, 2);
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
        synchronized (k1.class) {
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
