package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f55931b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ d0[] f55932c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55933d;

    /* renamed from: a, reason: collision with root package name */
    public final String f55934a;

    static {
        d0 d0Var = new d0("Passthrough", 0, "PASSTHROUGH");
        d0 d0Var2 = new d0("LinkPaymentMethod", 1, "LINK_PAYMENT_METHOD");
        d0 d0Var3 = new d0("LinkCardBrand", 2, "LINK_CARD_BRAND");
        f55931b = d0Var3;
        d0[] d0VarArr = {d0Var, d0Var2, d0Var3};
        f55932c = d0VarArr;
        f55933d = EnumEntriesKt.a(d0VarArr);
    }

    public d0(String str, int i5, String str2) {
        this.f55934a = str2;
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f55932c.clone();
    }
}
