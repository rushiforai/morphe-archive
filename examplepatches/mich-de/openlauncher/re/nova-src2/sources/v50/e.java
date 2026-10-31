package v50;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final o7.a f92115a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e[] f92116b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i70.a f92117c;

    static {
        e[] eVarArr = {new e("JANUARY", 0), new e("FEBRUARY", 1), new e("MARCH", 2), new e("APRIL", 3), new e("MAY", 4), new e("JUNE", 5), new e("JULY", 6), new e("AUGUST", 7), new e("SEPTEMBER", 8), new e("OCTOBER", 9), new e("NOVEMBER", 10), new e("DECEMBER", 11)};
        f92116b = eVarArr;
        f92117c = EnumEntriesKt.a(eVarArr);
        f92115a = new o7.a(13);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f92116b.clone();
    }
}
