package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b34 {
    public static final b34 CLICK;
    public static final b34 SELECTED;
    public static final b34 TEXT_CHANGED;
    public static final /* synthetic */ b34[] a;

    static {
        b34 b34Var = new b34("CLICK", 0);
        CLICK = b34Var;
        b34 b34Var2 = new b34("SELECTED", 1);
        SELECTED = b34Var2;
        b34 b34Var3 = new b34("TEXT_CHANGED", 2);
        TEXT_CHANGED = b34Var3;
        a = new b34[]{b34Var, b34Var2, b34Var3};
    }

    public static b34 valueOf(String str) {
        return (b34) Enum.valueOf(b34.class, str);
    }

    public static b34[] values() {
        return (b34[]) a.clone();
    }
}
