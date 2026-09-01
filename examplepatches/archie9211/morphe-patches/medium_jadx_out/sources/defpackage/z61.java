package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z61 {
    public static final z61 L_NO_NOTE;
    public static final z61 L_WITH_NOTE;
    public static final z61 S;
    public static final /* synthetic */ z61[] a;
    public static final /* synthetic */ i04 b;

    static {
        z61 z61Var = new z61("S", 0);
        S = z61Var;
        z61 z61Var2 = new z61("L_WITH_NOTE", 1);
        L_WITH_NOTE = z61Var2;
        z61 z61Var3 = new z61("L_NO_NOTE", 2);
        L_NO_NOTE = z61Var3;
        z61[] z61VarArr = {z61Var, z61Var2, z61Var3};
        a = z61VarArr;
        b = new i04(z61VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static z61 valueOf(String str) {
        return (z61) Enum.valueOf(z61.class, str);
    }

    public static z61[] values() {
        return (z61[]) a.clone();
    }
}
