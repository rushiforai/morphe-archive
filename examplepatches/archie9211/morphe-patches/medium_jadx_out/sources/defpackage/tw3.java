package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tw3 {
    public static final tw3 AVAILABLE;
    public static final tw3 BLOCKED;
    public static final rw3 Companion;
    public static final tw3 SUBSCRIBED_BY_EMAIL;
    public static final tw3 UNAVAILABLE;
    public static final /* synthetic */ tw3[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    static {
        tw3 tw3Var = new tw3("AVAILABLE", 0, "available");
        AVAILABLE = tw3Var;
        tw3 tw3Var2 = new tw3("UNAVAILABLE", 1, "unavailable");
        UNAVAILABLE = tw3Var2;
        tw3 tw3Var3 = new tw3("SUBSCRIBED_BY_EMAIL", 2, "subscribed-by-email");
        SUBSCRIBED_BY_EMAIL = tw3Var3;
        tw3 tw3Var4 = new tw3("BLOCKED", 3, "blocked");
        BLOCKED = tw3Var4;
        tw3[] tw3VarArr = {tw3Var, tw3Var2, tw3Var3, tw3Var4};
        b = tw3VarArr;
        c = new i04(tw3VarArr);
        Companion = new rw3();
    }

    public tw3(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static tw3 valueOf(String str) {
        return (tw3) Enum.valueOf(tw3.class, str);
    }

    public static tw3[] values() {
        return (tw3[]) b.clone();
    }

    public final String getValue() {
        return this.a;
    }
}
