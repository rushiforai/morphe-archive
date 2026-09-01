package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i61 {
    public static final i61 FOR_INCORPORATION;
    public static final i61 FOR_SUBTYPING;
    public static final i61 FROM_EXPRESSION;
    public static final /* synthetic */ i61[] a;

    static {
        i61 i61Var = new i61("FOR_SUBTYPING", 0);
        FOR_SUBTYPING = i61Var;
        i61 i61Var2 = new i61("FOR_INCORPORATION", 1);
        FOR_INCORPORATION = i61Var2;
        i61 i61Var3 = new i61("FROM_EXPRESSION", 2);
        FROM_EXPRESSION = i61Var3;
        a = new i61[]{i61Var, i61Var2, i61Var3};
    }

    public static i61 valueOf(String str) {
        return (i61) Enum.valueOf(i61.class, str);
    }

    public static i61[] values() {
        return (i61[]) a.clone();
    }
}
