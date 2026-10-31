package s10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f86565a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f86566b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f86567c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a[] f86568d;

    static {
        a aVar = new a("OPT_IN", 0);
        f86565a = aVar;
        a aVar2 = new a("OPT_OUT", 1);
        f86566b = aVar2;
        a aVar3 = new a("DISABLE", 2);
        f86567c = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f86568d = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f86568d.clone();
    }
}
