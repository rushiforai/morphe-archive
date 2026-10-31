package bg;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f17864a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f17865b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f17866c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f17867d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f17868e;

    /* renamed from: f, reason: collision with root package name */
    public static final b f17869f;

    /* renamed from: g, reason: collision with root package name */
    public static final b f17870g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ b[] f17871h;

    static {
        b bVar = new b("BANNER", 0);
        f17864a = bVar;
        b bVar2 = new b("INTERSTITIAL", 1);
        f17865b = bVar2;
        b bVar3 = new b("REWARDED", 2);
        f17866c = bVar3;
        b bVar4 = new b("REWARDED_INTERSTITIAL", 3);
        f17867d = bVar4;
        b bVar5 = new b("NATIVE", 4);
        f17868e = bVar5;
        b bVar6 = new b("UNKNOWN", 5);
        f17869f = bVar6;
        b bVar7 = new b("APP_OPEN_AD", 6);
        f17870g = bVar7;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5, bVar6, bVar7};
        f17871h = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b[] values() {
        return (b[]) f17871h.clone();
    }
}
