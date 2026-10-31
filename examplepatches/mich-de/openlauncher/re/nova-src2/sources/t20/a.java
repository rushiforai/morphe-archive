package t20;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f88484a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ a[] f88485b;

    static {
        a aVar = new a("LEFT", 0);
        a aVar2 = new a("TOP", 1);
        f88484a = aVar2;
        a[] aVarArr = {aVar, aVar2, new a("RIGHT", 2), new a("BOTTOM", 3), new a("START", 4), new a("END", 5)};
        f88485b = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f88485b.clone();
    }
}
