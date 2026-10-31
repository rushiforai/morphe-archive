package e10;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class f2 {

    /* renamed from: a, reason: collision with root package name */
    public static final f2 f51522a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f2[] f51523b;

    /* JADX INFO: Fake field, exist only in values array */
    f2 EF0;

    static {
        f2 f2Var = new f2("SLOW", 0);
        f2 f2Var2 = new f2("STOCK", 1);
        f51522a = f2Var2;
        f51523b = new f2[]{f2Var, f2Var2, new f2("NOVA", 2), new f2("FAST", 3), new f2("FTL", 4)};
    }

    public static f2 valueOf(String str) {
        return (f2) Enum.valueOf(f2.class, str);
    }

    public static f2[] values() {
        return (f2[]) f51523b.clone();
    }
}
