package ht;

import b6.e;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final e f60051b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f60052c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f60053d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f60054e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f60055f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f60056g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f60057h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f60058i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ a[] f60059j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ i70.a f60060k;

    /* renamed from: a, reason: collision with root package name */
    public final String f60061a;

    static {
        a aVar = new a("AmexExpressCheckout", 0, "amex_express_checkout");
        f60052c = aVar;
        a aVar2 = new a("ApplePay", 1, "apple_pay");
        f60053d = aVar2;
        a aVar3 = new a("GooglePay", 2, "google_pay");
        f60054e = aVar3;
        a aVar4 = new a("Masterpass", 3, "master_pass");
        f60055f = aVar4;
        a aVar5 = new a("SamsungPay", 4, "samsung_pay");
        f60056g = aVar5;
        a aVar6 = new a("VisaCheckout", 5, "visa_checkout");
        f60057h = aVar6;
        a aVar7 = new a("Link", 6, "link");
        f60058i = aVar7;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7};
        f60059j = aVarArr;
        f60060k = EnumEntriesKt.a(aVarArr);
        f60051b = new e(9);
    }

    public a(String str, int i5, String str2) {
        this.f60061a = str2;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f60059j.clone();
    }
}
