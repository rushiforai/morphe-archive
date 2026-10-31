package g10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f56847a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f56848b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ g[] f56849c;

    static {
        g gVar = new g("Circle", 0);
        f56847a = gVar;
        g gVar2 = new g("Rect", 1);
        f56848b = gVar2;
        g[] gVarArr = {gVar, gVar2};
        f56849c = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f56849c.clone();
    }
}
