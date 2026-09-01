package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r99 {
    public static final r99 OPAQUE;
    public static final r99 TRANSLUCENT;
    public static final r99 UNCHANGED;
    public static final /* synthetic */ r99[] a;
    public static final /* synthetic */ i04 b;

    static {
        r99 r99Var = new r99("UNCHANGED", 0);
        UNCHANGED = r99Var;
        r99 r99Var2 = new r99("TRANSLUCENT", 1);
        TRANSLUCENT = r99Var2;
        r99 r99Var3 = new r99("OPAQUE", 2);
        OPAQUE = r99Var3;
        r99[] r99VarArr = {r99Var, r99Var2, r99Var3};
        a = r99VarArr;
        b = new i04(r99VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static r99 valueOf(String str) {
        return (r99) Enum.valueOf(r99.class, str);
    }

    public static r99[] values() {
        return (r99[]) a.clone();
    }
}
