package da;

import com.google.protobuf.g0;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;

/* loaded from: classes.dex */
public final class e extends n0 implements p1 {
    private static final e DEFAULT_INSTANCE;
    public static final int GRID_X_FIELD_NUMBER = 2;
    public static final int GRID_Y_FIELD_NUMBER = 3;
    public static final int HOTSEAT_FIELD_NUMBER = 5;
    public static final int PAGE_INDEX_FIELD_NUMBER = 1;
    private static volatile v1 PARSER = null;
    public static final int TASKBAR_FIELD_NUMBER = 6;
    public static final int WORKSPACE_FIELD_NUMBER = 4;
    private int bitField0_;
    private Object parentContainer_;
    private int parentContainerCase_ = 0;
    private int pageIndex_ = -1;
    private float gridX_ = -1.0f;
    private float gridY_ = -1.0f;

    static {
        e eVar = new e();
        DEFAULT_INSTANCE = eVar;
        n0.registerDefaultInstance(e.class, eVar);
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
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0006\u0001\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ခ\u0001\u0003ခ\u0002\u0004<\u0000\u0005<\u0000\u0006<\u0000", new Object[]{"parentContainer_", "parentContainerCase_", "bitField0_", "pageIndex_", "gridX_", "gridY_", u.class, h.class, o.class});
            case 3:
                return new e();
            case 4:
                return new a(1);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (e.class) {
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
