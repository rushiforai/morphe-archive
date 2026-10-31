package ui;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f91272a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f91273b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f91274c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a[] f91275d;

    static {
        a aVar = new a("NATIVE", 0);
        f91272a = aVar;
        a aVar2 = new a("CUSTOM_NATIVE", 1);
        f91273b = aVar2;
        a aVar3 = new a("BANNER", 2);
        f91274c = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f91275d = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a[] values() {
        return (a[]) f91275d.clone();
    }
}
