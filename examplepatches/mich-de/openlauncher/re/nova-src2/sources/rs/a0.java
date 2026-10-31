package rs;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a0 f86149a;

    /* renamed from: b, reason: collision with root package name */
    public static final a0 f86150b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a0[] f86151c;

    static {
        a0 a0Var = new a0("InsteadOfSaveForFutureUse", 0);
        f86149a = a0Var;
        a0 a0Var2 = new a0("AlongsideSaveForFutureUse", 1);
        f86150b = a0Var2;
        a0[] a0VarArr = {a0Var, a0Var2};
        f86151c = a0VarArr;
        EnumEntriesKt.a(a0VarArr);
    }

    public static a0 valueOf(String str) {
        return (a0) Enum.valueOf(a0.class, str);
    }

    public static a0[] values() {
        return (a0[]) f86151c.clone();
    }
}
