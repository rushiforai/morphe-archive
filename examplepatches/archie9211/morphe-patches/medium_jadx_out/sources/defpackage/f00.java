package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f00 {
    public static final f00 BeforeAutoPersistedQueries;
    public static final f00 BeforeCache;
    public static final f00 BeforeNetwork;
    public static final f00 BeforeRetryOnError;
    public static final /* synthetic */ f00[] a;
    public static final /* synthetic */ i04 b;

    static {
        f00 f00Var = new f00("BeforeCache", 0);
        BeforeCache = f00Var;
        f00 f00Var2 = new f00("BeforeAutoPersistedQueries", 1);
        BeforeAutoPersistedQueries = f00Var2;
        f00 f00Var3 = new f00("BeforeRetryOnError", 2);
        BeforeRetryOnError = f00Var3;
        f00 f00Var4 = new f00("BeforeNetwork", 3);
        BeforeNetwork = f00Var4;
        f00[] f00VarArr = {f00Var, f00Var2, f00Var3, f00Var4};
        a = f00VarArr;
        b = new i04(f00VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static f00 valueOf(String str) {
        return (f00) Enum.valueOf(f00.class, str);
    }

    public static f00[] values() {
        return (f00[]) a.clone();
    }
}
