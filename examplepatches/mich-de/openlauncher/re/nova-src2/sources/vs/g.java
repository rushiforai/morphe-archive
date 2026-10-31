package vs;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f92957a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f92958b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f92959c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f92960d;

    static {
        g gVar = new g("InputtingPrimaryField", 0);
        f92957a = gVar;
        g gVar2 = new g("VerifyingEmail", 1);
        f92958b = gVar2;
        g gVar3 = new g("InputtingRemainingFields", 2);
        f92959c = gVar3;
        g[] gVarArr = {gVar, gVar2, gVar3};
        f92960d = gVarArr;
        EnumEntriesKt.a(gVarArr);
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f92960d.clone();
    }
}
