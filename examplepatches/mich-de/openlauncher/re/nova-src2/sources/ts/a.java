package ts;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f89569a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f89570b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f89571c;

    static {
        a aVar = new a("Secondary", 0);
        f89569a = aVar;
        a aVar2 = new a("Primary", 1);
        f89570b = aVar2;
        a[] aVarArr = {aVar, aVar2};
        f89571c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f89571c.clone();
    }
}
