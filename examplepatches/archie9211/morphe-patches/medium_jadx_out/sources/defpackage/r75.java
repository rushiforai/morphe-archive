package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r75 {
    public static final r75 BUILD_MESSAGE_INFO;
    public static final r75 GET_DEFAULT_INSTANCE;
    public static final r75 GET_MEMOIZED_IS_INITIALIZED;
    public static final r75 GET_PARSER;
    public static final r75 NEW_BUILDER;
    public static final r75 NEW_MUTABLE_INSTANCE;
    public static final r75 SET_MEMOIZED_IS_INITIALIZED;
    public static final /* synthetic */ r75[] a;

    static {
        r75 r75Var = new r75("GET_MEMOIZED_IS_INITIALIZED", 0);
        GET_MEMOIZED_IS_INITIALIZED = r75Var;
        r75 r75Var2 = new r75("SET_MEMOIZED_IS_INITIALIZED", 1);
        SET_MEMOIZED_IS_INITIALIZED = r75Var2;
        r75 r75Var3 = new r75("BUILD_MESSAGE_INFO", 2);
        BUILD_MESSAGE_INFO = r75Var3;
        r75 r75Var4 = new r75("NEW_MUTABLE_INSTANCE", 3);
        NEW_MUTABLE_INSTANCE = r75Var4;
        r75 r75Var5 = new r75("NEW_BUILDER", 4);
        NEW_BUILDER = r75Var5;
        r75 r75Var6 = new r75("GET_DEFAULT_INSTANCE", 5);
        GET_DEFAULT_INSTANCE = r75Var6;
        r75 r75Var7 = new r75("GET_PARSER", 6);
        GET_PARSER = r75Var7;
        a = new r75[]{r75Var, r75Var2, r75Var3, r75Var4, r75Var5, r75Var6, r75Var7};
    }

    public static r75 valueOf(String str) {
        return (r75) Enum.valueOf(r75.class, str);
    }

    public static r75[] values() {
        return (r75[]) a.clone();
    }
}
