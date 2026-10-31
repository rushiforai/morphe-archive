package pp;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public static final l f82757a;

    /* renamed from: b, reason: collision with root package name */
    public static final l f82758b;

    /* renamed from: c, reason: collision with root package name */
    public static final l f82759c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ l[] f82760d;

    static {
        l lVar = new l("NONE", 0);
        f82757a = lVar;
        l lVar2 = new l("SEARCH", 1);
        f82758b = lVar2;
        l lVar3 = new l("SEARCH_CLICK", 2);
        f82759c = lVar3;
        l[] lVarArr = {lVar, lVar2, lVar3};
        f82760d = lVarArr;
        EnumEntriesKt.a(lVarArr);
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f82760d.clone();
    }
}
