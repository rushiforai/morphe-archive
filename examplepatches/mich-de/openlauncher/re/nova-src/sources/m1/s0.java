package m1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public static final s0 f75759a;

    /* renamed from: b, reason: collision with root package name */
    public static final s0 f75760b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ s0[] f75761c;

    static {
        s0 s0Var = new s0("Filled", 0);
        f75759a = s0Var;
        s0 s0Var2 = new s0("Outlined", 1);
        f75760b = s0Var2;
        f75761c = new s0[]{s0Var, s0Var2};
    }

    public static s0 valueOf(String str) {
        return (s0) Enum.valueOf(s0.class, str);
    }

    public static s0[] values() {
        return (s0[]) f75761c.clone();
    }
}
