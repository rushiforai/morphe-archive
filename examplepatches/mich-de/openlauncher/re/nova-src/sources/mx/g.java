package mx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f77083a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f77084b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f77085c;

    /* renamed from: d, reason: collision with root package name */
    public static final g f77086d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ g[] f77087e;

    static {
        g gVar = new g("DESKTOP", 0);
        f77083a = gVar;
        g gVar2 = new g("DOCK", 1);
        f77084b = gVar2;
        g gVar3 = new g("DRAWER", 2);
        f77085c = gVar3;
        g gVar4 = new g("FOLDER", 3);
        f77086d = gVar4;
        g[] gVarArr = {gVar, gVar2, gVar3, gVar4};
        f77087e = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f77087e.clone();
    }
}
