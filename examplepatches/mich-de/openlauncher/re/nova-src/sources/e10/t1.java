package e10;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public static final t1 f51824a;

    /* renamed from: b, reason: collision with root package name */
    public static final t1 f51825b;

    /* renamed from: c, reason: collision with root package name */
    public static final t1 f51826c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ t1[] f51827d;

    static {
        t1 t1Var = new t1("MENU", 0);
        f51824a = t1Var;
        t1 t1Var2 = new t1("MARKET", 1);
        f51825b = t1Var2;
        t1 t1Var3 = new t1("SEARCH", 2);
        f51826c = t1Var3;
        f51827d = new t1[]{t1Var, t1Var2, t1Var3};
    }

    public static t1 valueOf(String str) {
        return (t1) Enum.valueOf(t1.class, str);
    }

    public static t1[] values() {
        return (t1[]) f51827d.clone();
    }
}
