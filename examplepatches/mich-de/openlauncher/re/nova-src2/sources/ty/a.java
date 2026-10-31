package ty;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f90093a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f90094b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f90095c;

    static {
        a aVar = new a("NEVER", 0);
        f90093a = aVar;
        a aVar2 = new a("SELF", 1);
        f90094b = aVar2;
        a[] aVarArr = {aVar, aVar2, new a("ALL", 2)};
        f90095c = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f90095c.clone();
    }
}
