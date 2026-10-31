package da;

import com.google.protobuf.g0;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;

/* loaded from: classes.dex */
public final class j extends n0 implements p1 {
    public static final int CARDINALITY_FIELD_NUMBER = 2;
    private static final j DEFAULT_INSTANCE;
    public static final int INDEX_FIELD_NUMBER = 1;
    private static volatile v1 PARSER;
    private int bitField0_;
    private int cardinality_;
    private int index_;

    static {
        j jVar = new j();
        DEFAULT_INSTANCE = jVar;
        n0.registerDefaultInstance(j.class, jVar);
    }

    public static void e(j jVar, int i5) {
        jVar.bitField0_ |= 1;
        jVar.index_ = i5;
    }

    public static i g() {
        return (i) DEFAULT_INSTANCE.createBuilder();
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
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002င\u0001", new Object[]{"bitField0_", "index_", "cardinality_"});
            case 3:
                return new j();
            case 4:
                return new i();
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (j.class) {
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
