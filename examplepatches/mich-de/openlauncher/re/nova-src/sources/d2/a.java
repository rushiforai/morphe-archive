package d2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f48847a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f48848b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f48849c;

    static {
        a aVar = new a("SHOW_ORIGINAL", 0);
        f48847a = aVar;
        a aVar2 = new a("SHOW_TRANSLATED", 1);
        f48848b = aVar2;
        a[] aVarArr = {aVar, aVar2};
        f48849c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f48849c.clone();
    }
}
