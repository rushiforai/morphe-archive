package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final a f55873c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f55874d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f55875e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f55876f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f55877g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f55878h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f55879i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f55880j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ a[] f55881k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55882l;

    /* renamed from: a, reason: collision with root package name */
    public final String f55883a;

    /* renamed from: b, reason: collision with root package name */
    public final b f55884b;

    static {
        a aVar = new a("Visa", 0, "VISA", b.o);
        f55873c = aVar;
        a aVar2 = new a("Mastercard", 1, "MASTERCARD", b.f55886p);
        f55874d = aVar2;
        a aVar3 = new a("AmericanExpress", 2, "AMERICAN_EXPRESS", b.f55887q);
        f55875e = aVar3;
        a aVar4 = new a("JCB", 3, "JCB", b.f55889s);
        f55876f = aVar4;
        a aVar5 = new a("DinersClub", 4, "DINERS_CLUB", b.f55890t);
        f55877g = aVar5;
        a aVar6 = new a("Discover", 5, "DISCOVER", b.f55888r);
        f55878h = aVar6;
        a aVar7 = new a("UnionPay", 6, "UNIONPAY", b.f55891u);
        f55879i = aVar7;
        a aVar8 = new a("CartesBancaires", 7, "CARTES_BANCAIRES", b.f55892v);
        f55880j = aVar8;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8};
        f55881k = aVarArr;
        f55882l = EnumEntriesKt.a(aVarArr);
    }

    public a(String str, int i5, String str2, b bVar) {
        this.f55883a = str2;
        this.f55884b = bVar;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f55881k.clone();
    }
}
