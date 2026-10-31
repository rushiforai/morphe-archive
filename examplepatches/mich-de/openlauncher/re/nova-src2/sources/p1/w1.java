package p1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class w1 {

    /* renamed from: a, reason: collision with root package name */
    public static final w1 f81613a;

    /* renamed from: b, reason: collision with root package name */
    public static final w1 f81614b;

    /* renamed from: c, reason: collision with root package name */
    public static final w1 f81615c;

    /* renamed from: d, reason: collision with root package name */
    public static final w1 f81616d;

    /* renamed from: e, reason: collision with root package name */
    public static final w1 f81617e;

    /* renamed from: f, reason: collision with root package name */
    public static final w1 f81618f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ w1[] f81619g;

    static {
        w1 w1Var = new w1("ShutDown", 0);
        f81613a = w1Var;
        w1 w1Var2 = new w1("ShuttingDown", 1);
        f81614b = w1Var2;
        w1 w1Var3 = new w1("Inactive", 2);
        f81615c = w1Var3;
        w1 w1Var4 = new w1("InactivePendingWork", 3);
        f81616d = w1Var4;
        w1 w1Var5 = new w1("Idle", 4);
        f81617e = w1Var5;
        w1 w1Var6 = new w1("PendingWork", 5);
        f81618f = w1Var6;
        w1[] w1VarArr = {w1Var, w1Var2, w1Var3, w1Var4, w1Var5, w1Var6};
        f81619g = w1VarArr;
        EnumEntriesKt.a(w1VarArr);
    }

    public static w1 valueOf(String str) {
        return (w1) Enum.valueOf(w1.class, str);
    }

    public static w1[] values() {
        return (w1[]) f81619g.clone();
    }
}
