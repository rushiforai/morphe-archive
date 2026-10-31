package ads_mobile_sdk;

import b.d;
import b.t2;

/* loaded from: classes2.dex */
public final class o40 extends cu0 {
    private static final o40 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f7757c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f7758d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f7759e = 3;
    private int bitField0_;
    private int code_;
    private sq message_;
    private sq version_;

    static {
        o40 o40Var = new o40();
        DEFAULT_INSTANCE = o40Var;
        cu0.a(o40.class, o40Var);
    }

    public o40() {
        qq qqVar = sq.f9634b;
        this.message_ = qqVar;
        this.version_ = qqVar;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001င\u0000\u0002ည\u0001\u0003ည\u0002", new Object[]{"bitField0_", "code_", "message_", "version_"});
        }
        if (iA == 3) {
            return new o40();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }
}
