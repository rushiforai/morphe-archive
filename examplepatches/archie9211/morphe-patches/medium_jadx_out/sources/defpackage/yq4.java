package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yq4 {
    public static final yq4 NO_CONNECTIVITY;
    public static final yq4 SERVER_ERROR;
    public static final yq4 SUCCESS;
    public static final yq4 UNKNOWN_ERROR;
    public static final /* synthetic */ yq4[] a;

    static {
        yq4 yq4Var = new yq4("SUCCESS", 0);
        SUCCESS = yq4Var;
        yq4 yq4Var2 = new yq4("SERVER_ERROR", 1);
        SERVER_ERROR = yq4Var2;
        yq4 yq4Var3 = new yq4("NO_CONNECTIVITY", 2);
        NO_CONNECTIVITY = yq4Var3;
        yq4 yq4Var4 = new yq4("UNKNOWN_ERROR", 3);
        UNKNOWN_ERROR = yq4Var4;
        a = new yq4[]{yq4Var, yq4Var2, yq4Var3, yq4Var4};
    }

    public static yq4 valueOf(String str) {
        return (yq4) Enum.valueOf(yq4.class, str);
    }

    public static yq4[] values() {
        return (yq4[]) a.clone();
    }
}
