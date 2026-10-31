package l3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f74630a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f74631b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f74632c;

    static {
        a aVar = new a("On", 0);
        f74630a = aVar;
        a aVar2 = new a("Off", 1);
        f74631b = aVar2;
        a[] aVarArr = {aVar, aVar2, new a("Indeterminate", 2)};
        f74632c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f74632c.clone();
    }
}
