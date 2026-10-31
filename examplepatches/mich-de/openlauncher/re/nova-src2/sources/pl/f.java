package pl;

/* loaded from: classes3.dex */
public final class f extends com.google.crypto.tink.shaded.protobuf.x {
    private static final f DEFAULT_INSTANCE;
    private static volatile com.google.crypto.tink.shaded.protobuf.t0 PARSER = null;
    public static final int TAG_SIZE_FIELD_NUMBER = 1;
    private int tagSize_;

    static {
        f fVar = new f();
        DEFAULT_INSTANCE = fVar;
        com.google.crypto.tink.shaded.protobuf.x.t(f.class, fVar);
    }

    public static void v(f fVar, int i5) {
        fVar.tagSize_ = i5;
    }

    public static f w() {
        return DEFAULT_INSTANCE;
    }

    public static e y() {
        return (e) DEFAULT_INSTANCE.g();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.x
    public final Object h(int i5) {
        com.google.crypto.tink.shaded.protobuf.t0 wVar;
        int iF = b.c0.F(i5);
        if (iF == 0) {
            return (byte) 1;
        }
        if (iF == 2) {
            return new com.google.crypto.tink.shaded.protobuf.w0(DEFAULT_INSTANCE, "\u0000\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u000b", new Object[]{"tagSize_"});
        }
        if (iF == 3) {
            return new f();
        }
        if (iF == 4) {
            return new e(DEFAULT_INSTANCE);
        }
        if (iF == 5) {
            return DEFAULT_INSTANCE;
        }
        if (iF != 6) {
            throw null;
        }
        com.google.crypto.tink.shaded.protobuf.t0 t0Var = PARSER;
        if (t0Var != null) {
            return t0Var;
        }
        synchronized (f.class) {
            try {
                wVar = PARSER;
                if (wVar == null) {
                    wVar = new com.google.crypto.tink.shaded.protobuf.w();
                    PARSER = wVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return wVar;
    }

    public final int x() {
        return this.tagSize_;
    }
}
