package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ns0 {
    public static final ns0 BLOCKED;
    public static final ns0 CANT_BLOCK;
    public static final ns0 ERROR;
    public static final ns0 NOT_BLOCKED;
    public static final /* synthetic */ ns0[] a;
    public static final /* synthetic */ i04 b;

    static {
        ns0 ns0Var = new ns0("BLOCKED", 0);
        BLOCKED = ns0Var;
        ns0 ns0Var2 = new ns0("NOT_BLOCKED", 1);
        NOT_BLOCKED = ns0Var2;
        ns0 ns0Var3 = new ns0("CANT_BLOCK", 2);
        CANT_BLOCK = ns0Var3;
        ns0 ns0Var4 = new ns0("ERROR", 3);
        ERROR = ns0Var4;
        ns0[] ns0VarArr = {ns0Var, ns0Var2, ns0Var3, ns0Var4};
        a = ns0VarArr;
        b = new i04(ns0VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ns0 valueOf(String str) {
        return (ns0) Enum.valueOf(ns0.class, str);
    }

    public static ns0[] values() {
        return (ns0[]) a.clone();
    }
}
