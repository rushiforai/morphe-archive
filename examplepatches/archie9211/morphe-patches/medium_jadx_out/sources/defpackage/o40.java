package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o40 {
    public static final o40 CUSTOM;
    public static final n40 Companion;
    public static final o40 MOBILE_APP_INSTALL;
    public static final o40 OTHER;
    public static final /* synthetic */ o40[] a;

    static {
        o40 o40Var = new o40("MOBILE_APP_INSTALL", 0);
        MOBILE_APP_INSTALL = o40Var;
        o40 o40Var2 = new o40("CUSTOM", 1);
        CUSTOM = o40Var2;
        o40 o40Var3 = new o40("OTHER", 2);
        OTHER = o40Var3;
        a = new o40[]{o40Var, o40Var2, o40Var3};
        Companion = new n40();
    }

    public static o40 valueOf(String str) {
        return (o40) Enum.valueOf(o40.class, str);
    }

    public static o40[] values() {
        return (o40[]) a.clone();
    }
}
