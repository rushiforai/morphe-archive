package qw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g implements i {

    /* renamed from: b, reason: collision with root package name */
    public static final g f84343b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f84344c;

    /* renamed from: d, reason: collision with root package name */
    public static final g f84345d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ g[] f84346e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f84347f;

    /* renamed from: a, reason: collision with root package name */
    public final String f84348a;

    static {
        g gVar = new g("Jpeg", 0, "image/jpeg");
        f84343b = gVar;
        g gVar2 = new g("Png", 1, "image/png");
        f84344c = gVar2;
        g gVar3 = new g("Webp", 2, "image/webp");
        f84345d = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f84346e = gVarArr;
        f84347f = EnumEntriesKt.a(gVarArr);
    }

    public g(String str, int i5, String str2) {
        this.f84348a = str2;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f84346e.clone();
    }

    @Override // qw.i
    public final String getValue() {
        return this.f84348a;
    }
}
