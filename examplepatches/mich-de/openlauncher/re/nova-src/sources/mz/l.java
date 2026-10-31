package mz;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l {

    /* renamed from: b, reason: collision with root package name */
    public static final l f77351b;

    /* renamed from: c, reason: collision with root package name */
    public static final l f77352c;

    /* renamed from: d, reason: collision with root package name */
    public static final l f77353d;

    /* renamed from: e, reason: collision with root package name */
    public static final l f77354e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ l[] f77355f;

    /* renamed from: a, reason: collision with root package name */
    public final int f77356a;

    static {
        l lVar = new l("TOP_LEFT", 0, 2131428595);
        f77351b = lVar;
        l lVar2 = new l("TOP_RIGHT", 1, 2131428596);
        f77352c = lVar2;
        l lVar3 = new l("BOTTOM_LEFT", 2, 2131428593);
        f77353d = lVar3;
        l lVar4 = new l("BOTTOM_RIGHT", 3, 2131428594);
        f77354e = lVar4;
        l[] lVarArr = {lVar, lVar2, lVar3, lVar4};
        f77355f = lVarArr;
        EnumEntriesKt.a(lVarArr);
    }

    public l(String str, int i5, int i11) {
        this.f77356a = i11;
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f77355f.clone();
    }
}
