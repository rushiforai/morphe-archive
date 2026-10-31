package ys;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public static final l f97502a;

    /* renamed from: b, reason: collision with root package name */
    public static final l f97503b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ l[] f97504c;

    static {
        l lVar = new l("Filled", 0);
        f97502a = lVar;
        l lVar2 = new l("Outlined", 1);
        f97503b = lVar2;
        l[] lVarArr = {lVar, lVar2};
        f97504c = lVarArr;
        EnumEntriesKt.a(lVarArr);
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f97504c.clone();
    }
}
