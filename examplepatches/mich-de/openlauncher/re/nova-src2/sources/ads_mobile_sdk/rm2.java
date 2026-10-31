package ads_mobile_sdk;

import b.j6;
import b.r8;
import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class rm2 extends cu0 {
    private static final rm2 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f9235c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f9236d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f9237e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f9238f = 4;
    private int architecture_;
    private int bitField0_;
    private Object metadata_;
    private int metadataCase_ = 0;
    private int activeExperimentIdsMemoizedSerializedSize = -1;
    private j6 activeExperimentIds_ = jb1.f5202e;

    static {
        rm2 rm2Var = new rm2();
        DEFAULT_INSTANCE = rm2Var;
        cu0.a(rm2.class, rm2Var);
    }

    public static rm2 q() {
        return DEFAULT_INSTANCE;
    }

    public static r8 t() {
        return (r8) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0004\u0001\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001<\u0000\u0002<\u0000\u0003᠌\u0000\u0004'", new Object[]{"metadata_", "metadataCase_", "bitField0_", sm2.class, r92.class, "architecture_", ad.a$4, "activeExperimentIds_"});
        }
        if (iA == 3) {
            return new rm2();
        }
        if (iA != 4) {
            return null;
        }
        return new r8(DEFAULT_INSTANCE);
    }

    public final j6 o() {
        return this.activeExperimentIds_;
    }

    public final fk p() {
        fk fkVarA = fk.a(this.architecture_);
        return fkVarA == null ? fk.UNSUPPORTED : fkVarA;
    }

    public final sm2 r() {
        return this.metadataCase_ == 1 ? (sm2) this.metadata_ : sm2.p();
    }

    public final r92 s() {
        return this.metadataCase_ == 2 ? (r92) this.metadata_ : r92.o();
    }

    public static rm2 a(qq qqVar) {
        rm2 rm2Var = DEFAULT_INSTANCE;
        nl0 nl0VarA = nl0.a();
        byte[] bArr = qqVar.f8777d;
        int length = bArr.length;
        ru ruVar = new ru(bArr, length);
        try {
            ruVar.d(length);
            cu0 cu0VarA = cu0.a(rm2Var, ruVar, nl0VarA);
            ruVar.a(0);
            cu0.a(cu0VarA);
            cu0.a(cu0VarA);
            return (rm2) cu0VarA;
        } catch (yi1 e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public final void a(sm2 sm2Var) {
        Objects.requireNonNull(sm2Var);
        this.metadata_ = sm2Var;
        this.metadataCase_ = 1;
    }

    public final void a(r92 r92Var) {
        Objects.requireNonNull(r92Var);
        this.metadata_ = r92Var;
        this.metadataCase_ = 2;
    }

    public static rm2 a(byte[] bArr, nl0 nl0Var) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0Var);
        cu0.a(cu0VarA);
        return (rm2) cu0VarA;
    }
}
