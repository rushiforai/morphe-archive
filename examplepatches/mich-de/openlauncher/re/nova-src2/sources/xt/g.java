package xt;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final g f96322b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f96323c;

    /* renamed from: d, reason: collision with root package name */
    public static final g f96324d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ g[] f96325e;

    /* renamed from: a, reason: collision with root package name */
    public final ft.d f96326a;

    static {
        g gVar = new g(0, ft.d.f55925c, "RequestedReuse");
        f96322b = gVar;
        g gVar2 = new g(1, ft.d.f55926d, "RequestedNoReuse");
        f96323c = gVar2;
        g gVar3 = new g(2, null, "NoRequest");
        f96324d = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f96325e = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public g(int i5, ft.d dVar, String str) {
        this.f96326a = dVar;
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f96325e.clone();
    }
}
