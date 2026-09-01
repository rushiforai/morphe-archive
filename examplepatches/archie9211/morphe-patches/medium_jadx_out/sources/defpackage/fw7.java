package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fw7 {
    public static final fw7 FREE_TRIAL;
    public static final fw7 MEMBERSHIP;
    public static final /* synthetic */ fw7[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    static {
        fw7 fw7Var = new fw7("MEMBERSHIP", 0, "membership");
        MEMBERSHIP = fw7Var;
        fw7 fw7Var2 = new fw7("FREE_TRIAL", 1, "trial");
        FREE_TRIAL = fw7Var2;
        fw7[] fw7VarArr = {fw7Var, fw7Var2};
        b = fw7VarArr;
        c = new i04(fw7VarArr);
    }

    public fw7(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static fw7 valueOf(String str) {
        return (fw7) Enum.valueOf(fw7.class, str);
    }

    public static fw7[] values() {
        return (fw7[]) b.clone();
    }

    public final String getValue() {
        return this.a;
    }
}
