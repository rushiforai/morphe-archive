package pp;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final g f82738b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f82739c;

    /* renamed from: d, reason: collision with root package name */
    public static final g f82740d;

    /* renamed from: e, reason: collision with root package name */
    public static final g f82741e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ g[] f82742f;

    /* renamed from: a, reason: collision with root package name */
    public final int f82743a;

    static {
        g gVar = new g("TIME", 0, 1);
        f82738b = gVar;
        g gVar2 = new g("WEATHER", 1, 2);
        f82739c = gVar2;
        g gVar3 = new g("BLUETOOTH", 2, 4);
        f82740d = gVar3;
        g gVar4 = new g("WIFI", 3, 8);
        f82741e = gVar4;
        g[] gVarArr = {gVar, gVar2, gVar3, gVar4};
        f82742f = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public g(String str, int i5, int i11) {
        this.f82743a = i11;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f82742f.clone();
    }
}
