package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static final b6.e f55910b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f55911c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f55912d;

    /* renamed from: e, reason: collision with root package name */
    public static final c f55913e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f55914f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ c[] f55915g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55916h;

    /* renamed from: a, reason: collision with root package name */
    public final String f55917a;

    static {
        c cVar = new c("Credit", 0, "credit");
        f55911c = cVar;
        c cVar2 = new c("Debit", 1, "debit");
        f55912d = cVar2;
        c cVar3 = new c("Prepaid", 2, "prepaid");
        f55913e = cVar3;
        c cVar4 = new c("Unknown", 3, "unknown");
        f55914f = cVar4;
        c[] cVarArr = {cVar, cVar2, cVar3, cVar4};
        f55915g = cVarArr;
        f55916h = EnumEntriesKt.a(cVarArr);
        f55910b = new b6.e(4);
    }

    public c(String str, int i5, String str2) {
        this.f55917a = str2;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f55915g.clone();
    }
}
