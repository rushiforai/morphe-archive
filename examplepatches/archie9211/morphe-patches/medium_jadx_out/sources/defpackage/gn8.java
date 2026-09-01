package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gn8 {
    public static final gn8 ADD;
    public static final gn8 NO_OP;
    public static final gn8 REMOVE;
    public static final /* synthetic */ gn8[] a;
    public static final /* synthetic */ i04 b;

    static {
        gn8 gn8Var = new gn8("NO_OP", 0);
        NO_OP = gn8Var;
        gn8 gn8Var2 = new gn8("ADD", 1);
        ADD = gn8Var2;
        gn8 gn8Var3 = new gn8("REMOVE", 2);
        REMOVE = gn8Var3;
        gn8[] gn8VarArr = {gn8Var, gn8Var2, gn8Var3};
        a = gn8VarArr;
        b = new i04(gn8VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static gn8 valueOf(String str) {
        return (gn8) Enum.valueOf(gn8.class, str);
    }

    public static gn8[] values() {
        return (gn8[]) a.clone();
    }
}
