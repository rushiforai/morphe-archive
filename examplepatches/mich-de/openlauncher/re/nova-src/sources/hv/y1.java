package hv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class y1 {

    /* renamed from: a, reason: collision with root package name */
    public static final y1 f60688a;

    /* renamed from: b, reason: collision with root package name */
    public static final y1 f60689b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ y1[] f60690c;

    static {
        y1 y1Var = new y1("Complete", 0);
        f60688a = y1Var;
        y1 y1Var2 = new y1("Custom", 1);
        f60689b = y1Var2;
        y1[] y1VarArr = {y1Var, y1Var2};
        f60690c = y1VarArr;
        EnumEntriesKt.a(y1VarArr);
    }

    public static y1 valueOf(String str) {
        return (y1) Enum.valueOf(y1.class, str);
    }

    public static y1[] values() {
        return (y1[]) f60690c.clone();
    }
}
