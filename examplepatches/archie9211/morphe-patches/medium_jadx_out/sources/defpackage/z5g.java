package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum z5g {
    VOID(Void.class),
    INT(Integer.class),
    LONG(Long.class),
    FLOAT(Float.class),
    DOUBLE(Double.class),
    BOOLEAN(Boolean.class),
    STRING(String.class),
    BYTE_STRING(t3g.class),
    ENUM(Integer.class),
    MESSAGE(Object.class);

    public final Class a;

    static {
        u3g u3gVar = t3g.b;
    }

    z5g(Class cls) {
        this.a = cls;
    }

    public final Class zza() {
        return this.a;
    }
}
