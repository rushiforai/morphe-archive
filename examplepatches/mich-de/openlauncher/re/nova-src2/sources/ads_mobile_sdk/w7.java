package ads_mobile_sdk;

import b.d;
import b.j6;
import b.t2;

/* loaded from: classes.dex */
public final class w7 extends cu0 {
    private static final w7 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f11078c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f11079d = 2;
    private int activeExperimentIdsMemoizedSerializedSize = -1;
    private j6 activeExperimentIds_ = jb1.f5202e;
    private int bitField0_;
    private p92 program_;

    static {
        w7 w7Var = new w7();
        DEFAULT_INSTANCE = w7Var;
        cu0.a(w7.class, w7Var);
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001ဉ\u0000\u0002'", new Object[]{"bitField0_", "program_", "activeExperimentIds_"});
        }
        if (iA == 3) {
            return new w7();
        }
        if (iA != 4) {
            return null;
        }
        return new d(DEFAULT_INSTANCE);
    }

    public final j6 o() {
        return this.activeExperimentIds_;
    }

    public final p92 p() {
        p92 p92Var = this.program_;
        return p92Var == null ? p92.o() : p92Var;
    }

    public static w7 a(byte[] bArr, nl0 nl0Var) {
        cu0 cu0VarA = cu0.a(DEFAULT_INSTANCE, bArr, bArr.length, nl0Var);
        cu0.a(cu0VarA);
        return (w7) cu0VarA;
    }
}
