package qx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f84491a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f84492b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f84493c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f84494d;

    static {
        g gVar = new g("NATIVE", 0);
        f84491a = gVar;
        g gVar2 = new g("BANNER", 1);
        f84492b = gVar2;
        g gVar3 = new g("ICON_ROW", 2);
        f84493c = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f84494d = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f84494d.clone();
    }
}
