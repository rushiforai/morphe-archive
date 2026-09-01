package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x57 {
    public static final x57 SHOWING_LESS_LIKE_THIS;
    public static final /* synthetic */ x57[] a;
    public static final /* synthetic */ i04 b;

    static {
        x57 x57Var = new x57("SHOWING_LESS_LIKE_THIS", 0);
        SHOWING_LESS_LIKE_THIS = x57Var;
        x57[] x57VarArr = {x57Var};
        a = x57VarArr;
        b = new i04(x57VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static x57 valueOf(String str) {
        return (x57) Enum.valueOf(x57.class, str);
    }

    public static x57[] values() {
        return (x57[]) a.clone();
    }
}
