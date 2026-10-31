package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a0 f17141a;

    /* renamed from: b, reason: collision with root package name */
    public static final a0 f17142b;

    /* renamed from: c, reason: collision with root package name */
    public static final a0 f17143c;

    /* renamed from: d, reason: collision with root package name */
    public static final a0 f17144d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ a0[] f17145e;

    static {
        a0 a0Var = new a0("LookaheadMeasurement", 0);
        f17141a = a0Var;
        a0 a0Var2 = new a0("LookaheadPlacement", 1);
        f17142b = a0Var2;
        a0 a0Var3 = new a0("Measurement", 2);
        f17143c = a0Var3;
        a0 a0Var4 = new a0("Placement", 3);
        f17144d = a0Var4;
        a0[] a0VarArr = {a0Var, a0Var2, a0Var3, a0Var4};
        f17145e = a0VarArr;
        EnumEntriesKt.a(a0VarArr);
    }

    public static a0 valueOf(String str) {
        return (a0) Enum.valueOf(a0.class, str);
    }

    public static a0[] values() {
        return (a0[]) f17145e.clone();
    }
}
