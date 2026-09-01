package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sd3 {
    public static final rd3 Companion;
    public static final sd3 FROM_YOUR_FOLLOWING;
    public static final sd3 TOP_POSTS;
    public static final /* synthetic */ sd3[] a;
    public static final /* synthetic */ i04 b;

    static {
        sd3 sd3Var = new sd3("TOP_POSTS", 0);
        TOP_POSTS = sd3Var;
        sd3 sd3Var2 = new sd3("FROM_YOUR_FOLLOWING", 1);
        FROM_YOUR_FOLLOWING = sd3Var2;
        sd3[] sd3VarArr = {sd3Var, sd3Var2};
        a = sd3VarArr;
        b = new i04(sd3VarArr);
        Companion = new rd3();
    }

    public static g04 getEntries() {
        return b;
    }

    public static sd3 valueOf(String str) {
        return (sd3) Enum.valueOf(sd3.class, str);
    }

    public static sd3[] values() {
        return (sd3[]) a.clone();
    }
}
