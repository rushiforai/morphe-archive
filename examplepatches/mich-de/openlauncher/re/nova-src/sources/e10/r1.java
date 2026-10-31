package e10;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class r1 {

    /* renamed from: a, reason: collision with root package name */
    public static final r1 f51783a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ r1[] f51784b;

    /* JADX INFO: Fake field, exist only in values array */
    r1 EF0;

    static {
        r1 r1Var = new r1("SLOW", 0);
        r1 r1Var2 = new r1("STOCK", 1);
        r1 r1Var3 = new r1("NOVA", 2);
        f51783a = r1Var3;
        f51784b = new r1[]{r1Var, r1Var2, r1Var3, new r1("FAST", 3), new r1("FTL", 4)};
    }

    public static r1 valueOf(String str) {
        return (r1) Enum.valueOf(r1.class, str);
    }

    public static r1[] values() {
        return (r1[]) f51784b.clone();
    }
}
