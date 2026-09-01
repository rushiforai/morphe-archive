package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yq3 {
    public static final yq3 LOGGED_OUT;
    public static final yq3 MAX_SIZE_EXCEEDED;
    public static final yq3 MERGE;
    public static final yq3 POST_DELETED;
    public static final yq3 PUBLISH_RATE_LIMIT;
    public static final yq3 UNKNOWN;
    public static final yq3 UNVERIFIED_EMAIL;
    public static final yq3 USER_SUSPENDED;
    public static final /* synthetic */ yq3[] b;
    public static final /* synthetic */ i04 c;
    public final boolean a;

    static {
        yq3 yq3Var = new yq3(0, "UNKNOWN", false);
        UNKNOWN = yq3Var;
        yq3 yq3Var2 = new yq3(1, "MERGE", true);
        MERGE = yq3Var2;
        yq3 yq3Var3 = new yq3(2, "MAX_SIZE_EXCEEDED", true);
        MAX_SIZE_EXCEEDED = yq3Var3;
        yq3 yq3Var4 = new yq3(3, "LOGGED_OUT", true);
        LOGGED_OUT = yq3Var4;
        yq3 yq3Var5 = new yq3(4, "POST_DELETED", true);
        POST_DELETED = yq3Var5;
        yq3 yq3Var6 = new yq3(5, "PUBLISH_RATE_LIMIT", false);
        PUBLISH_RATE_LIMIT = yq3Var6;
        yq3 yq3Var7 = new yq3(6, "USER_SUSPENDED", false);
        USER_SUSPENDED = yq3Var7;
        yq3 yq3Var8 = new yq3(7, "UNVERIFIED_EMAIL", false);
        UNVERIFIED_EMAIL = yq3Var8;
        yq3[] yq3VarArr = {yq3Var, yq3Var2, yq3Var3, yq3Var4, yq3Var5, yq3Var6, yq3Var7, yq3Var8};
        b = yq3VarArr;
        c = new i04(yq3VarArr);
    }

    public yq3(int i, String str, boolean z) {
        this.a = z;
    }

    public static g04 getEntries() {
        return c;
    }

    public static yq3 valueOf(String str) {
        return (yq3) Enum.valueOf(yq3.class, str);
    }

    public static yq3[] values() {
        return (yq3[]) b.clone();
    }

    public final boolean isPermanent() {
        return this.a;
    }
}
