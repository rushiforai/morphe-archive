package zv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: e, reason: collision with root package name */
    public static final a f98686e;

    /* renamed from: f, reason: collision with root package name */
    public static final b f98687f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ b[] f98688g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ i70.a f98689h;

    /* renamed from: a, reason: collision with root package name */
    public final String f98690a;

    /* renamed from: b, reason: collision with root package name */
    public final int f98691b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f98692c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f98693d;

    static {
        b bVar = new b("Visa", 0, "visa", 2131232123, 2132019611, false);
        b bVar2 = new b("Mastercard", 1, "mastercard", 2131232120, 2132019609, false);
        b bVar3 = new b("Amex", 2, "american_express", 2131232115, 2132019606, false);
        b bVar4 = new b("Discover", 3, "discover", 2131232118, 2132019608, false);
        b bVar5 = new b("CartesBancaires", 4, "cartes_bancaires", 2131232117, 2132019607, true);
        b bVar6 = new b("UnionPay", 5, "unionpay", 2131232121, 2132019610, false);
        b bVar7 = new b("Unknown", 6, "unknown", 2131232122, null, false);
        f98687f = bVar7;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5, bVar6, bVar7};
        f98688g = bVarArr;
        f98689h = EnumEntriesKt.a(bVarArr);
        f98686e = new a();
    }

    public b(String str, int i5, String str2, int i11, Integer num, boolean z11) {
        this.f98690a = str2;
        this.f98691b = i11;
        this.f98692c = num;
        this.f98693d = z11;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f98688g.clone();
    }
}
