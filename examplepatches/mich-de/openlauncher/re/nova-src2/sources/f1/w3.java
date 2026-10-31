package f1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class w3 {

    /* renamed from: a, reason: collision with root package name */
    public static final w3 f54071a;

    /* renamed from: b, reason: collision with root package name */
    public static final w3 f54072b;

    /* renamed from: c, reason: collision with root package name */
    public static final w3 f54073c;

    /* renamed from: d, reason: collision with root package name */
    public static final w3 f54074d;

    /* renamed from: e, reason: collision with root package name */
    public static final w3 f54075e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ w3[] f54076f;

    static {
        w3 w3Var = new w3("TopBar", 0);
        f54071a = w3Var;
        w3 w3Var2 = new w3("MainContent", 1);
        f54072b = w3Var2;
        w3 w3Var3 = new w3("Snackbar", 2);
        f54073c = w3Var3;
        w3 w3Var4 = new w3("Fab", 3);
        f54074d = w3Var4;
        w3 w3Var5 = new w3("BottomBar", 4);
        f54075e = w3Var5;
        w3[] w3VarArr = {w3Var, w3Var2, w3Var3, w3Var4, w3Var5};
        f54076f = w3VarArr;
        EnumEntriesKt.a(w3VarArr);
    }

    public static w3 valueOf(String str) {
        return (w3) Enum.valueOf(w3.class, str);
    }

    public static w3[] values() {
        return (w3[]) f54076f.clone();
    }
}
