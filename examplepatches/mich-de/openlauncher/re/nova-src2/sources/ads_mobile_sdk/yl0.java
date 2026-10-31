package ads_mobile_sdk;

import b.nc;
import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class yl0 extends cu0 {
    private static final yl0 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f12187c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f12188d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f12189e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f12190f = 4;
    private int bitField0_;
    private sq bytecode_;
    private rm2 metadata_;
    private int status_;
    private sq vm_;

    static {
        yl0 yl0Var = new yl0();
        DEFAULT_INSTANCE = yl0Var;
        cu0.a(yl0.class, yl0Var);
    }

    public yl0() {
        qq qqVar = sq.f9634b;
        this.bytecode_ = qqVar;
        this.vm_ = qqVar;
    }

    public static nc s() {
        return (nc) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002ည\u0001\u0003ည\u0002\u0004᠌\u0003", new Object[]{"bitField0_", "metadata_", "bytecode_", "vm_", "status_", ad.a$6});
        }
        if (iA == 3) {
            return new yl0();
        }
        if (iA != 4) {
            return null;
        }
        return new nc(DEFAULT_INSTANCE);
    }

    public final sq o() {
        return this.bytecode_;
    }

    public final rm2 p() {
        rm2 rm2Var = this.metadata_;
        return rm2Var == null ? rm2.q() : rm2Var;
    }

    public final int q$1() {
        int i_a$2 = a80.m._a$2(this.status_);
        if (i_a$2 == 0) {
            return 1;
        }
        return i_a$2;
    }

    public final sq r() {
        return this.vm_;
    }

    public final void b(sq sqVar) {
        Objects.requireNonNull(sqVar);
        this.bitField0_ |= 4;
        this.vm_ = sqVar;
    }

    public final void a(sq sqVar) {
        Objects.requireNonNull(sqVar);
        this.bitField0_ |= 2;
        this.bytecode_ = sqVar;
    }

    public final void a(rm2 rm2Var) {
        this.metadata_ = rm2Var;
        this.bitField0_ |= 1;
    }
}
