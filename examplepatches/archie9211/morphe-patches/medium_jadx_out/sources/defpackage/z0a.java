package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z0a {
    public static final z0a DEFAULT;
    public static final z0a HIGHEST;
    public static final z0a VERY_LOW;
    public static final /* synthetic */ z0a[] a;

    static {
        z0a z0aVar = new z0a("DEFAULT", 0);
        DEFAULT = z0aVar;
        z0a z0aVar2 = new z0a("VERY_LOW", 1);
        VERY_LOW = z0aVar2;
        z0a z0aVar3 = new z0a("HIGHEST", 2);
        HIGHEST = z0aVar3;
        a = new z0a[]{z0aVar, z0aVar2, z0aVar3};
    }

    public static z0a valueOf(String str) {
        return (z0a) Enum.valueOf(z0a.class, str);
    }

    public static z0a[] values() {
        return (z0a[]) a.clone();
    }
}
