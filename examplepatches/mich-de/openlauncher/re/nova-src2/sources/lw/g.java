package lw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f75129a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f75130b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ g[] f75131c;

    static {
        g gVar = new g("Programmatically", 0);
        f75129a = gVar;
        g gVar2 = new g("SwipedDownByUser", 1);
        f75130b = gVar2;
        g[] gVarArr = {gVar, gVar2};
        f75131c = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f75131c.clone();
    }
}
