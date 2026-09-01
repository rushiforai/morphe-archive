package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c87 {
    public static final c87 Debug;
    public static final c87 Error;
    public static final c87 Info;
    public static final c87 Verbose;
    public static final c87 Warn;
    public static final /* synthetic */ c87[] a;
    public static final /* synthetic */ i04 b;

    static {
        c87 c87Var = new c87("Verbose", 0);
        Verbose = c87Var;
        c87 c87Var2 = new c87("Debug", 1);
        Debug = c87Var2;
        c87 c87Var3 = new c87("Info", 2);
        Info = c87Var3;
        c87 c87Var4 = new c87("Warn", 3);
        Warn = c87Var4;
        c87 c87Var5 = new c87("Error", 4);
        Error = c87Var5;
        c87[] c87VarArr = {c87Var, c87Var2, c87Var3, c87Var4, c87Var5};
        a = c87VarArr;
        b = new i04(c87VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static c87 valueOf(String str) {
        return (c87) Enum.valueOf(c87.class, str);
    }

    public static c87[] values() {
        return (c87[]) a.clone();
    }
}
