package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i48 {
    public static final i48 DefaultEffects;
    public static final i48 DefaultSpatial;
    public static final i48 FastEffects;
    public static final i48 FastSpatial;
    public static final i48 SlowEffects;
    public static final i48 SlowSpatial;
    public static final /* synthetic */ i48[] a;
    public static final /* synthetic */ i04 b;

    static {
        i48 i48Var = new i48("DefaultSpatial", 0);
        DefaultSpatial = i48Var;
        i48 i48Var2 = new i48("FastSpatial", 1);
        FastSpatial = i48Var2;
        i48 i48Var3 = new i48("SlowSpatial", 2);
        SlowSpatial = i48Var3;
        i48 i48Var4 = new i48("DefaultEffects", 3);
        DefaultEffects = i48Var4;
        i48 i48Var5 = new i48("FastEffects", 4);
        FastEffects = i48Var5;
        i48 i48Var6 = new i48("SlowEffects", 5);
        SlowEffects = i48Var6;
        i48[] i48VarArr = {i48Var, i48Var2, i48Var3, i48Var4, i48Var5, i48Var6};
        a = i48VarArr;
        b = new i04(i48VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static i48 valueOf(String str) {
        return (i48) Enum.valueOf(i48.class, str);
    }

    public static i48[] values() {
        return (i48[]) a.clone();
    }
}
