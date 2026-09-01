package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum euf {
    VOID(Void.class),
    INT(Integer.class),
    LONG(Long.class),
    zzd(Float.class),
    DOUBLE(Double.class),
    BOOLEAN(Boolean.class),
    STRING(String.class),
    BYTE_STRING(hsf.class),
    ENUM(Integer.class),
    MESSAGE(Object.class);

    public final Class a;

    euf(Class cls) {
        this.a = cls;
    }

    public final Class<?> zza() {
        return this.a;
    }

    static {
        rsf rsfVar = hsf.b;
    }
}
