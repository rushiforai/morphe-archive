package u40;

import java.util.EnumSet;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final EnumSet f90552a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f90553b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f90554c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f90555d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f90556e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f90557f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f90558g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f90559h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f90560i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ a[] f90561j;

    static {
        a aVar = new a("APP_COMPONENT", 0);
        f90553b = aVar;
        a aVar2 = new a("DEVELOPER_SHORTCUT", 1);
        f90554c = aVar2;
        a aVar3 = new a("SEARCH_MORE", 2);
        f90555d = aVar3;
        a aVar4 = new a("STATIC_NAVIGATION", 3);
        f90556e = aVar4;
        a aVar5 = new a("BRANCH_NAVIGATION", 4);
        f90557f = aVar5;
        a aVar6 = new a("CONTACT", 5);
        f90558g = aVar6;
        a aVar7 = new a("API", 6);
        f90559h = aVar7;
        a aVar8 = new a("CUSTOM", 7);
        f90560i = aVar8;
        f90561j = new a[]{aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8};
        f90552a = EnumSet.of(aVar2, aVar4, aVar5, aVar7);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f90561j.clone();
    }
}
