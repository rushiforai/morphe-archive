package xv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f96415b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f96416c;

    /* renamed from: a, reason: collision with root package name */
    public final String f96417a;

    static {
        a aVar = new a("UserSelected", 0, "01");
        f96415b = aVar;
        a[] aVarArr = {aVar, new a("Reserved", 1, "02"), new a("TransactionTimedOutDecoupled", 2, "03"), new a("TransactionTimedOutOther", 3, "04"), new a("TransactionTimedOutFirstCreq", 4, "05"), new a("TransactionError", 5, "06"), new a("Unknown", 6, "07")};
        f96416c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public a(String str, int i5, String str2) {
        this.f96417a = str2;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f96416c.clone();
    }
}
