package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ec4 {
    public static final ec4 LATEST;
    public static final ec4 OLDEST;
    public static final /* synthetic */ ec4[] a;
    public static final /* synthetic */ i04 b;

    static {
        ec4 ec4Var = new ec4("LATEST", 0);
        LATEST = ec4Var;
        ec4 ec4Var2 = new ec4("OLDEST", 1);
        OLDEST = ec4Var2;
        ec4[] ec4VarArr = {ec4Var, ec4Var2};
        a = ec4VarArr;
        b = new i04(ec4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ec4 valueOf(String str) {
        return (ec4) Enum.valueOf(ec4.class, str);
    }

    public static ec4[] values() {
        return (ec4[]) a.clone();
    }
}
