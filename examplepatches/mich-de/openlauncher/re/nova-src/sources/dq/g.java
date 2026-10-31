package dq;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final g f49329b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f49330c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f49331d;

    /* renamed from: a, reason: collision with root package name */
    public final String f49332a;

    static {
        g gVar = new g("Default", 0, "DEFAULT");
        f49329b = gVar;
        g gVar2 = new g("CompleteImmediatePurchase", 1, "COMPLETE_IMMEDIATE_PURCHASE");
        f49330c = gVar2;
        g[] gVarArr = {gVar, gVar2};
        f49331d = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public g(String str, int i5, String str2) {
        this.f49332a = str2;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f49331d.clone();
    }
}
