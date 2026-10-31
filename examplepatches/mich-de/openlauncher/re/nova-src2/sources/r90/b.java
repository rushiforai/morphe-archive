package r90;

import com.google.protobuf.g0;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;
import com.google.protobuf.z0;

/* loaded from: classes5.dex */
public final class b extends n0 implements p1 {
    public static final int CONSTRAINED_VALUES_FIELD_NUMBER = 8;
    private static final b DEFAULT_INSTANCE;
    private static volatile v1 PARSER;
    private z0 constrainedValues_ = n0.emptyProtobufList();

    static {
        b bVar = new b();
        DEFAULT_INSTANCE = bVar;
        n0.registerDefaultInstance(b.class, bVar);
    }

    public static b f() {
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
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\b\b\u0001\u0000\u0001\u0000\b\u001b", new Object[]{"constrainedValues_", a.class});
            case 3:
                return new b();
            case 4:
                return new da.a(DEFAULT_INSTANCE);
            case 5:
                return DEFAULT_INSTANCE;
            case 6:
                v1 v1Var = PARSER;
                if (v1Var != null) {
                    return v1Var;
                }
                synchronized (b.class) {
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

    public final z0 e() {
        return this.constrainedValues_;
    }
}
