package ads_mobile_sdk;

import b.j6;
import b.t2;
import b.u6;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class ax extends cu0 {
    private static final ax DEFAULT_INSTANCE;
    private static final u6 allowedApis_converter_ = new b.i8(12);

    /* renamed from: c, reason: collision with root package name */
    public static final int f1177c = 1;
    private int allowedApisMemoizedSerializedSize;
    private j6 allowedApis_ = jb1.f5202e;

    static {
        ax axVar = new ax();
        DEFAULT_INSTANCE = axVar;
        cu0.a(ax.class, axVar);
    }

    public static ax r() {
        return DEFAULT_INSTANCE;
    }

    public static b.td s() {
        return (b.td) DEFAULT_INSTANCE.e();
    }

    public final void a(yw ywVar) {
        RandomAccess randomAccess = this.allowedApis_;
        if (!((j) randomAccess).f5068a) {
            jb1 jb1Var = (jb1) randomAccess;
            this.allowedApis_ = jb1Var.a(jb1Var.f5204c * 2);
        }
        ((jb1) this.allowedApis_).b(ywVar.getNumber());
    }

    public final int o() {
        return ((jb1) this.allowedApis_).size();
    }

    public final com.google.android.gms.internal.measurement.v1 p() {
        return new com.google.android.gms.internal.measurement.v1(1, this.allowedApis_, allowedApis_converter_);
    }

    public final j6 q() {
        return this.allowedApis_;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001,", new Object[]{"allowedApis_"});
        }
        if (iA == 3) {
            return new ax();
        }
        if (iA != 4) {
            return null;
        }
        return new b.td(DEFAULT_INSTANCE);
    }

    public static ax a(byte[] bArr) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0.a());
        cu0.a(cu0VarA);
        return (ax) cu0VarA;
    }
}
