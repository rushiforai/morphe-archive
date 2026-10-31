package e00;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i4 {

    /* renamed from: a, reason: collision with root package name */
    public static final i4 f50512a;

    /* renamed from: b, reason: collision with root package name */
    public static final i4 f50513b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i4[] f50514c;

    static {
        i4 i4Var = new i4("DIRECT_LICENSE", 0);
        f50512a = i4Var;
        i4 i4Var2 = new i4("PRO_KEY_APK", 1);
        f50513b = i4Var2;
        i4[] i4VarArr = {i4Var, i4Var2};
        f50514c = i4VarArr;
        EnumEntriesKt.a(i4VarArr);
    }

    public static i4 valueOf(String str) {
        return (i4) Enum.valueOf(i4.class, str);
    }

    public static i4[] values() {
        return (i4[]) f50514c.clone();
    }
}
