package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r {

    /* renamed from: b, reason: collision with root package name */
    public static final br.a f56008b;

    /* renamed from: c, reason: collision with root package name */
    public static final r f56009c;

    /* renamed from: d, reason: collision with root package name */
    public static final r f56010d;

    /* renamed from: e, reason: collision with root package name */
    public static final r f56011e;

    /* renamed from: f, reason: collision with root package name */
    public static final r f56012f;

    /* renamed from: g, reason: collision with root package name */
    public static final r f56013g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ r[] f56014h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56015i;

    /* renamed from: a, reason: collision with root package name */
    public final String f56016a;

    static {
        r rVar = new r("Pass", 0, "PASS");
        r rVar2 = new r("Fail", 1, "FAIL");
        f56009c = rVar2;
        r rVar3 = new r("Unavailable", 2, "UNAVAILABLE");
        f56010d = rVar3;
        r rVar4 = new r("Unchecked", 3, "UNCHECKED");
        f56011e = rVar4;
        r rVar5 = new r("StateInvalid", 4, "STATE_INVALID");
        f56012f = rVar5;
        r rVar6 = new r("Unknown", 5, "UNKNOWN");
        f56013g = rVar6;
        r[] rVarArr = {rVar, rVar2, rVar3, rVar4, rVar5, rVar6};
        f56014h = rVarArr;
        f56015i = EnumEntriesKt.a(rVarArr);
        f56008b = new br.a(4);
    }

    public r(String str, int i5, String str2) {
        this.f56016a = str2;
    }

    public static r valueOf(String str) {
        return (r) Enum.valueOf(r.class, str);
    }

    public static r[] values() {
        return (r[]) f56014h.clone();
    }

    public final boolean a() {
        return kotlin.collections.c.f1(new r[]{f56009c, f56010d, f56011e, f56012f}).contains(this);
    }
}
