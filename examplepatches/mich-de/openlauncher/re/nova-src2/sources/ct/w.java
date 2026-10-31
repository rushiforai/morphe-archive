package ct;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class w {

    /* renamed from: b, reason: collision with root package name */
    public static final b6.b f47898b;

    /* renamed from: c, reason: collision with root package name */
    public static final w f47899c;

    /* renamed from: d, reason: collision with root package name */
    public static final w f47900d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ w[] f47901e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f47902f;

    /* renamed from: a, reason: collision with root package name */
    public final String f47903a;

    static {
        w wVar = new w("GooglePay", 0, "google_pay");
        f47899c = wVar;
        w wVar2 = new w("Link", 1, "link");
        f47900d = wVar2;
        w[] wVarArr = {wVar, wVar2, new w("ShopPay", 2, "shop_pay")};
        f47901e = wVarArr;
        f47902f = EnumEntriesKt.a(wVarArr);
        f47898b = new b6.b();
    }

    public w(String str, int i5, String str2) {
        this.f47903a = str2;
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) f47901e.clone();
    }
}
