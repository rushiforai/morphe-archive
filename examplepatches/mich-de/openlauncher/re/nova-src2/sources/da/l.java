package da;

import com.google.protobuf.g0;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;

/* loaded from: classes.dex */
public final class l extends n0 implements p1 {
    public static final int ALL_APPS_CONTAINER_FIELD_NUMBER = 3;
    private static final l DEFAULT_INSTANCE;
    private static volatile v1 PARSER = null;
    public static final int QUERY_LENGTH_FIELD_NUMBER = 1;
    public static final int WORKSPACE_FIELD_NUMBER = 2;
    private int bitField0_;
    private int parentContainerCase_ = 0;
    private Object parentContainer_;
    private int queryLength_;

    static {
        l lVar = new l();
        DEFAULT_INSTANCE = lVar;
        n0.registerDefaultInstance(l.class, lVar);
    }

    public static l f() {
        return DEFAULT_INSTANCE;
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
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0003\u0001\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001င\u0000\u0002<\u0000\u0003<\u0000", new Object[]{"parentContainer_", "parentContainerCase_", "bitField0_", "queryLength_", u.class, b.class});
            case 3:
                return new l();
            case 4:
                return new a(3);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (l.class) {
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
