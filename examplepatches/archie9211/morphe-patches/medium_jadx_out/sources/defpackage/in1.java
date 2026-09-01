package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class in1 {
    public static final in1 ALL_JSON_OBJECTS;
    public static final in1 NONE;
    public static final in1 POLYMORPHIC;
    public static final /* synthetic */ in1[] a;
    public static final /* synthetic */ i04 b;

    static {
        in1 in1Var = new in1("NONE", 0);
        NONE = in1Var;
        in1 in1Var2 = new in1("ALL_JSON_OBJECTS", 1);
        ALL_JSON_OBJECTS = in1Var2;
        in1 in1Var3 = new in1("POLYMORPHIC", 2);
        POLYMORPHIC = in1Var3;
        in1[] in1VarArr = {in1Var, in1Var2, in1Var3};
        a = in1VarArr;
        b = new i04(in1VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static in1 valueOf(String str) {
        return (in1) Enum.valueOf(in1.class, str);
    }

    public static in1[] values() {
        return (in1[]) a.clone();
    }
}
