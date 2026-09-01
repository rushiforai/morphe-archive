package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hx {
    public static final hx FUNCTION;
    public static final hx PROPERTY;
    public static final hx PROPERTY_GETTER;
    public static final hx PROPERTY_SETTER;
    public static final /* synthetic */ hx[] a;

    static {
        hx hxVar = new hx("FUNCTION", 0);
        FUNCTION = hxVar;
        hx hxVar2 = new hx("PROPERTY", 1);
        PROPERTY = hxVar2;
        hx hxVar3 = new hx("PROPERTY_GETTER", 2);
        PROPERTY_GETTER = hxVar3;
        hx hxVar4 = new hx("PROPERTY_SETTER", 3);
        PROPERTY_SETTER = hxVar4;
        a = new hx[]{hxVar, hxVar2, hxVar3, hxVar4};
    }

    public static hx valueOf(String str) {
        return (hx) Enum.valueOf(hx.class, str);
    }

    public static hx[] values() {
        return (hx[]) a.clone();
    }
}
