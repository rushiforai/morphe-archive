package kr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f72126b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f72127c;

    /* renamed from: a, reason: collision with root package name */
    public final String f72128a;

    static {
        a aVar = new a("Edit", 0, "edit");
        f72126b = aVar;
        a[] aVarArr = {aVar, new a("Add", 1, "add")};
        f72127c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public a(String str, int i5, String str2) {
        this.f72128a = str2;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f72127c.clone();
    }
}
