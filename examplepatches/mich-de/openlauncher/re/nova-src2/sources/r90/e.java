package r90;

import com.google.protobuf.g0;
import com.google.protobuf.j1;
import com.google.protobuf.m0;
import com.google.protobuf.n0;
import com.google.protobuf.p1;
import com.google.protobuf.v1;
import java.io.FileInputStream;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes5.dex */
public final class e extends n0 implements p1 {
    private static final e DEFAULT_INSTANCE;
    public static final int FLAGS_FIELD_NUMBER = 1;
    private static volatile v1 PARSER;
    private j1 flags_ = j1.f34877b;

    static {
        e eVar = new e();
        DEFAULT_INSTANCE = eVar;
        n0.registerDefaultInstance(e.class, eVar);
    }

    public static c f() {
        return (c) DEFAULT_INSTANCE.createBuilder();
    }

    public static e g(FileInputStream fileInputStream) {
        return (e) n0.parseDelimitedFrom(DEFAULT_INSTANCE, fileInputStream);
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
                return n0.newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", new Object[]{"flags_", d.f85747a});
            case 3:
                return new e();
            case 4:
                return new c(DEFAULT_INSTANCE);
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

    public final Map e() {
        return Collections.unmodifiableMap(this.flags_);
    }
}
