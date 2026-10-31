package rr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f86142a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f86143b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f86144c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a[] f86145d;

    static {
        a aVar = new a("ForData", 0);
        f86142a = aVar;
        a aVar2 = new a("ForInstantDebits", 1);
        f86143b = aVar2;
        a aVar3 = new a("ForToken", 2);
        f86144c = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f86145d = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f86145d.clone();
    }
}
