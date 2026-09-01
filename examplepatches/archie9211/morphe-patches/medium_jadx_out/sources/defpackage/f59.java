package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f59 {
    public static final f59 Clockwise;
    public static final f59 CounterClockwise;
    public static final /* synthetic */ f59[] a;
    public static final /* synthetic */ i04 b;

    static {
        f59 f59Var = new f59("CounterClockwise", 0);
        CounterClockwise = f59Var;
        f59 f59Var2 = new f59("Clockwise", 1);
        Clockwise = f59Var2;
        f59[] f59VarArr = {f59Var, f59Var2};
        a = f59VarArr;
        b = new i04(f59VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static f59 valueOf(String str) {
        return (f59) Enum.valueOf(f59.class, str);
    }

    public static f59[] values() {
        return (f59[]) a.clone();
    }
}
