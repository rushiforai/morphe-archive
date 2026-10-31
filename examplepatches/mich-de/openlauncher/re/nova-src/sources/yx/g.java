package yx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f97700a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f97701b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f97702c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f97703d;

    static {
        g gVar = new g("NOT_INITIALIZED", 0);
        f97700a = gVar;
        g gVar2 = new g("INITIALIZING", 1);
        f97701b = gVar2;
        g gVar3 = new g("INITIALIZED", 2);
        f97702c = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f97703d = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f97703d.clone();
    }
}
