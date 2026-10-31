package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f80873a;

    /* renamed from: b, reason: collision with root package name */
    public static final g0 f80874b;

    /* renamed from: c, reason: collision with root package name */
    public static final g0 f80875c;

    /* renamed from: d, reason: collision with root package name */
    public static final g0 f80876d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ g0[] f80877e;

    static {
        g0 g0Var = new g0("SavedPaymentMethod", 0);
        f80873a = g0Var;
        g0 g0Var2 = new g0("AddCard", 1);
        f80874b = g0Var2;
        g0 g0Var3 = new g0("GooglePay", 2);
        f80875c = g0Var3;
        g0 g0Var4 = new g0("Link", 3);
        f80876d = g0Var4;
        g0[] g0VarArr = {g0Var, g0Var2, g0Var3, g0Var4};
        f80877e = g0VarArr;
        EnumEntriesKt.a(g0VarArr);
    }

    public static g0 valueOf(String str) {
        return (g0) Enum.valueOf(g0.class, str);
    }

    public static g0[] values() {
        return (g0[]) f80877e.clone();
    }
}
