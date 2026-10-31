package v70;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f92141a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f92142b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f92143c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a[] f92144d;

    static {
        a aVar = new a("SUSPEND", 0);
        f92141a = aVar;
        a aVar2 = new a("DROP_OLDEST", 1);
        f92142b = aVar2;
        a aVar3 = new a("DROP_LATEST", 2);
        f92143c = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f92144d = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f92144d.clone();
    }
}
