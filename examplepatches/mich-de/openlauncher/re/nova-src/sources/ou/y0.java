package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public static final y0 f81008a;

    /* renamed from: b, reason: collision with root package name */
    public static final y0 f81009b;

    /* renamed from: c, reason: collision with root package name */
    public static final y0 f81010c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ y0[] f81011d;

    static {
        y0 y0Var = new y0("Link", 0);
        f81008a = y0Var;
        y0 y0Var2 = new y0("GooglePay", 1);
        f81009b = y0Var2;
        y0 y0Var3 = new y0("ShopPay", 2);
        f81010c = y0Var3;
        y0[] y0VarArr = {y0Var, y0Var2, y0Var3};
        f81011d = y0VarArr;
        EnumEntriesKt.a(y0VarArr);
    }

    public static y0 valueOf(String str) {
        return (y0) Enum.valueOf(y0.class, str);
    }

    public static y0[] values() {
        return (y0[]) f81011d.clone();
    }
}
