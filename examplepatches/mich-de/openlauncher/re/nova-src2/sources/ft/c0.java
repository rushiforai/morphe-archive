package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c0 {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f55918b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f55919c;

    /* renamed from: d, reason: collision with root package name */
    public static final c0 f55920d;

    /* renamed from: e, reason: collision with root package name */
    public static final c0 f55921e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ c0[] f55922f;

    /* renamed from: a, reason: collision with root package name */
    public final String f55923a;

    static {
        c0 c0Var = new c0("NotSupportedInElementsSession", 0, "not_supported_in_elements_session");
        f55918b = c0Var;
        c0 c0Var2 = new c0("LinkConfiguration", 1, "link_configuration");
        f55919c = c0Var2;
        c0 c0Var3 = new c0("CardBrandFiltering", 2, "card_brand_filtering");
        f55920d = c0Var3;
        c0 c0Var4 = new c0("BillingDetailsCollection", 3, "billing_details_collection");
        f55921e = c0Var4;
        c0[] c0VarArr = {c0Var, c0Var2, c0Var3, c0Var4};
        f55922f = c0VarArr;
        EnumEntriesKt.a(c0VarArr);
    }

    public c0(String str, int i5, String str2) {
        this.f55923a = str2;
    }

    public static c0 valueOf(String str) {
        return (c0) Enum.valueOf(c0.class, str);
    }

    public static c0[] values() {
        return (c0[]) f55922f.clone();
    }
}
