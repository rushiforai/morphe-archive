package h20;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f59031a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f59032b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f59033c;

    static {
        a aVar = new a("STANDARD", 0);
        f59031a = aVar;
        a aVar2 = new a("DEEZER", 1);
        f59032b = aVar2;
        a[] aVarArr = {aVar, aVar2};
        f59033c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f59033c.clone();
    }
}
