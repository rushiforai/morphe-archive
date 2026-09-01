package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fn0 {
    public static final fn0 ABSENT;
    public static final fn0 ABSENT_OPTIONAL;
    public static final fn0 PRESENT;
    public static final fn0 PRESENT_OPTIONAL;
    public static final /* synthetic */ fn0[] a;
    public static final /* synthetic */ i04 b;

    static {
        fn0 fn0Var = new fn0("PRESENT", 0);
        PRESENT = fn0Var;
        fn0 fn0Var2 = new fn0("ABSENT", 1);
        ABSENT = fn0Var2;
        fn0 fn0Var3 = new fn0("PRESENT_OPTIONAL", 2);
        PRESENT_OPTIONAL = fn0Var3;
        fn0 fn0Var4 = new fn0("ABSENT_OPTIONAL", 3);
        ABSENT_OPTIONAL = fn0Var4;
        fn0[] fn0VarArr = {fn0Var, fn0Var2, fn0Var3, fn0Var4};
        a = fn0VarArr;
        b = new i04(fn0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static fn0 valueOf(String str) {
        return (fn0) Enum.valueOf(fn0.class, str);
    }

    public static fn0[] values() {
        return (fn0[]) a.clone();
    }
}
