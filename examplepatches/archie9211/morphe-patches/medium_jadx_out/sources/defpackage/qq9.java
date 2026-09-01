package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qq9 {
    public static final qq9 BOTTOM;
    public static final qq9 TOP;
    public static final /* synthetic */ qq9[] a;
    public static final /* synthetic */ i04 b;

    static {
        qq9 qq9Var = new qq9("TOP", 0);
        TOP = qq9Var;
        qq9 qq9Var2 = new qq9("BOTTOM", 1);
        BOTTOM = qq9Var2;
        qq9[] qq9VarArr = {qq9Var, qq9Var2};
        a = qq9VarArr;
        b = new i04(qq9VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static qq9 valueOf(String str) {
        return (qq9) Enum.valueOf(qq9.class, str);
    }

    public static qq9[] values() {
        return (qq9[]) a.clone();
    }
}
