package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q75 {
    public static final q75 BUILD_MESSAGE_INFO;
    public static final q75 GET_DEFAULT_INSTANCE;
    public static final q75 GET_MEMOIZED_IS_INITIALIZED;
    public static final q75 GET_PARSER;
    public static final q75 NEW_BUILDER;
    public static final q75 NEW_MUTABLE_INSTANCE;
    public static final q75 SET_MEMOIZED_IS_INITIALIZED;
    public static final /* synthetic */ q75[] a;

    static {
        q75 q75Var = new q75("GET_MEMOIZED_IS_INITIALIZED", 0);
        GET_MEMOIZED_IS_INITIALIZED = q75Var;
        q75 q75Var2 = new q75("SET_MEMOIZED_IS_INITIALIZED", 1);
        SET_MEMOIZED_IS_INITIALIZED = q75Var2;
        q75 q75Var3 = new q75("BUILD_MESSAGE_INFO", 2);
        BUILD_MESSAGE_INFO = q75Var3;
        q75 q75Var4 = new q75("NEW_MUTABLE_INSTANCE", 3);
        NEW_MUTABLE_INSTANCE = q75Var4;
        q75 q75Var5 = new q75("NEW_BUILDER", 4);
        NEW_BUILDER = q75Var5;
        q75 q75Var6 = new q75("GET_DEFAULT_INSTANCE", 5);
        GET_DEFAULT_INSTANCE = q75Var6;
        q75 q75Var7 = new q75("GET_PARSER", 6);
        GET_PARSER = q75Var7;
        a = new q75[]{q75Var, q75Var2, q75Var3, q75Var4, q75Var5, q75Var6, q75Var7};
    }

    public static q75 valueOf(String str) {
        return (q75) Enum.valueOf(q75.class, str);
    }

    public static q75[] values() {
        return (q75[]) a.clone();
    }
}
