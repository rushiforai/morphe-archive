package f1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class d3 {

    /* renamed from: a, reason: collision with root package name */
    public static final d3 f53456a;

    /* renamed from: b, reason: collision with root package name */
    public static final d3 f53457b;

    /* renamed from: c, reason: collision with root package name */
    public static final d3 f53458c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ d3[] f53459d;

    static {
        d3 d3Var = new d3("Hidden", 0);
        f53456a = d3Var;
        d3 d3Var2 = new d3("Expanded", 1);
        f53457b = d3Var2;
        d3 d3Var3 = new d3("HalfExpanded", 2);
        f53458c = d3Var3;
        d3[] d3VarArr = {d3Var, d3Var2, d3Var3};
        f53459d = d3VarArr;
        EnumEntriesKt.a(d3VarArr);
    }

    public static d3 valueOf(String str) {
        return (d3) Enum.valueOf(d3.class, str);
    }

    public static d3[] values() {
        return (d3[]) f53459d.clone();
    }
}
