package com.stripe.android.link;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f42980a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f42981b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f42982c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f42983d;

    static {
        g gVar = new g("BackPressed", 0);
        f42980a = gVar;
        g gVar2 = new g("LoggedOut", 1);
        f42981b = gVar2;
        g gVar3 = new g("PayAnotherWay", 2);
        f42982c = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f42983d = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f42983d.clone();
    }
}
