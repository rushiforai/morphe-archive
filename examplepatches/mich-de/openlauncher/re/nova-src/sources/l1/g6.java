package l1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class g6 {

    /* renamed from: a, reason: collision with root package name */
    public static final g6 f73348a;

    /* renamed from: b, reason: collision with root package name */
    public static final g6 f73349b;

    /* renamed from: c, reason: collision with root package name */
    public static final g6 f73350c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g6[] f73351d;

    static {
        g6 g6Var = new g6("Hidden", 0);
        f73348a = g6Var;
        g6 g6Var2 = new g6("Expanded", 1);
        f73349b = g6Var2;
        g6 g6Var3 = new g6("PartiallyExpanded", 2);
        f73350c = g6Var3;
        f73351d = new g6[]{g6Var, g6Var2, g6Var3};
    }

    public static g6 valueOf(String str) {
        return (g6) Enum.valueOf(g6.class, str);
    }

    public static g6[] values() {
        return (g6[]) f73351d.clone();
    }
}
