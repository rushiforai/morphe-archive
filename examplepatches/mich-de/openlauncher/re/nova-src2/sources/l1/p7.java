package l1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class p7 {

    /* renamed from: a, reason: collision with root package name */
    public static final p7 f73791a;

    /* renamed from: b, reason: collision with root package name */
    public static final p7 f73792b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ p7[] f73793c;

    static {
        p7 p7Var = new p7("Dismissed", 0);
        f73791a = p7Var;
        p7 p7Var2 = new p7("ActionPerformed", 1);
        f73792b = p7Var2;
        f73793c = new p7[]{p7Var, p7Var2};
    }

    public static p7 valueOf(String str) {
        return (p7) Enum.valueOf(p7.class, str);
    }

    public static p7[] values() {
        return (p7[]) f73793c.clone();
    }
}
