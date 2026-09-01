package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d77 implements gm8 {
    public static final d77 LOG_ENVIRONMENT_AUTOPUSH;
    public static final d77 LOG_ENVIRONMENT_PROD;
    public static final d77 LOG_ENVIRONMENT_STAGING;
    public static final d77 LOG_ENVIRONMENT_UNKNOWN;
    public static final /* synthetic */ d77[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        d77 d77Var = new d77("LOG_ENVIRONMENT_UNKNOWN", 0, 0);
        LOG_ENVIRONMENT_UNKNOWN = d77Var;
        d77 d77Var2 = new d77("LOG_ENVIRONMENT_AUTOPUSH", 1, 1);
        LOG_ENVIRONMENT_AUTOPUSH = d77Var2;
        d77 d77Var3 = new d77("LOG_ENVIRONMENT_STAGING", 2, 2);
        LOG_ENVIRONMENT_STAGING = d77Var3;
        d77 d77Var4 = new d77("LOG_ENVIRONMENT_PROD", 3, 3);
        LOG_ENVIRONMENT_PROD = d77Var4;
        d77[] d77VarArr = {d77Var, d77Var2, d77Var3, d77Var4};
        b = d77VarArr;
        c = new i04(d77VarArr);
    }

    public d77(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static d77 valueOf(String str) {
        return (d77) Enum.valueOf(d77.class, str);
    }

    public static d77[] values() {
        return (d77[]) b.clone();
    }

    @Override // defpackage.gm8
    public int getNumber() {
        return this.a;
    }
}
