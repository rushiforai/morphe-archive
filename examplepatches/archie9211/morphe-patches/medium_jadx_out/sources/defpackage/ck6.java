package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ck6 {
    public static final ck6 INTERNAL;
    public static final ck6 PRIVATE;
    public static final ck6 PROTECTED;
    public static final ck6 PUBLIC;
    public static final /* synthetic */ ck6[] a;
    public static final /* synthetic */ i04 b;

    static {
        ck6 ck6Var = new ck6("PUBLIC", 0);
        PUBLIC = ck6Var;
        ck6 ck6Var2 = new ck6("PROTECTED", 1);
        PROTECTED = ck6Var2;
        ck6 ck6Var3 = new ck6("INTERNAL", 2);
        INTERNAL = ck6Var3;
        ck6 ck6Var4 = new ck6("PRIVATE", 3);
        PRIVATE = ck6Var4;
        ck6[] ck6VarArr = {ck6Var, ck6Var2, ck6Var3, ck6Var4};
        a = ck6VarArr;
        b = new i04(ck6VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ck6 valueOf(String str) {
        return (ck6) Enum.valueOf(ck6.class, str);
    }

    public static ck6[] values() {
        return (ck6[]) a.clone();
    }
}
