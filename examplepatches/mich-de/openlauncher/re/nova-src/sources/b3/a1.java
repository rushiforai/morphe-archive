package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class a1 {

    /* renamed from: a, reason: collision with root package name */
    public static final a1 f17146a;

    /* renamed from: b, reason: collision with root package name */
    public static final a1 f17147b;

    /* renamed from: c, reason: collision with root package name */
    public static final a1 f17148c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ a1[] f17149d;

    static {
        a1 a1Var = new a1("IsPlacedInLookahead", 0);
        f17146a = a1Var;
        a1 a1Var2 = new a1("IsPlacedInApproach", 1);
        f17147b = a1Var2;
        a1 a1Var3 = new a1("IsNotPlaced", 2);
        f17148c = a1Var3;
        a1[] a1VarArr = {a1Var, a1Var2, a1Var3};
        f17149d = a1VarArr;
        EnumEntriesKt.a(a1VarArr);
    }

    public static a1 valueOf(String str) {
        return (a1) Enum.valueOf(a1.class, str);
    }

    public static a1[] values() {
        return (a1[]) f17149d.clone();
    }
}
