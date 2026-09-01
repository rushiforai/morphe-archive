package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class me6 {
    public static final me6 DEPRECATED_LIST_METHODS;
    public static final me6 DROP;
    public static final me6 HIDDEN;
    public static final me6 NOT_CONSIDERED;
    public static final me6 VISIBLE;
    public static final /* synthetic */ me6[] a;

    static {
        me6 me6Var = new me6("HIDDEN", 0);
        HIDDEN = me6Var;
        me6 me6Var2 = new me6("VISIBLE", 1);
        VISIBLE = me6Var2;
        me6 me6Var3 = new me6("DEPRECATED_LIST_METHODS", 2);
        DEPRECATED_LIST_METHODS = me6Var3;
        me6 me6Var4 = new me6("NOT_CONSIDERED", 3);
        NOT_CONSIDERED = me6Var4;
        me6 me6Var5 = new me6("DROP", 4);
        DROP = me6Var5;
        a = new me6[]{me6Var, me6Var2, me6Var3, me6Var4, me6Var5};
    }

    public static me6 valueOf(String str) {
        return (me6) Enum.valueOf(me6.class, str);
    }

    public static me6[] values() {
        return (me6[]) a.clone();
    }
}
