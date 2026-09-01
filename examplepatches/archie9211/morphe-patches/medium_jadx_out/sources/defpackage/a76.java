package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a76 {
    public static final a76 Max;
    public static final a76 Min;
    public static final /* synthetic */ a76[] a;
    public static final /* synthetic */ i04 b;

    static {
        a76 a76Var = new a76("Min", 0);
        Min = a76Var;
        a76 a76Var2 = new a76("Max", 1);
        Max = a76Var2;
        a76[] a76VarArr = {a76Var, a76Var2};
        a = a76VarArr;
        b = new i04(a76VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static a76 valueOf(String str) {
        return (a76) Enum.valueOf(a76.class, str);
    }

    public static a76[] values() {
        return (a76[]) a.clone();
    }
}
