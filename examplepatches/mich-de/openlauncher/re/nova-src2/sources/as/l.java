package as;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ l[] f15616a;

    static {
        l[] lVarArr = {new l("Min", 0), new l("Full", 1)};
        f15616a = lVarArr;
        EnumEntriesKt.a(lVarArr);
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f15616a.clone();
    }
}
