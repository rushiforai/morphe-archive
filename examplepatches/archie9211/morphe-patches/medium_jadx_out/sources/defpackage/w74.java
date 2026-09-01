package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w74 {
    public static final w74 BOTH;
    public static final w74 CONFLICTS_ONLY;
    public static final w74 SUCCESS_ONLY;
    public static final /* synthetic */ w74[] a;

    static {
        w74 w74Var = new w74("CONFLICTS_ONLY", 0);
        CONFLICTS_ONLY = w74Var;
        w74 w74Var2 = new w74("SUCCESS_ONLY", 1);
        SUCCESS_ONLY = w74Var2;
        w74 w74Var3 = new w74("BOTH", 2);
        BOTH = w74Var3;
        a = new w74[]{w74Var, w74Var2, w74Var3};
    }

    public static w74 valueOf(String str) {
        return (w74) Enum.valueOf(w74.class, str);
    }

    public static w74[] values() {
        return (w74[]) a.clone();
    }
}
