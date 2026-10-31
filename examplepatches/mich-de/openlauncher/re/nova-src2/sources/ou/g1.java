package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g1 {

    /* renamed from: a, reason: collision with root package name */
    public static final g1 f80878a;

    /* renamed from: b, reason: collision with root package name */
    public static final g1 f80879b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ g1[] f80880c;

    static {
        g1 g1Var = new g1("SheetTopWallet", 0);
        f80878a = g1Var;
        g1 g1Var2 = new g1("SheetBottomBuy", 1);
        f80879b = g1Var2;
        g1[] g1VarArr = {g1Var, g1Var2, new g1("None", 2)};
        f80880c = g1VarArr;
        EnumEntriesKt.a(g1VarArr);
    }

    public static g1 valueOf(String str) {
        return (g1) Enum.valueOf(g1.class, str);
    }

    public static g1[] values() {
        return (g1[]) f80880c.clone();
    }
}
