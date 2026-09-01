package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oi6 {
    public static final oi6 CONTEXT;
    public static final oi6 EXTENSION_RECEIVER;
    public static final oi6 INSTANCE;
    public static final oi6 VALUE;
    public static final /* synthetic */ oi6[] a;
    public static final /* synthetic */ i04 b;

    static {
        oi6 oi6Var = new oi6("INSTANCE", 0);
        INSTANCE = oi6Var;
        oi6 oi6Var2 = new oi6("CONTEXT", 1);
        CONTEXT = oi6Var2;
        oi6 oi6Var3 = new oi6("EXTENSION_RECEIVER", 2);
        EXTENSION_RECEIVER = oi6Var3;
        oi6 oi6Var4 = new oi6("VALUE", 3);
        VALUE = oi6Var4;
        oi6[] oi6VarArr = {oi6Var, oi6Var2, oi6Var3, oi6Var4};
        a = oi6VarArr;
        b = new i04(oi6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static oi6 valueOf(String str) {
        return (oi6) Enum.valueOf(oi6.class, str);
    }

    public static oi6[] values() {
        return (oi6[]) a.clone();
    }
}
