package aw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f15701a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f15702b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f15703c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a[] f15704d;

    static {
        a aVar = new a("Automatic", 0);
        f15701a = aVar;
        a aVar2 = new a("Never", 1);
        f15702b = aVar2;
        a aVar3 = new a("Full", 2);
        f15703c = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f15704d = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f15704d.clone();
    }
}
