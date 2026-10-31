package t0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public static final j0 f88051a;

    /* renamed from: b, reason: collision with root package name */
    public static final j0 f88052b;

    /* renamed from: c, reason: collision with root package name */
    public static final j0 f88053c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ j0[] f88054d;

    static {
        j0 j0Var = new j0("Cursor", 0);
        f88051a = j0Var;
        j0 j0Var2 = new j0("SelectionStart", 1);
        f88052b = j0Var2;
        j0 j0Var3 = new j0("SelectionEnd", 2);
        f88053c = j0Var3;
        j0[] j0VarArr = {j0Var, j0Var2, j0Var3};
        f88054d = j0VarArr;
        EnumEntriesKt.a(j0VarArr);
    }

    public static j0 valueOf(String str) {
        return (j0) Enum.valueOf(j0.class, str);
    }

    public static j0[] values() {
        return (j0[]) f88054d.clone();
    }
}
