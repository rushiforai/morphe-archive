package da;

import com.google.protobuf.g0;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;

/* loaded from: classes.dex */
public final class u extends n0 implements p1 {
    private static final u DEFAULT_INSTANCE;
    public static final int GRID_X_FIELD_NUMBER = 2;
    public static final int GRID_Y_FIELD_NUMBER = 3;
    public static final int PAGE_INDEX_FIELD_NUMBER = 1;
    private static volatile v1 PARSER;
    private int bitField0_;
    private int pageIndex_ = -2;
    private float gridX_ = -1.0f;
    private float gridY_ = -1.0f;

    static {
        u uVar = new u();
        DEFAULT_INSTANCE = uVar;
        n0.registerDefaultInstance(u.class, uVar);
    }

    public static void e(u uVar, float f11) {
        uVar.bitField0_ |= 2;
        uVar.gridX_ = f11;
    }

    public static void f(u uVar, float f11) {
        uVar.bitField0_ |= 4;
        uVar.gridY_ = f11;
    }

    public static void g(u uVar, int i5) {
        uVar.bitField0_ |= 1;
        uVar.pageIndex_ = i5;
    }

    public static t h() {
        return (t) DEFAULT_INSTANCE.createBuilder();
    }

    @Override // com.google.protobuf.n0
    public final Object dynamicMethod(m0 m0Var, Object obj, Object obj2) {
        v1 g0Var;
        switch (m0Var.ordinal()) {
            case 0:
                return (byte) 1;
            case 1:
                return null;
            case 2:
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001င\u0000\u0002ခ\u0001\u0003ခ\u0002", new Object[]{"bitField0_", "pageIndex_", "gridX_", "gridY_"});
            case 3:
                return new u();
            case 4:
                return new t(DEFAULT_INSTANCE);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (u.class) {
                    try {
                        g0Var = PARSER;
                        if (g0Var == null) {
                            g0Var = new g0();
                            PARSER = g0Var;
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return g0Var;
            default:
                throw new UnsupportedOperationException();
        }
    }
}
