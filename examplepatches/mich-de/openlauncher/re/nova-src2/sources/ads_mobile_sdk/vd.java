package ads_mobile_sdk;

import b.t2;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class vd extends cu0 {
    private static final vd DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f10734c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f10735d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f10736e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f10737f = 4;
    private int bitField0_;
    private sq data_;
    private sq hash_;
    private sq osVersion_;
    private sq timestamp_;

    static {
        vd vdVar = new vd();
        DEFAULT_INSTANCE = vdVar;
        cu0.a(vd.class, vdVar);
    }

    public vd() {
        qq qqVar = sq.f9634b;
        this.data_ = qqVar;
        this.hash_ = qqVar;
        this.timestamp_ = qqVar;
        this.osVersion_ = qqVar;
    }

    public static b.mb s() {
        return (b.mb) DEFAULT_INSTANCE.e();
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ည\u0000\u0002ည\u0001\u0003ည\u0002\u0004ည\u0003", new Object[]{"bitField0_", "data_", "hash_", "timestamp_", "osVersion_"});
        }
        if (iA == 3) {
            return new vd();
        }
        if (iA != 4) {
            return null;
        }
        return new b.mb(DEFAULT_INSTANCE);
    }

    public final void b(qq qqVar) {
        Objects.requireNonNull(qqVar);
        this.bitField0_ |= 4;
        this.timestamp_ = qqVar;
    }

    public final sq o() {
        return this.data_;
    }

    public final sq p() {
        return this.hash_;
    }

    public final sq q() {
        return this.osVersion_;
    }

    public final sq r() {
        return this.timestamp_;
    }

    public final void a(qq qqVar) {
        Objects.requireNonNull(qqVar);
        this.bitField0_ |= 8;
        this.osVersion_ = qqVar;
    }

    public static vd a(byte[] bArr, nl0 nl0Var) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0Var);
        cu0.a(cu0VarA);
        return (vd) cu0VarA;
    }
}
