package hv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g1 {

    /* renamed from: a, reason: collision with root package name */
    public static final g1 f60269a;

    /* renamed from: b, reason: collision with root package name */
    public static final g1 f60270b;

    /* renamed from: c, reason: collision with root package name */
    public static final g1 f60271c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g1[] f60272d;

    static {
        g1 g1Var = new g1("Disabled", 0);
        f60269a = g1Var;
        g1 g1Var2 = new g1("InBillingDetailsForm", 1);
        f60270b = g1Var2;
        g1 g1Var3 = new g1("OutsideBillingDetailsForm", 2);
        f60271c = g1Var3;
        g1[] g1VarArr = {g1Var, g1Var2, g1Var3};
        f60272d = g1VarArr;
        EnumEntriesKt.a(g1VarArr);
    }

    public static g1 valueOf(String str) {
        return (g1) Enum.valueOf(g1.class, str);
    }

    public static g1[] values() {
        return (g1[]) f60272d.clone();
    }
}
