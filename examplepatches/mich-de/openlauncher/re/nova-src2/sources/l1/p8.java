package l1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class p8 {

    /* renamed from: a, reason: collision with root package name */
    public static final p8 f73794a;

    /* renamed from: b, reason: collision with root package name */
    public static final p8 f73795b;

    /* renamed from: c, reason: collision with root package name */
    public static final p8 f73796c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ p8[] f73797d;

    static {
        p8 p8Var = new p8("Tabs", 0);
        f73794a = p8Var;
        p8 p8Var2 = new p8("Divider", 1);
        f73795b = p8Var2;
        p8 p8Var3 = new p8("Indicator", 2);
        f73796c = p8Var3;
        f73797d = new p8[]{p8Var, p8Var2, p8Var3};
    }

    public static p8 valueOf(String str) {
        return (p8) Enum.valueOf(p8.class, str);
    }

    public static p8[] values() {
        return (p8[]) f73797d.clone();
    }
}
