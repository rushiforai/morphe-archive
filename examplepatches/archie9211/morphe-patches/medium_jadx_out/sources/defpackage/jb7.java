package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jb7 {
    public static final jb7 IsNotPlaced;
    public static final jb7 IsPlacedInApproach;
    public static final jb7 IsPlacedInLookahead;
    public static final /* synthetic */ jb7[] a;
    public static final /* synthetic */ i04 b;

    static {
        jb7 jb7Var = new jb7("IsPlacedInLookahead", 0);
        IsPlacedInLookahead = jb7Var;
        jb7 jb7Var2 = new jb7("IsPlacedInApproach", 1);
        IsPlacedInApproach = jb7Var2;
        jb7 jb7Var3 = new jb7("IsNotPlaced", 2);
        IsNotPlaced = jb7Var3;
        jb7[] jb7VarArr = {jb7Var, jb7Var2, jb7Var3};
        a = jb7VarArr;
        b = new i04(jb7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static jb7 valueOf(String str) {
        return (jb7) Enum.valueOf(jb7.class, str);
    }

    public static jb7[] values() {
        return (jb7[]) a.clone();
    }
}
