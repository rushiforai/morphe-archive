package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ze4 {
    public static final ze4 ERROR;
    public static final ze4 LOADING;
    public static final ze4 NOT_LOADED;
    public static final ze4 SUCCESS;
    public static final /* synthetic */ ze4[] a;

    static {
        ze4 ze4Var = new ze4("NOT_LOADED", 0);
        NOT_LOADED = ze4Var;
        ze4 ze4Var2 = new ze4("LOADING", 1);
        LOADING = ze4Var2;
        ze4 ze4Var3 = new ze4("SUCCESS", 2);
        SUCCESS = ze4Var3;
        ze4 ze4Var4 = new ze4("ERROR", 3);
        ERROR = ze4Var4;
        a = new ze4[]{ze4Var, ze4Var2, ze4Var3, ze4Var4};
    }

    public static ze4 valueOf(String str) {
        return (ze4) Enum.valueOf(ze4.class, str);
    }

    public static ze4[] values() {
        return (ze4[]) a.clone();
    }
}
