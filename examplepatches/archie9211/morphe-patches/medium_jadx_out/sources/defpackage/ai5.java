package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ai5 {
    public static final ai5 Cursor;
    public static final ai5 SelectionEnd;
    public static final ai5 SelectionStart;
    public static final /* synthetic */ ai5[] a;
    public static final /* synthetic */ i04 b;

    static {
        ai5 ai5Var = new ai5("Cursor", 0);
        Cursor = ai5Var;
        ai5 ai5Var2 = new ai5("SelectionStart", 1);
        SelectionStart = ai5Var2;
        ai5 ai5Var3 = new ai5("SelectionEnd", 2);
        SelectionEnd = ai5Var3;
        ai5[] ai5VarArr = {ai5Var, ai5Var2, ai5Var3};
        a = ai5VarArr;
        b = new i04(ai5VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ai5 valueOf(String str) {
        return (ai5) Enum.valueOf(ai5.class, str);
    }

    public static ai5[] values() {
        return (ai5[]) a.clone();
    }
}
