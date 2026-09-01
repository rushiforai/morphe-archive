package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z40 {
    public static final z40 ARRAY;
    public static final z40 BOOL;
    public static final y40 Companion;
    public static final z40 INT;
    public static final /* synthetic */ z40[] a;

    static {
        z40 z40Var = new z40("ARRAY", 0);
        ARRAY = z40Var;
        z40 z40Var2 = new z40("BOOL", 1);
        BOOL = z40Var2;
        z40 z40Var3 = new z40("INT", 2);
        INT = z40Var3;
        a = new z40[]{z40Var, z40Var2, z40Var3};
        Companion = new y40();
    }

    public static z40 valueOf(String str) {
        return (z40) Enum.valueOf(z40.class, str);
    }

    public static z40[] values() {
        return (z40[]) a.clone();
    }
}
