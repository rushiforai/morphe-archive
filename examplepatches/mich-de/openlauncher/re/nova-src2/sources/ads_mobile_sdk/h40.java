package ads_mobile_sdk;

import b.l3;
import b.t2;

/* loaded from: classes.dex */
public final class h40 extends cu0 {
    private static final h40 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f4209c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f4210d = 2;
    private int bitField0_;
    private byte memoizedIsInitialized = 2;
    private sq name_;
    private sq value_;

    static {
        h40 h40Var = new h40();
        DEFAULT_INSTANCE = h40Var;
        cu0.a(h40.class, h40Var);
    }

    public h40() {
        qq qqVar = sq.f9634b;
        this.name_ = qqVar;
        this.value_ = qqVar;
    }

    public static l3 o() {
        return (l3) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 0) {
            return Byte.valueOf(this.memoizedIsInitialized);
        }
        if (iA == 1) {
            this.memoizedIsInitialized = (byte) (cu0Var == null ? 0 : 1);
            return null;
        }
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0001\u0001ᔊ\u0000\u0002ည\u0001", new Object[]{"bitField0_", "name_", "value_"});
        }
        if (iA == 3) {
            return new h40();
        }
        if (iA != 4) {
            return null;
        }
        return new l3(DEFAULT_INSTANCE);
    }

    public final void b(qq qqVar) {
        this.bitField0_ |= 2;
        this.value_ = qqVar;
    }

    public final void a(qq qqVar) {
        this.bitField0_ |= 1;
        this.name_ = qqVar;
    }
}
