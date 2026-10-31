package xw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f96438a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f96439b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f96440c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f96441d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f96442e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f96443f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f96444g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f96445h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f96446i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f96447j;

    /* renamed from: k, reason: collision with root package name */
    public static final a f96448k;

    /* renamed from: l, reason: collision with root package name */
    public static final a f96449l;

    /* renamed from: m, reason: collision with root package name */
    public static final a f96450m;
    public static final a n;
    public static final a o;

    /* renamed from: p, reason: collision with root package name */
    public static final a f96451p;

    /* renamed from: q, reason: collision with root package name */
    public static final a f96452q;

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ a[] f96453r;

    static {
        a aVar = new a("API_NOT_AVAILABLE", 0);
        f96438a = aVar;
        a aVar2 = new a("APP_NOT_INSTALLED", 1);
        f96439b = aVar2;
        a aVar3 = new a("APP_UID_MISMATCH", 2);
        f96440c = aVar3;
        a aVar4 = new a("CANNOT_BIND_TO_SERVICE", 3);
        f96441d = aVar4;
        a aVar5 = new a("CLIENT_TRANSIENT_ERROR", 4);
        f96442e = aVar5;
        a aVar6 = new a("CLOUD_PROJECT_NUMBER_IS_INVALID", 5);
        f96443f = aVar6;
        a aVar7 = new a("GOOGLE_SERVER_UNAVAILABLE", 6);
        f96444g = aVar7;
        a aVar8 = new a("INTEGRITY_TOKEN_PROVIDER_INVALID", 7);
        f96445h = aVar8;
        a aVar9 = new a("INTERNAL_ERROR", 8);
        f96446i = aVar9;
        a aVar10 = new a("NO_ERROR", 9);
        f96447j = aVar10;
        a aVar11 = new a("NETWORK_ERROR", 10);
        f96448k = aVar11;
        a aVar12 = new a("PLAY_SERVICES_NOT_FOUND", 11);
        f96449l = aVar12;
        a aVar13 = new a("PLAY_SERVICES_VERSION_OUTDATED", 12);
        f96450m = aVar13;
        a aVar14 = new a("PLAY_STORE_NOT_FOUND", 13);
        n = aVar14;
        a aVar15 = new a("PLAY_STORE_VERSION_OUTDATED", 14);
        o = aVar15;
        a aVar16 = new a("REQUEST_HASH_TOO_LONG", 15);
        f96451p = aVar16;
        a aVar17 = new a("TOO_MANY_REQUESTS", 16);
        f96452q = aVar17;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9, aVar10, aVar11, aVar12, aVar13, aVar14, aVar15, aVar16, aVar17, new a("BACKEND_VERDICT_FAILED", 17), new a("UNKNOWN", 18)};
        f96453r = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f96453r.clone();
    }
}
