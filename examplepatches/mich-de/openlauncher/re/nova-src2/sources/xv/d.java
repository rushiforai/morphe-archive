package xv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d {

    /* renamed from: c, reason: collision with root package name */
    public static final w6.b f96428c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f96429d;

    /* renamed from: e, reason: collision with root package name */
    public static final d f96430e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f96431f;

    /* renamed from: g, reason: collision with root package name */
    public static final d f96432g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f96433h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ d[] f96434i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ i70.a f96435j;

    /* renamed from: a, reason: collision with root package name */
    public final String f96436a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f96437b;

    static {
        d dVar = new d("Text", 0, "01", true);
        f96429d = dVar;
        d dVar2 = new d("SingleSelect", 1, "02", true);
        f96430e = dVar2;
        d dVar3 = new d("MultiSelect", 2, "03", true);
        f96431f = dVar3;
        d dVar4 = new d("OutOfBand", 3, "04", false);
        f96432g = dVar4;
        d dVar5 = new d("Html", 4, "05", false);
        f96433h = dVar5;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4, dVar5};
        f96434i = dVarArr;
        f96435j = EnumEntriesKt.a(dVarArr);
        f96428c = new w6.b();
    }

    public d(String str, int i5, String str2, boolean z11) {
        this.f96436a = str2;
        this.f96437b = z11;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f96434i.clone();
    }
}
