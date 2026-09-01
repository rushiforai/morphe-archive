package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hh8 {
    public static final hh8 Max;
    public static final hh8 Min;
    public static final /* synthetic */ hh8[] a;
    public static final /* synthetic */ i04 b;

    static {
        hh8 hh8Var = new hh8("Min", 0);
        Min = hh8Var;
        hh8 hh8Var2 = new hh8("Max", 1);
        Max = hh8Var2;
        hh8[] hh8VarArr = {hh8Var, hh8Var2};
        a = hh8VarArr;
        b = new i04(hh8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static hh8 valueOf(String str) {
        return (hh8) Enum.valueOf(hh8.class, str);
    }

    public static hh8[] values() {
        return (hh8[]) a.clone();
    }
}
