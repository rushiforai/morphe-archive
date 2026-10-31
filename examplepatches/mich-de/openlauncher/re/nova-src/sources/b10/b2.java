package b10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b2 {

    /* renamed from: a, reason: collision with root package name */
    public static final i1 f16583a;

    /* renamed from: b, reason: collision with root package name */
    public static final b2 f16584b;

    /* renamed from: c, reason: collision with root package name */
    public static final b2 f16585c;

    /* renamed from: d, reason: collision with root package name */
    public static final b2 f16586d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b2[] f16587e;

    static {
        b2 b2Var = new b2("BEFORE_SETTINGS", 0);
        f16584b = b2Var;
        b2 b2Var2 = new b2("AFTER_SETTINGS", 1);
        f16585c = b2Var2;
        b2 b2Var3 = new b2("DISABLED", 2);
        f16586d = b2Var3;
        b2[] b2VarArr = {b2Var, b2Var2, b2Var3};
        f16587e = b2VarArr;
        EnumEntriesKt.a(b2VarArr);
        f16583a = new i1();
    }

    public static b2 valueOf(String str) {
        return (b2) Enum.valueOf(b2.class, str);
    }

    public static b2[] values() {
        return (b2[]) f16587e.clone();
    }
}
