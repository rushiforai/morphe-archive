package mw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f76972a;

    /* renamed from: b, reason: collision with root package name */
    public static final k f76973b;

    /* renamed from: c, reason: collision with root package name */
    public static final k f76974c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ k[] f76975d;

    static {
        k kVar = new k("Focused", 0);
        f76972a = kVar;
        k kVar2 = new k("UnfocusedEmpty", 1);
        f76973b = kVar2;
        k kVar3 = new k("UnfocusedNotEmpty", 2);
        f76974c = kVar3;
        k[] kVarArr = {kVar, kVar2, kVar3};
        f76975d = kVarArr;
        EnumEntriesKt.a(kVarArr);
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f76975d.clone();
    }
}
