package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class et5 {
    public static final et5 Get;
    public static final et5 Post;
    public static final /* synthetic */ et5[] a;
    public static final /* synthetic */ i04 b;

    static {
        et5 et5Var = new et5("Get", 0);
        Get = et5Var;
        et5 et5Var2 = new et5("Post", 1);
        Post = et5Var2;
        et5[] et5VarArr = {et5Var, et5Var2};
        a = et5VarArr;
        b = new i04(et5VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static et5 valueOf(String str) {
        return (et5) Enum.valueOf(et5.class, str);
    }

    public static et5[] values() {
        return (et5[]) a.clone();
    }
}
