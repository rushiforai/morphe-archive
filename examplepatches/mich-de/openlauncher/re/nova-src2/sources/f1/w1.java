package f1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class w1 {

    /* renamed from: a, reason: collision with root package name */
    public static final w1 f54065a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ w1[] f54066b;

    static {
        w1 w1Var = new w1("Closed", 0);
        f54065a = w1Var;
        w1[] w1VarArr = {w1Var, new w1("Open", 1)};
        f54066b = w1VarArr;
        EnumEntriesKt.a(w1VarArr);
    }

    public static w1 valueOf(String str) {
        return (w1) Enum.valueOf(w1.class, str);
    }

    public static w1[] values() {
        return (w1[]) f54066b.clone();
    }
}
