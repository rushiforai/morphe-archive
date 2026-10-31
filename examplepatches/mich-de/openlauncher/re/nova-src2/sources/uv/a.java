package uv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ a[] f91563b;

    /* renamed from: a, reason: collision with root package name */
    public final String f91564a;

    static {
        a[] aVarArr = {new a("EC", 0, "EC"), new a("RSA", 1, "RSA")};
        f91563b = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public a(String str, int i5, String str2) {
        this.f91564a = str2;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f91563b.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f91564a;
    }
}
