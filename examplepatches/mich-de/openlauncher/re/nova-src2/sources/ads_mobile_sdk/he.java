package ads_mobile_sdk;

import b.t;
import b.t2;

/* loaded from: classes2.dex */
public final class he extends cu0 {
    private static final he DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4343c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f4344d = 3;

    /* renamed from: e, reason: collision with root package name */
    public static final int f4345e = 4;
    private int bitField0_;
    private long timestampMs_;
    private String keyIdentifier_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private sq encryptedAdAttestationStatemement_ = sq.f9634b;

    static {
        he heVar = new he();
        DEFAULT_INSTANCE = heVar;
        cu0.a(he.class, heVar);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0004\u0003\u0000\u0000\u0000\u0001ဂ\u0000\u0003ဈ\u0001\u0004ည\u0002", new Object[]{"bitField0_", "timestampMs_", "keyIdentifier_", "encryptedAdAttestationStatemement_"});
        }
        if (iA == 3) {
            return new he();
        }
        if (iA != 4) {
            return null;
        }
        return new t(DEFAULT_INSTANCE);
    }

    public final sq o() {
        return this.encryptedAdAttestationStatemement_;
    }

    public final String p() {
        return this.keyIdentifier_;
    }

    public final long q() {
        return this.timestampMs_;
    }

    public final boolean r() {
        return (this.bitField0_ & 4) != 0;
    }

    public final boolean s() {
        return (this.bitField0_ & 2) != 0;
    }

    public final boolean t() {
        return (this.bitField0_ & 1) != 0;
    }
}
