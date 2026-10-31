package bv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f18612a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f18613b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f18614c;

    static {
        a aVar = new a("Primary", 0);
        f18612a = aVar;
        a aVar2 = new a("Secondary", 1);
        f18613b = aVar2;
        a[] aVarArr = {aVar, aVar2};
        f18614c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f18614c.clone();
    }
}
