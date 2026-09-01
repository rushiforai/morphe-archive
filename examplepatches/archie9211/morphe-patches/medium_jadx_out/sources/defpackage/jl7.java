package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jl7 {
    public static final jl7 Max;
    public static final jl7 Min;
    public static final /* synthetic */ jl7[] a;
    public static final /* synthetic */ i04 b;

    static {
        jl7 jl7Var = new jl7("Min", 0);
        Min = jl7Var;
        jl7 jl7Var2 = new jl7("Max", 1);
        Max = jl7Var2;
        jl7[] jl7VarArr = {jl7Var, jl7Var2};
        a = jl7VarArr;
        b = new i04(jl7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static jl7 valueOf(String str) {
        return (jl7) Enum.valueOf(jl7.class, str);
    }

    public static jl7[] values() {
        return (jl7[]) a.clone();
    }
}
