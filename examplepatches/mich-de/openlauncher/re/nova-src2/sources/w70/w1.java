package w70;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class w1 {

    /* renamed from: a, reason: collision with root package name */
    public static final w1 f94061a;

    /* renamed from: b, reason: collision with root package name */
    public static final w1 f94062b;

    /* renamed from: c, reason: collision with root package name */
    public static final w1 f94063c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ w1[] f94064d;

    static {
        w1 w1Var = new w1("START", 0);
        f94061a = w1Var;
        w1 w1Var2 = new w1("STOP", 1);
        f94062b = w1Var2;
        w1 w1Var3 = new w1("STOP_AND_RESET_REPLAY_CACHE", 2);
        f94063c = w1Var3;
        w1[] w1VarArr = {w1Var, w1Var2, w1Var3};
        f94064d = w1VarArr;
        EnumEntriesKt.a(w1VarArr);
    }

    public static w1 valueOf(String str) {
        return (w1) Enum.valueOf(w1.class, str);
    }

    public static w1[] values() {
        return (w1[]) f94064d.clone();
    }
}
