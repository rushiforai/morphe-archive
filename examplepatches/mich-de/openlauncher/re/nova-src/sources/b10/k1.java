package b10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k1 {

    /* renamed from: d, reason: collision with root package name */
    public static final k1 f16752d;

    /* renamed from: e, reason: collision with root package name */
    public static final k1 f16753e;

    /* renamed from: f, reason: collision with root package name */
    public static final k1 f16754f;

    /* renamed from: g, reason: collision with root package name */
    public static final k1 f16755g;

    /* renamed from: h, reason: collision with root package name */
    public static final k1 f16756h;

    /* renamed from: i, reason: collision with root package name */
    public static final k1 f16757i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ k1[] f16758j;

    /* renamed from: a, reason: collision with root package name */
    public final String f16759a;

    /* renamed from: b, reason: collision with root package name */
    public final int f16760b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f16761c;

    static {
        k1 k1Var = new k1("PAYWALL", 0, 0, "paywall", true);
        f16752d = k1Var;
        k1 k1Var2 = new k1("REWARDS", 1, 2132019437, "rewards", false);
        f16753e = k1Var2;
        k1 k1Var3 = new k1("SEARCH", 2, 2132018765, "search", false);
        f16754f = k1Var3;
        k1 k1Var4 = new k1("DRAWER", 3, 2132019218, "drawer", false);
        f16755g = k1Var4;
        k1 k1Var5 = new k1("ICONS", 4, 2132019244, "icons", false);
        f16756h = k1Var5;
        k1 k1Var6 = new k1("FINISHED", 5, 2132019023, "finished", false);
        f16757i = k1Var6;
        k1[] k1VarArr = {k1Var, k1Var2, k1Var3, k1Var4, k1Var5, k1Var6};
        f16758j = k1VarArr;
        EnumEntriesKt.a(k1VarArr);
    }

    public k1(String str, int i5, int i11, String str2, boolean z11) {
        this.f16759a = str2;
        this.f16760b = i11;
        this.f16761c = z11;
    }

    public static k1 valueOf(String str) {
        return (k1) Enum.valueOf(k1.class, str);
    }

    public static k1[] values() {
        return (k1[]) f16758j.clone();
    }
}
