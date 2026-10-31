package androidx.recyclerview.widget;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public static final l1 f15041a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ l1[] f15042b;

    static {
        l1 l1Var = new l1("ALLOW", 0);
        f15041a = l1Var;
        f15042b = new l1[]{l1Var, new l1("PREVENT_WHEN_EMPTY", 1), new l1("PREVENT", 2)};
    }

    public static l1 valueOf(String str) {
        return (l1) Enum.valueOf(l1.class, str);
    }

    public static l1[] values() {
        return (l1[]) f15042b.clone();
    }
}
