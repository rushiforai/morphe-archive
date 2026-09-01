package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ig5 {
    public static final ig5 ThreeForTwo;
    public static final ig5 TwoForOne;
    public static final /* synthetic */ ig5[] a;
    public static final /* synthetic */ i04 b;

    static {
        ig5 ig5Var = new ig5("ThreeForTwo", 0);
        ThreeForTwo = ig5Var;
        ig5 ig5Var2 = new ig5("TwoForOne", 1);
        TwoForOne = ig5Var2;
        ig5[] ig5VarArr = {ig5Var, ig5Var2};
        a = ig5VarArr;
        b = new i04(ig5VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ig5 valueOf(String str) {
        return (ig5) Enum.valueOf(ig5.class, str);
    }

    public static ig5[] values() {
        return (ig5[]) a.clone();
    }
}
